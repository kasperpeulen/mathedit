// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library test.backend.invoker;

import 'dart:async';

import 'package:stack_trace/stack_trace.dart';

import '../backend/group.dart';
import '../frontend/expect.dart';
import '../utils.dart';
import 'closed_exception.dart';
import 'live_test.dart';
import 'live_test_controller.dart';
import 'metadata.dart';
import 'operating_system.dart';
import 'outstanding_callback_counter.dart';
import 'state.dart';
import 'suite.dart';
import 'test.dart';
import 'test_platform.dart';

/// A test in this isolate.
class LocalTest extends Test {
  final String name;
  final Metadata metadata;

  /// The test body.
  final AsyncFunction _body;

  LocalTest(this.name, this.metadata, body())
      : _body = body;

  /// Loads a single runnable instance of this test.
  LiveTest load(Suite suite, {Iterable<Group> groups}) {
    var invoker = new Invoker._(suite, this, groups: groups);
    return invoker.liveTest;
  }

  Test forPlatform(TestPlatform platform, {OperatingSystem os}) {
    if (!metadata.testOn.evaluate(platform, os: os)) return null;
    return new LocalTest(name, metadata.forPlatform(platform, os: os), _body);
  }
}

/// The class responsible for managing the lifecycle of a single local test.
///
/// The current invoker is accessible within the zone scope of the running test
/// using [Invoker.current]. It's used to track asynchronous callbacks and
/// report asynchronous errors.
class Invoker {
  /// The live test being driven by the invoker.
  ///
  /// This provides a view into the state of the test being executed.
  LiveTest get liveTest => _controller.liveTest;
  LiveTestController _controller;

  bool get _closable => Zone.current[_closableKey];

  /// An opaque object used as a key in the zone value map to identify
  /// [_closable].
  ///
  /// This is an instance variable to ensure that multiple invokers don't step
  /// on one anothers' toes.
  final _closableKey = new Object();

  /// Whether the test has been closed.
  ///
  /// Once the test is closed, [expect] and [expectAsync] will throw
  /// [ClosedException]s whenever accessed to help the test stop executing as
  /// soon as possible.
  bool get closed => _closable && _onCloseCompleter.isCompleted;

  /// A future that completes once the test has been closed.
  Future get onClose => _closable
      ? _onCloseCompleter.future
      // If we're in an unclosable block, return a future that will never
      // complete.
      : new Completer().future;
  final _onCloseCompleter = new Completer();

  /// The test being run.
  LocalTest get _test => liveTest.test as LocalTest;

  /// The outstanding callback counter for the current zone.
  OutstandingCallbackCounter get _outstandingCallbacks {
    var counter = Zone.current[_counterKey];
    if (counter != null) return counter;
    throw new StateError("Can't add or remove outstanding callbacks outside "
        "of a test body.");
  }

  /// An opaque object used as a key in the zone value map to identify
  /// [_outstandingCallbacks].
  ///
  /// This is an instance variable to ensure that multiple invokers don't step
  /// on one anothers' toes.
  final _counterKey = new Object();

