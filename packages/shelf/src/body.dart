// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library shelf.body;

import 'dart:async';
import 'dart:convert';

/// The body of a request or response.
///
/// This tracks whether the body has been read. It's separate from [Message]
/// because the message may be changed with [Message.change], but each instance
/// should share a notion of whether the body was read.
class Body {
  /// The contents of the message body.
  ///
  /// This will be `null` after [read] is called.
  Stream<List<int>> _stream;

  Body._(this._stream);

  /// Converts [body] to a byte stream and wraps it in a [Body].
  ///
  /// [body] may be either a [Body], a [String], a [Stream<List<int>>], or
  /// `null`. If it's a [String], [encoding] will be used to convert it to a
  /// [Stream<List<int>>].
  factory Body(body, [Encoding encoding]) {
    if (encoding == null) encoding = UTF8;

    if (body is Body) return body;

    var stream;
    if (body == null) {
      stream = new Stream.fromIterable([]);
    } else if (body is String) {
      stream = new Stream.fromIterable([encoding.encode(body)]);
    } else if (body is Stream) {
      stream = body;
    } else {
      throw new ArgumentError('Response body "$body" must be a String or a '
          'Stream.');
    }

    return new Body._(stream);
  }

  /// Returns a [Stream] representing the body.
  ///
  /// Can only be called once.
  Stream<List<int>> read() {
    if (_stream == null) {
      throw new StateError("The 'read' method can only be called once on a "
          "shelf.Request/shelf.Response object.");
    }
    var stream = _stream;
    _stream = null;
    return stream;
  }
}
