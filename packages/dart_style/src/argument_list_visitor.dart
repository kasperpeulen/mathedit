// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library dart_style.src.argument_list_visitor;

import 'dart:math' as math;

import 'package:analyzer/analyzer.dart';
import 'package:analyzer/src/generated/scanner.dart';

import 'chunk.dart';
import 'rule/argument.dart';
import 'rule/rule.dart';
import 'source_visitor.dart';

/// Helper class for [SourceVisitor] that handles visiting and writing an
/// [ArgumentList], including all of the special code needed to handle function
/// and collection arguments.
class ArgumentListVisitor {
  final SourceVisitor _visitor;

  final ArgumentList _node;

  /// The normal arguments preceding any block function arguments.
  final ArgumentSublist _arguments;

  /// The contiguous list of block function arguments, if any.
  ///
  /// Otherwise, this is `null`.
  final List<Expression> _functions;

  /// If there are block function arguments, this is the arguments after them.
  ///
  /// Otherwise, this is `null`.
  final ArgumentSublist _argumentsAfterFunctions;

  /// Returns `true` if there is only a single positional argument.
  bool get _isSingle =>
      _node.arguments.length == 1 && _node.arguments.single is! NamedExpression;

  /// Whether this argument list has any collection or block function arguments.
  // TODO(rnystrom): Returning true based on collections is non-optimal. It
  // forces a method chain to break into two but the result collection may not
  // actually split which can lead to a method chain that's allowed to break
  // where it shouldn't.
  bool get hasBlockArguments =>
      _arguments._collections.isNotEmpty || _functions != null;

  factory ArgumentListVisitor(SourceVisitor visitor, ArgumentList node) {
    // Look for a single contiguous range of block function arguments.
    var functionsStart;
    var functionsEnd;

    for (var i = 0; i < node.arguments.length; i++) {
      var argument = node.arguments[i];
      if (_isBlockFunction(argument)) {
        if (functionsStart == null) functionsStart = i;

        // The functions must be one contiguous section.
        if (functionsEnd != null && functionsEnd != i) {
          functionsStart = null;
          functionsEnd = null;
          break;
        }

        functionsEnd = i + 1;
      }
    }

    if (functionsStart == null) {
      // No functions, so there is just a single argument list.
      return new ArgumentListVisitor._(visitor, node,
          new ArgumentSublist(node.arguments, node.arguments), null, null);
    }

    // Split the arguments into two independent argument lists with the
    // functions in the middle.
    var argumentsBefore = node.arguments.take(functionsStart).toList();
    var functions = node.arguments.sublist(functionsStart, functionsEnd);
    var argumentsAfter = node.arguments.skip(functionsEnd).toList();

    return new ArgumentListVisitor._(
        visitor,
        node,
        new ArgumentSublist(node.arguments, argumentsBefore),
        functions,
        new ArgumentSublist(node.arguments, argumentsAfter));
  }

  ArgumentListVisitor._(this._visitor, this._node, this._arguments,
      this._functions, this._argumentsAfterFunctions);

  /// Builds chunks for the call chain.
  void visit() {
    // If there is just one positional argument, it tends to look weird to
    // split before it, so try not to.
    if (_isSingle) _visitor.builder.startSpan();

    // Nest around the parentheses in case there are comments before or after
    // them.
    _visitor.builder.nestExpression();
    _visitor.builder.startSpan();
    _visitor.token(_node.leftParenthesis);

    _arguments.visit(_visitor);

    _visitor.builder.endSpan();

    if (_functions != null) {
      // TODO(rnystrom): It might look better to treat the parameter list of the
      // first function as if it were an argument in the preceding argument list
      // instead of just having this little solo split here. That would try to
      // keep the parameter list with other arguments when possible, and, I
      // think, generally look nicer.
      if (_functions.first == _node.arguments.first) {
        _visitor.soloZeroSplit();
      } else {
        _visitor.soloSplit();
      }

      for (var argument in _functions) {
        if (argument != _functions.first) _visitor.space();

        _visitor.visit(argument);

        // Write the trailing comma.
        if (argument != _node.arguments.last) {
          _visitor.token(argument.endToken.next);
        }
      }

      _visitor.builder.startSpan();
      _argumentsAfterFunctions.visit(_visitor);
      _visitor.builder.endSpan();
    }

    _visitor.token(_node.rightParenthesis);

    _visitor.builder.unnest();

    if (_isSingle) _visitor.builder.endSpan();
  }

