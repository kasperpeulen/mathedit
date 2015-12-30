// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library test.backend.platform_selector.parser;

import 'package:source_span/source_span.dart';

import 'ast.dart';
import 'scanner.dart';
import 'token.dart';

/// A class for parsing a platform selector.
///
/// Platform selectors use a stripped-down version of the Dart expression
/// syntax that only contains variables, parentheses, and boolean operators.
/// Variables may also contain dashes, contrary to Dart's syntax; this allows
/// consistency with command-line arguments.
class Parser {
  /// The scanner that tokenizes the selector.
  final Scanner _scanner;

  Parser(String selector)
      : _scanner = new Scanner(selector);

  /// Parses the selector.
  ///
  /// This must only be called once per parser.
  Node parse() {
    var selector = _conditional();

    if (_scanner.peek().type != TokenType.endOfFile) {
      throw new SourceSpanFormatException(
          "Expected end of input.", _scanner.peek().span);
    }

    return selector;
  }

  /// Parses a conditional:
  ///
  ///     conditionalExpression:
  ///       logicalOrExpression ("?" conditionalExpression ":"
  ///           conditionalExpression)?
  Node _conditional() {
    var condition = _or();
    if (!_scanner.scan(TokenType.questionMark)) return condition;

    var whenTrue = _conditional();
    if (!_scanner.scan(TokenType.colon)) {
      throw new SourceSpanFormatException(
          'Expected ":".', _scanner.peek().span);
    }

    var whenFalse = _conditional();
    return new ConditionalNode(condition, whenTrue, whenFalse);
  }

  /// Parses a logical or:
  ///
  ///     logicalOrExpression:
  ///       logicalAndExpression ("||" logicalOrExpression)?
  Node _or() {
    var left = _and();
    if (!_scanner.scan(TokenType.or)) return left;
    return new OrNode(left, _or());
  }

  /// Parses a logical and:
  ///
  ///     logicalAndExpression:
  ///       simpleExpression ("&&" logicalAndExpression)?
  Node _and() {
    var left = _simpleExpression();
    if (!_scanner.scan(TokenType.and)) return left;
    return new AndNode(left, _and());
  }

  /// Parses a simple expression:
  ///
  ///     simpleExpression:
  ///       "!" simpleExpression |
  ///           "(" conditionalExpression ")" |
  ///           IDENTIFIER
  Node _simpleExpression() {
    var token = _scanner.next();
    switch (token.type) {
      case TokenType.not:
        var child = _simpleExpression();
        return new NotNode(child, token.span.expand(child.span));

      case TokenType.leftParen:
        var child = _conditional();
        if (!_scanner.scan(TokenType.rightParen)) {
          throw new SourceSpanFormatException(
              'Expected ")".', _scanner.peek().span);
        }
        return child;

      case TokenType.identifier:
        return new VariableNode(token.name, token.span);

      default:
        throw new SourceSpanFormatException("Expected expression.", token.span);
    }
  }
}