  /// The current invoker, or `null` if none is defined.
  ///
  /// An invoker is only set within the zone scope of a running test.
  static Invoker get current {
    // TODO(nweiz): Use a private symbol when dart2js supports it (issue 17526).
    return Zone.current[#test.invoker];
  }

  /// The zone that the top level of [_test.body] is running in.
  ///
  /// Tracking this ensures that [_timeoutTimer] isn't created in a
  /// timer-mocking zone created by the test.
  Zone _invokerZone;

  /// The timer for tracking timeouts.
  ///
  /// This will be `null` until the test starts running.
  Timer _timeoutTimer;

  Invoker._(Suite suite, LocalTest test, {Iterable<Group> groups}) {
    _controller = new LiveTestController(
        suite, test, _onRun, _onCloseCompleter.complete, groups: groups);
  }

  /// Tells the invoker that there's a callback running that it should wait for
  /// before considering the test successful.
  ///
  /// Each call to [addOutstandingCallback] should be followed by a call to
  /// [removeOutstandingCallback] once the callbak is no longer running. Note
  /// that only successful tests wait for outstanding callbacks; as soon as a
  /// test experiences an error, any further calls to [addOutstandingCallback]
  /// or [removeOutstandingCallback] will do nothing.
  ///
  /// Throws a [ClosedException] if this test has been closed.
  void addOutstandingCallback() {
    if (closed) throw new ClosedException();
    _outstandingCallbacks.addOutstandingCallback();
  }

  /// Tells the invoker that a callback declared with [addOutstandingCallback]
  /// is no longer running.
  void removeOutstandingCallback() {
    heartbeat();
    _outstandingCallbacks.removeOutstandingCallback();
  }

  /// Removes all outstanding callbacks, for example when an error occurs.
  ///
  /// Future calls to [addOutstandingCallback] and [removeOutstandingCallback]
  /// will be ignored.
  void removeAllOutstandingCallbacks() =>
      _outstandingCallbacks.removeAllOutstandingCallbacks();

  /// Runs [fn] and returns once all (registered) outstanding callbacks it
  /// transitively invokes have completed.
  ///
  /// If [fn] itself returns a future, this will automatically wait until that
  /// future completes as well. Note that outstanding callbacks registered
  /// within [fn] will *not* be registered as outstanding callback outside of
  /// [fn].
  ///
  /// If [fn] produces an unhandled error, this marks the current test as
  /// failed, removes all outstanding callbacks registered within [fn], and
  /// completes the returned future. It does not remove any outstanding
  /// callbacks registered outside of [fn].
  Future waitForOutstandingCallbacks(fn()) {
    heartbeat();

    var counter = new OutstandingCallbackCounter();
    runZoned(() {
      // TODO(nweiz): Use async/await here once issue 23497 has been fixed in
      // two stable versions.
      runZoned(() {
        new Future.sync(fn).then((_) => counter.removeOutstandingCallback());
      }, onError: _handleError);
    }, zoneValues: {
      _counterKey: counter
    });

    return counter.noOutstandingCallbacks;
  }

  /// Runs [fn] in a zone where [closed] is always `false`.
  ///
  /// This is useful for running code that should be able to register callbacks
  /// and interact with the test framework normally even when the invoker is
  /// closed, for example cleanup code.
  unclosable(fn()) {
    heartbeat();

    return runZoned(fn, zoneValues: {
      _closableKey: false
    });
  }

  /// Notifies the invoker that progress is being made.
  ///
  /// Each heartbeat resets the timeout timer. This helps ensure that
  /// long-running tests that still make progress don't time out.
  void heartbeat() {
    if (liveTest.isComplete) return;
    if (_timeoutTimer != null) _timeoutTimer.cancel();

    var timeout = liveTest.test.metadata.timeout
        .apply(new Duration(seconds: 30));
    if (timeout == null) return;
    _timeoutTimer = _invokerZone.createTimer(timeout,
        Zone.current.bindCallback(() {
      if (liveTest.isComplete) return;
      _handleError(
          new TimeoutException(
              "Test timed out after ${niceDuration(timeout)}.", timeout));
    }));
  }

  /// Notifies the invoker of an asynchronous error.
  void _handleError(error, [StackTrace stackTrace]) {
    if (stackTrace == null) stackTrace = new Chain.current();

    var afterSuccess = liveTest.isComplete &&
        liveTest.state.result == Result.success;

    if (error is! TestFailure) {
      _controller.setState(const State(Status.complete, Result.error));
    } else if (liveTest.state.result != Result.error) {
      _controller.setState(const State(Status.complete, Result.failure));
    }

    _controller.addError(error, stackTrace);
    removeAllOutstandingCallbacks();

    // If a test was marked as success but then had an error, that indicates
    // that it was poorly-written and could be flaky.
    if (!afterSuccess) return;
    _handleError(
        "This test failed after it had already completed. Make sure to use "
            "[expectAsync]\n"
        "or the [completes] matcher when testing async code.",
        stackTrace);
  }

  /// The method that's run when the test is started.
  void _onRun() {
    _controller.setState(const State(Status.running, Result.success));

    var outstandingCallbacksForBody = new OutstandingCallbackCounter();

    // TODO(nweiz): Use async/await here once issue 23497 has been fixed in two
    // stable versions.
    Chain.capture(() {
      runZonedWithValues(() {
        _invokerZone = Zone.current;

        heartbeat();

        // Run the test asynchronously so that the "running" state change has
        // a chance to hit its event handler(s) before the test produces an
        // error. If an error is emitted before the first state change is
        // handled, we can end up with [onError] callbacks firing before the
        // corresponding [onStateChange], which violates the timing
        // guarantees.
        new Future(_test._body)
            .then((_) => removeOutstandingCallback());

        _outstandingCallbacks.noOutstandingCallbacks.then((_) {
          if (_timeoutTimer != null) _timeoutTimer.cancel();
          _controller.setState(
              new State(Status.complete, liveTest.state.result));

          // Use [Timer.run] here to avoid starving the DOM or other
          // non-microtask events.
          Timer.run(_controller.completer.complete);
        });
      }, zoneValues: {
        #test.invoker: this,
        // Use the invoker as a key so that multiple invokers can have different
        // outstanding callback counters at once.
        _counterKey: outstandingCallbacksForBody,
        _closableKey: true
      },
          zoneSpecification: new ZoneSpecification(
              print: (self, parent, zone, line) => _controller.print(line)),
          onError: _handleError);
    });
  }
}