  /// Returns `true` if [expression] is a [FunctionExpression] with a non-empty
  /// block body.
  static bool _isBlockFunction(Expression expression) {
    if (expression is NamedExpression) {
      expression = (expression as NamedExpression).expression;
    }

    // Allow functions wrapped in dotted method calls like "a.b.c(() { ... })".
    if (expression is MethodInvocation) {
      if (!_isValidWrappingTarget(expression.target)) return false;
      if (expression.argumentList.arguments.length != 1) return false;

      return _isBlockFunction(expression.argumentList.arguments.single);
    }

    if (expression is InstanceCreationExpression) {
      if (expression.argumentList.arguments.length != 1) return false;

      return _isBlockFunction(expression.argumentList.arguments.single);
    }

    // Must be a function.
    if (expression is! FunctionExpression) return false;

    // With a curly body.
    var function = expression as FunctionExpression;
    if (function.body is! BlockFunctionBody) return false;

    // That isn't empty.
    var body = function.body as BlockFunctionBody;
    return body.block.statements.isNotEmpty ||
        body.block.rightBracket.precedingComments != null;
  }

  /// Returns `true` if [expression] is a valid method invocation target for
  /// an invocation that wraps a function literal argument.
  static bool _isValidWrappingTarget(Expression expression) {
    // Allow bare function calls.
    if (expression == null) return true;

    // Allow property accesses.
    while (expression is PropertyAccess) {
      expression = (expression as PropertyAccess).target;
    }

    if (expression is PrefixedIdentifier) return true;
    if (expression is SimpleIdentifier) return true;

    return false;
  }
}

/// A range of arguments from a complete argument list.
///
/// One of these typically covers all of the arguments in an invocation. But,
/// when an argument list has block functions in the middle, the arguments
/// before and after the functions are treated as separate independent lists.
/// In that case, there will be two of these.
class ArgumentSublist {
  /// The full argument list from the AST.
  final List<Expression> _allArguments;

  /// The positional arguments, in order.
  final List<Expression> _positional;

  /// The named arguments, in order.
  final List<Expression> _named;

  /// Maps each argument that is a collection literal that get special
  /// formatting to the token for the collection's open bracket.
  final Map<Expression, Token> _collections;

  /// The number of leading collections.
  ///
  /// If all arguments are collections, this counts them.
  final int _leadingCollections;

  /// The number of trailing collections.
  ///
  /// If all arguments are collections, this is zero.
  final int _trailingCollections;

  /// The rule used to split the bodies of all of the collection arguments.
  Rule get collectionRule => _collectionRule;
  Rule _collectionRule;

  /// The most recent chunk that split before an argument.
  Chunk get previousSplit => _previousSplit;
  Chunk _previousSplit;

  bool get _hasMultipleArguments => _positional.length + _named.length > 1;

  factory ArgumentSublist(
      List<Expression> allArguments, List<Expression> arguments) {
    // Assumes named arguments follow all positional ones.
    var positional =
        arguments.takeWhile((arg) => arg is! NamedExpression).toList();
    var named = arguments.skip(positional.length).toList();

    var collections = {};
    for (var argument in arguments) {
      var bracket = _getCollectionBracket(argument);
      if (bracket != null) collections[argument] = bracket;
    }

    // Count the leading arguments that are collection literals.
    var leadingCollections = 0;
    for (var argument in arguments) {
      if (!collections.containsKey(argument)) break;
      leadingCollections++;
    }

    // Count the trailing arguments that are collection literals.
    var trailingCollections = 0;
    if (leadingCollections != arguments.length) {
      for (var argument in arguments.reversed) {
        if (!collections.containsKey(argument)) break;
        trailingCollections++;
      }
    }

    // Collections must all be a prefix or suffix of the argument list (and not
    // both).
    if (leadingCollections != collections.length) leadingCollections = 0;
    if (trailingCollections != collections.length) trailingCollections = 0;

    // Ignore any collections in the middle of the argument list.
    if (leadingCollections == 0 && trailingCollections == 0) {
      collections.clear();
    }

    return new ArgumentSublist._(allArguments, positional, named, collections,
        leadingCollections, trailingCollections);
  }

