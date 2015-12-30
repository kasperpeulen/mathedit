// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library test.frontend.timeout;

/// A class representing a modification to the default timeout for a test.
///
/// By default, a test will time out after 30 seconds. With [new Timeout], that
/// can be overridden entirely; with [new Timeout.factor], it can be scaled
/// relative to the default.
class Timeout {
  /// A constant indicating that a test should never time out.
  static const none = const Timeout._none();

  /// The timeout duration.
  ///
  /// If set, this overrides the default duration entirely. It's `null` for
  /// timeouts with a non-null [scaleFactor] and for [Timeout.none].
  final Duration duration;

  /// The timeout factor.
  ///
  /// The default timeout will be multiplied by this to get the new timeout.
  /// Thus a factor of 2 means that the test will take twice as long to time
  /// out, and a factor of 0.5 means that it will time out twice as quickly.
  ///
  /// This is `null` for timeouts with a non-null [duration] and for
  /// [Timeout.none].
  final num scaleFactor;

  /// Declares an absolute timeout that overrides the default.
  const Timeout(this.duration)
      : scaleFactor = null;

  /// Declares a relative timeout that scales the default.
  const Timeout.factor(this.scaleFactor)
      : duration = null;

  const Timeout._none()
      : scaleFactor = null,
        duration = null;

  /// Returns a new [Timeout] that merges [this] with [other].
  ///
  /// If [other] declares a [duration], that takes precedence. Otherwise, this
  /// timeout's [duration] or [factor] are multiplied by [other]'s [factor].
  Timeout merge(Timeout other) {
    if (this == none || other == none) return none;
    if (other.duration != null) return new Timeout(other.duration);
    if (duration != null) return new Timeout(duration * other.scaleFactor);
    return new Timeout.factor(scaleFactor * other.scaleFactor);
  }

  /// Returns a new [Duration] from applying [this] to [base].
  ///
  /// If this is [none], returns `null`.
  Duration apply(Duration base) {
    if (this == none) return null;
    return duration == null ? base * scaleFactor : duration;
  }
}