  ArgumentSublist._(this._allArguments, this._positional, this._named,
      this._collections, this._leadingCollections, this._trailingCollections);

  void visit(SourceVisitor visitor) {
    if (_collections.isNotEmpty) {
      _collectionRule = new Rule(Cost.splitCollections);
    }

    var rule = _visitPositional(visitor);
    _visitNamed(visitor, rule);
  }

  /// Writes the positional arguments, if any.
  PositionalRule _visitPositional(SourceVisitor visitor) {
    if (_positional.isEmpty) return null;

    // Allow splitting after "(".
    var rule;
    if (_positional.length == 1) {
      rule = new SinglePositionalRule(_collectionRule,
          splitsOnInnerRules: _allArguments.length > 1 &&
              !_collections.containsKey(_positional.first));
    } else {
      // Only count the collections in the positional rule.
      var leadingCollections =
          math.min(_leadingCollections, _positional.length);
      var trailingCollections =
          math.max(_trailingCollections - _named.length, 0);
      rule = new MultiplePositionalRule(
          _collectionRule, leadingCollections, trailingCollections);
    }

    _visitArguments(visitor, _positional, rule);
    return rule;
  }

  /// Writes the named arguments, if any.
  void _visitNamed(SourceVisitor visitor, PositionalRule positionalRule) {
    if (_named.isEmpty) return;

    // Only count the collections in the named rule.
    var leadingCollections =
        math.max(_leadingCollections - _positional.length, 0);
    var trailingCollections = math.min(_trailingCollections, _named.length);
    var namedRule =
        new NamedRule(_collectionRule, leadingCollections, trailingCollections);

    // Let the positional args force the named ones to split.
    if (positionalRule != null) {
      positionalRule.setNamedArgsRule(namedRule);
    }

    _visitArguments(visitor, _named, namedRule);
  }

  void _visitArguments(
      SourceVisitor visitor, List<Expression> arguments, ArgumentRule rule) {
    visitor.builder.startRule(rule);

    // Split before the first argument.
    _previousSplit =
        visitor.builder.split(space: !_isFirstArgument(arguments.first));
    rule.beforeArgument(_previousSplit);

    // Try to not split the positional arguments.
    if (arguments == _positional) {
      visitor.builder.startSpan(Cost.positionalArguments);
    }

    for (var argument in arguments) {
      _visitArgument(visitor, rule, argument);

      // Write the split.
      if (argument != arguments.last) {
        _previousSplit = visitor.split();
        rule.beforeArgument(_previousSplit);
      }
    }

    if (arguments == _positional) visitor.builder.endSpan();

    visitor.builder.endRule();
  }

  void _visitArgument(
      SourceVisitor visitor, ArgumentRule rule, Expression argument) {
    // If we're about to write a collection argument, handle it specially.
    if (_collections.containsKey(argument)) {
      if (rule != null) rule.beforeCollection();

      // Tell it to use the rule we've already created.
      visitor.beforeCollection(_collections[argument], this);
    } else if (_hasMultipleArguments) {
      // Edge case: If there is just a single argument, don't bump the nesting.
      // This lets us avoid spurious indentation in cases like:
      //
      //     function(function(() {
      //       body;
      //     }));
      visitor.builder.startBlockArgumentNesting();
    }

    visitor.visit(argument);

    if (_collections.containsKey(argument)) {
      if (rule != null) rule.afterCollection();
    } else if (_hasMultipleArguments) {
      visitor.builder.endBlockArgumentNesting();
    }

    // Write the trailing comma.
    if (!_isLastArgument(argument)) {
      visitor.token(argument.endToken.next);
    }
  }

  bool _isFirstArgument(Expression argument) => argument == _allArguments.first;

  bool _isLastArgument(Expression argument) => argument == _allArguments.last;

  /// Returns the token for the left bracket if [expression] denotes a
  /// collection literal argument.
  ///
  /// Similar to block functions, collection arguments can get special
  /// indentation to make them look more statement-like.
  static Token _getCollectionBracket(Expression expression) {
    if (expression is NamedExpression) {
      expression = (expression as NamedExpression).expression;
    }

    // TODO(rnystrom): Should we step into parenthesized expressions?

    if (expression is ListLiteral) return expression.leftBracket;
    if (expression is MapLiteral) return expression.leftBracket;

    // Not a collection literal.
    return null;
  }
}
