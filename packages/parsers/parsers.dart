// Copyright (c) 2012, Google Inc. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

// Author: Paul Brauner (polux@google.com)

library parsers;

import 'package:persistent/persistent.dart';

part 'src/accumulators.dart';

class Undefined { const Undefined(); }  // simulates the old ? operator

class Position {
  final int line;
  final int character;
  final int offset;
  final int tabStop;

  const Position(this.offset, this.line, this.character, {this.tabStop: 1});

  Position addChar(String c) {
    assert(c.length == 1);
    if (c == '\n') {
      return new Position(offset + 1, line + 1, 1, tabStop: tabStop);
    }
    if (c == '\t') {
      int used = (character - 1) % tabStop;
      return new Position(offset + 1, line, character + (tabStop - used), tabStop: tabStop);
    }
    return new Position(offset + 1, line, character + 1, tabStop: tabStop);
  }

  Position copy({int offset, int line, int character, int tabStop}) =>
    new Position(
      offset == null ? this.offset : offset,
      line == null ? this.line : line,
      character == null ? this.character : character,
      tabStop: tabStop == null ? this.tabStop : tabStop
    );

  bool operator <(Position p) => offset < p.offset;

  bool operator >(Position p) => offset > p.offset;

  String toString() => '(line $line, char $character, offset $offset)';
}

/**
 * The value computed by a parser along with the position at which it was
 * parsed.
 */
class PointedValue<A> {
  final A value;
  final Position position;

  PointedValue(this.value, this.position);

  String toString() => '$value @ $position';
}

abstract class Expectations {
  const Expectations();

  factory Expectations.empty(position) => new EmptyExpectation(position);
  factory Expectations.single(str, position) => new SingleExpectation(str, position);

  CombinedExpectation best(Expectations other) => new CombinedExpectation(this, other);

  Position get position;
  Set<String> get expected;
}

class EmptyExpectation extends Expectations {
  final Position _position;

  const EmptyExpectation(this._position);

  Position get position => _position;
  Set<String> get expected => new Set<String>();
}

class SingleExpectation extends Expectations {
  final String _expected;
  final Position _position;

  SingleExpectation(this._expected, this._position);

  Position get position => _position;
  Set<String> get expected => new Set<String>.from([_expected]);
}

class CombinedExpectation extends Expectations {
  final Expectations first;
  final Expectations second;

  CombinedExpectation(this.first, this.second);

  Position get position {
    if (first.position < second.position) return second.position;
    return first.position;
  }

  Set<String> get expected => first.expected..addAll(second.expected);
}

class ParseResult<A> {
  final bool isSuccess;
  final bool isCommitted;
  /// [:null:] if [:!isSuccess:]
  final A value;
  final String text;
  final Position position;
  final Expectations expectations;

  ParseResult(this.text, this.expectations, this.position, this.isSuccess,
              this.isCommitted, this.value);

  ParseResult copy({String text, Expectations expectations, Position position,
                    bool isSuccess, bool isCommitted,
                    Object value: const Undefined()}) {
    return new ParseResult(
        (text != null)               ? text         : this.text,
        (expectations != null)       ? expectations : this.expectations,
        (position != null)           ? position     : this.position,
        (isSuccess != null)          ? isSuccess    : this.isSuccess,
        (isCommitted != null)        ? isCommitted  : this.isCommitted,
        (value != const Undefined()) ? value        : this.value);
  }

  String get errorMessage {
    final pos = expectations.position;
    final maxSeenChar = (pos.offset < text.length)
    ? "'${text[pos.offset]}'"
    : 'eof';
    final prelude =
    'line ${pos.line}, character ${pos.character}:';
    final expected = expectations.expected;
    if (expected.isEmpty) {
      return '$prelude unexpected $maxSeenChar.';
    } else {
      final or = _humanOr(expected.toList());
      return "$prelude expected $or, got $maxSeenChar.";
    }
  }

  String get _rest => text.substring(position.offset);

  get _shortRest => _rest.length < 10 ? _rest : '${_rest.substring(0, 10)}...';

  toString() {
    final c = isCommitted ? '*' : '';
    return isSuccess
        ? 'success$c: {value: $value, rest: "$_shortRest"}'
        : 'failure$c: {message: $errorMessage, rest: "$_shortRest"}';
  }

  static String _humanOr(List es) {
    assert(es.length > 0);
    if (es.length == 1) {
      return es[0];
    } else {
      StringBuffer result = new StringBuffer();
      for (int i = 0; i < es.length - 2; i++) {
        result.write('${es[i]}, ');
      }
      result.write('${es[es.length - 2]} or ${es[es.length - 1]}');
      return result.toString();
    }
  }
}

ParseResult _success(value, String text, Position position,
                     [Expectations expectations, bool committed = false]) {
  final exps = (expectations != null)
      ? expectations : new Expectations.empty(position);
  return new ParseResult(text, exps, position, true, committed, value);
}

ParseResult _failure(String text, Position position,
                     [Expectations expectations, bool committed = false]) {
  final exps = (expectations != null)
      ? expectations : new Expectations.empty(position);
  return new ParseResult(text, exps, position, false, committed, null);
}

typedef ParseResult _ParseFunction(String s, Position pos);

class Parser<A> {
  final _ParseFunction _run;

  Parser(ParseResult<A> f(String s, Position pos)) : this._run = f;

  ParseResult run(String s, [Position pos = const Position(0, 1, 1)]) =>
      _run(s, pos);

  A parse(String s, {int tabStop: 1}) {
    ParseResult<A> result = run(s, new Position(0, 1, 1, tabStop: tabStop));
    if (result.isSuccess) return result.value;
    else throw result.errorMessage;
  }

  /// Monadic bind.
  Parser operator >>(Parser g(A x)) {
    return new Parser((text, pos) {
      ParseResult res = _run(text, pos);
      if (res.isSuccess) {
        final res2 = g(res.value)._run(text, res.position);
        return res2.copy(
            expectations: res.expectations.best(res2.expectations),
            isCommitted: res.isCommitted || res2.isCommitted);
      } else {
        return res;
      }
    });
  }

  Parser expecting(String expected) {
    return new Parser((s, pos) {
      final res = _run(s, pos);
      return res.copy(expectations: new Expectations.single(expected, pos));
    });
  }

  Parser get committed {
    return new Parser((s, pos) {
      final res = _run(s, pos);
      return res.copy(isCommitted: true);
    });
  }

  /// Alias for [:expecting:].
  Parser<A> operator %(String expected) => this.expecting(expected);

  /// Applicative <*>
  Parser operator *(Parser p) => this >> (f) => p >> (x) {
    Function ff = f;
    return success(ff(x));
  };

  /// Applicative *>
  Parser operator >(Parser p) => this >> (_) => p;

  /// Applicative <*
  Parser<A> operator <(Parser p) => this >> ((x) => p > success(x));

  /// Functor map
  Parser map(Object f(A x)) => success(f) * this;

  /// Infix syntax for map
  Parser operator ^(Object f(A x)) => map(f);

  /// Parser sequencing: creates a parser accumulator.
  ParserAccumulator2 operator +(Parser p) => new ParserAccumulator2(this, p);

  /// Alternative
  Parser operator |(Parser p) {
    return new Parser((s, pos) {
      ParseResult<A> res = _run(s, pos);
      if (res.isSuccess || res.isCommitted) {
        return res;
      } else {
        ParseResult res2 = p._run(s, pos);
        return res2.copy(
            expectations: res.expectations.best(res2.expectations));
      }
    });
  }

  /**
   * Parses without consuming any input.
   *
   * Used for defining followedBy, which is probably what you're looking for.
   */
  Parser<A> get lookAhead {
    return new Parser((s, pos) {
      ParseResult res = _run(s, pos);
      return res.isSuccess
          ? _success(res.value, s, pos)
          : res;
    });
  }

  /**
   * Succeeds if and only if [this] succeeds and [p] succeeds on what remains to
   * parse without cosuming it.
   *
   *     string("let").followedBy(space)
   */
  Parser<A> followedBy(Parser p) => this < p.lookAhead;

  /**
   * Fails if and only if [this] succeeds on what's ahead.
   *
   * Used for defining notFollowedBy, which is probably what you're looking for.
   */
  Parser get notAhead {
    return new Parser((s, pos) {
      ParseResult res = _run(s, pos);
      return res.isSuccess
          ? _failure(s, pos)
          : _success(null, s, pos);
    });
  }

  /**
   * Succeeds if and only if [this] succeeds and [p] fails on what remains to
   * parse.
   *
   *     string("let").notFollowedBy(alphanum)
   */
  Parser<A> notFollowedBy(Parser p) => this < p.notAhead;

  /**
   * Parses [this] 0 or more times until [end] succeeds.
   *
   * Returns the list of values returned by [this]. It is useful for parsing
   * comments.
   *
   *     string('/*') > anyChar.manyUntil(string('*/'))
   *
   * The input parsed by [end] is consumed. Use [:end.lookAhead:] if you don't
   * want this.
   */
  Parser<List<A>> manyUntil(Parser end) {
    // Imperative version to avoid stack overflows.
    return new Parser((s, pos) {
      List res = [];
      Position index = pos;
      var exps = new Expectations.empty(pos);
      bool committed = false;
      while(true) {
        final endRes = end._run(s, index);
        exps = exps.best(endRes.expectations);
        if (endRes.isSuccess) {
          return endRes.copy(value: res, expectations: exps,
                             isCommitted: committed);
        } else if (!endRes.isCommitted) {
          final xRes = this._run(s, index);
          exps = exps.best(xRes.expectations);
          committed = committed || xRes.isCommitted;
          if (xRes.isSuccess) {
            res.add(xRes.value);
            index = xRes.position;
          } else {
            return xRes.copy(expectations: exps, isCommitted: committed);
          }
        } else {
          return endRes.copy(expectations: exps, isCommitted: committed);
        }
      }
    });
  }

  /**
   * Parses [this] 0 or more times until [end] succeeds and discards the result.
   *
   * Equivalent to [:this.manyUntil(end) > success(null):] but faster. The input
   * parsed by [end] is consumed. Use [:end.lookAhead:] if you don't want this.
   */
  Parser skipManyUntil(Parser end) {
    // Imperative version to avoid stack overflows.
    return new Parser((s, pos) {
      Position index = pos;
      var exps = new Expectations.empty(pos);
      var commit = false;
      while(true) {
        final endRes = end._run(s, index);
        exps = exps.best(endRes.expectations);
        commit = commit || endRes.isCommitted;
        if (endRes.isSuccess) {
          return endRes.copy(value: null, expectations: exps,
                             isCommitted: commit);
        } else if (!endRes.isCommitted) {
          final xRes = this._run(s, index);
          exps = exps.best(xRes.expectations);
          commit = commit || xRes.isCommitted;
          if (xRes.isSuccess) {
            index = xRes.position;
          } else {
            return xRes.copy(expectations: exps, isCommitted: commit);
          }
        } else {
          return endRes.copy(expectations: exps);
        }
      }
    });
  }

  // Derived combinators, defined here for infix notation

  Parser<A> orElse(A value) => this | success(value);

  Parser<Option<A>> get maybe =>
      this.map((x) => new Option.some(x)).orElse(new Option.none());

  // Imperative version to avoid stack overflows.
  Parser<List<A>> _many(List<A> acc()) {
    return new Parser((s, pos) {
      final res = acc();
      var exps = new Expectations.empty(pos);
      Position index = pos;
      bool committed = false;
      while(true) {
        ParseResult<A> o = this._run(s, index);
        exps = exps.best(o.expectations);
        committed = committed || o.isCommitted;
        if (o.isSuccess) {
          res.add(o.value);
          index = o.position;
        } else if (o.isCommitted) {
          return o.copy(expectations: exps);
        } else {
          return _success(res, s, index, exps, committed);
        }
      }
    });
  }

  Parser<List<A>> get many => _many(() => []);

  Parser<List<A>> get many1 => this >> (x) => _many(() => [x]);

  /**
   * Parses [this] zero or more time, skipping its result.
   *
   * Equivalent to [:this.many > success(null):] but more efficient.
   */
  Parser get skipMany {
    // Imperative version to avoid stack overflows.
    return new Parser((s, pos) {
      Position index = pos;
      var exps = new Expectations.empty(pos);
      bool committed = false;
      while(true) {
        ParseResult<A> o = this._run(s, index);
        exps = exps.best(o.expectations);
        committed = committed || o.isCommitted;
        if (o.isSuccess) {
          index = o.position;
        } else if (o.isCommitted) {
          return o.copy(expectations: exps);
        } else {
          return _success(null, s, index, exps, committed);
        }
      }
    });
  }

  /**
   * Parses [this] one or more time, skipping its result.
   *
   * Equivalent to [:this.many1 > success(null):] but more efficient.
   */
  Parser get skipMany1 => this > this.skipMany;

  Parser<List<A>> sepBy(Parser sep) => sepBy1(sep).orElse([]);

  Parser<List<A>> sepBy1(Parser sep) =>
      this >> (x) => (sep > this)._many(() => [x]);

  Parser<List<A>> endBy(Parser sep) => (this < sep).many;

  Parser<List<A>> endBy1(Parser sep) => (this < sep).many1;

  /**
   * Parses zero or more occurences of [this] separated and optionally ended
   * by [sep].
   */
  Parser<List<A>> sepEndBy(Parser sep) => sepEndBy1(sep).orElse([]);

  /**
   * Parses one or more occurences of [this] separated and optionally ended
   * by [sep].
   */
  Parser<List<A>> sepEndBy1(Parser sep) => sepBy1(sep) < sep.maybe;

  Parser chainl(Parser sep, defaultValue) =>
      chainl1(sep) | success(defaultValue);

  Parser chainl1(Parser sep) {
    rest(acc) {
      return new Parser((s, pos) {
        Position index = pos;
        var exps = new Expectations.empty(pos);
        var commit = false;
        while(true) {
          combine(f) => (x) => f(acc, x);
          final res = (success(combine) * sep * this)._run(s, index);
          exps = exps.best(res.expectations);
          commit = commit || res.isCommitted;
          if (res.isSuccess) {
            acc = res.value;
            index = res.position;
          } else if (res.isCommitted) {
            return res.copy(expectations: exps);
          } else {
            return _success(acc, s, index, exps, commit);
          }
        }
      });
    }
    return this >> rest;
  }

  /// Warning: may lead to stack overflows.
  Parser chainr(Parser sep, defaultValue) =>
      chainr1(sep) | success(defaultValue);

  /// Warning: may lead to stack overflows.
  Parser chainr1(Parser sep) {
    rest(x) => success((f) => (y) => f(x, y)) * sep * chainr1(sep)
             | success(x);
    return this >> rest;
  }

  Parser<A> between(Parser left, Parser right) => left > (this < right);

  /// Returns the substring consumed by [this].
  Parser<String> get record {
    return new Parser((s, pos) {
        final result = run(s, pos);
        if (result.isSuccess) {
          return result.copy(
              value: s.substring(pos.offset, result.position.offset));
        } else {
          return result;
        }
    });
  }

  /**
   * Returns the value parsed by [this] along with the position at which it
   * has been parsed.
   */
  Parser<PointedValue<A>> get withPosition {
    return new Parser((s, pos) {
      return this.map((v) => new PointedValue(v, pos))._run(s, pos);
    });
  }
}

// Primitive parsers

final Parser fail = new Parser((s, pos) => _failure(s, pos));

Parser success(value) => new Parser((s, pos) => _success(value, s, pos));

final Parser eof = new Parser((s, pos) =>
    pos.offset >= s.length
        ? _success(null, s, pos)
        : _failure(s, pos, new Expectations.single("eof", pos)));

Parser pred(bool p(String char)) {
  return new Parser((s, pos) {
    if (pos.offset >= s.length) return _failure(s, pos);
    else {
      String c = s[pos.offset];
      return p(c) ? _success(c, s, pos.addChar(c))
                  : _failure(s, pos);
    }
  });
}

Parser char(String chr) => pred((c) => c == chr) % "'$chr'";

Parser string(String str) {
  // Primitive version for efficiency
  return new Parser((s, pos) {
    final int offset = pos.offset;
    final int max = offset + str.length;

    int newline = pos.line;
    int newchar = pos.character;
    // This replicates Position#addChar for efficiency purposes.
    void update(c) {
      final isNewLine = c == '\n';
      newline = newline + (isNewLine ? 1 : 0);
      newchar = isNewLine ? 1 : newchar + 1;
    }

    bool match = s.length >= max;
    for (int i = 0; i < str.length && match; i++) {
      final c = s[offset + i];
      match = match && c == str[i];
      update(c);
    }
    if (match) {
      return _success(str, s, pos.copy(offset: max, line: newline, character: newchar));
    } else {
      return _failure(s, pos, new Expectations.single("'$str'", pos));
    }
  });
}

Parser rec(Parser f()) => new Parser((s, pos) => f()._run(s, pos));

final Parser<Position> position =
    new Parser((s, pos) => _success(pos, s, pos));

// Derived combinators

Parser choice(List<Parser> ps) {
  // Imperative version for efficiency
  return new Parser((s, pos) {
    var exps = new Expectations.empty(pos);
    for (final p in ps) {
      final res = p._run(s, pos);
      exps = exps.best(res.expectations);
      if (res.isSuccess) {
        return res.copy(expectations: exps);
      } else if (res.isCommitted) {
        return res;
      }
    }
    return _failure(s, pos, exps);
  });
}

class _SkipInBetween {
  final Parser left;
  final Parser right;
  final bool nested;

  _SkipInBetween(this.left, this.right, this.nested);

  Parser parser() => nested ? _insideMulti() : _insideSingle();

  Parser _inside() => rec(parser).between(left, right);
  Parser get _leftOrRightAhead => (left | right).lookAhead;
  Parser _insideMulti() => anyChar.skipManyUntil(_leftOrRightAhead) > _nest();
  Parser _nest() => (rec(_inside) > rec(_insideMulti)).maybe;
  Parser _insideSingle() => anyChar.skipManyUntil(right.lookAhead);
}

Parser skipEverythingBetween(
    Parser left, Parser right, {bool nested: false}) {
  final inBetween = new _SkipInBetween(left, right, nested).parser();
  return inBetween.between(left, right) > success(null);
}

Parser everythingBetween(
    Parser left, Parser right, {bool nested: false}) {
  final inBetween = new _SkipInBetween(left, right, nested).parser();
  return inBetween.record.between(left, right);
}

// Derived character parsers

final Parser<String> anyChar = pred((c) => true) % 'any character';

Parser<String> oneOf(String chars) =>
    pred((c) => chars.contains(c)).expecting("one of '$chars'");

Parser<String> noneOf(String chars) =>
    pred((c) => !chars.contains(c)).expecting("none of '$chars'");

final _spaces = " \t\n\r\v\f";
final _lower = "abcdefghijklmnopqrstuvwxyz";
final _upper = _lower.toUpperCase();
final _alpha = "$_lower$_upper";
final _digit = "1234567890";
final _alphanum = "$_alpha$_digit";

final Parser<String> tab = char('\t') % 'tab';

final Parser<String> newline = char('\n') % 'newline';

final Parser<String> space = oneOf(_spaces) % 'space';

final Parser spaces = (space.many > success(null)) % 'spaces';

final Parser<String> upper = oneOf(_upper) % 'uppercase letter';

final Parser<String> lower = oneOf(_lower) % 'lowercase letter';

final Parser<String> alphanum = oneOf(_alphanum); // % 'alphanumeric character'

final Parser<String> letter = oneOf(_alpha) % 'letter';

final Parser<String> digit = oneOf(_digit) % 'digit';

class ReservedNames {
  Map<String, Parser<String>> _map;
  ReservedNames._(this._map);
  Parser<String> operator[](String key) {
    final res = _map[key];
    if (res == null) throw "$key is not a reserved name";
    else return res;
  }
}

/// Programming language specific combinators
class LanguageParsers {
  String _commentStart;
  String _commentEnd;
  String _commentLine;
  bool _nestedComments;
  Parser<String> _identStart;
  Parser<String> _identLetter;
  Set<String> _reservedNames;

  ReservedNames _reserved;

  LanguageParsers({
    String         commentStart   : '/*',
    String         commentEnd     : '*/',
    String         commentLine    : '//',
    bool           nestedComments : false,
    Parser<String> identStart     : null, // letter | char('_')
    Parser<String> identLetter    : null, // alphanum | char('_')
    List<String>   reservedNames  : const []
  }) {
    final identStartDefault = letter | char('_');
    final identLetterDefault = alphanum | char('_');

    _commentStart = commentStart;
    _commentEnd = commentEnd;
    _commentLine = commentLine;
    _nestedComments = nestedComments;
    _identStart = (identStart == null) ? identStartDefault : identStart;
    _identLetter = (identLetter == null) ? identLetterDefault : identLetter;
    _reservedNames = new Set<String>.from(reservedNames);
  }

  Parser<String> get semi  => symbol(';') % 'semicolon';
  Parser<String> get comma => symbol(',') % 'comma';
  Parser<String> get colon => symbol(':') % 'colon';
  Parser<String> get dot   => symbol('.') % 'dot';

  Parser<String> get _ident =>
      success((c) => (cs) => "$c${cs.join()}")
      * _identStart
      * _identLetter.many;

  Parser<String> get identifier =>
      lexeme(_ident >> (name) =>
             _reservedNames.contains(name) ? fail : success(name))
      % 'identifier';

  ReservedNames get reserved {
    if (_reserved == null) {
      final map = new Map<String, Parser<String>>();
      for (final name in _reservedNames) {
        map[name] = lexeme(string(name).notFollowedBy(_identLetter));
      }
      _reserved = new ReservedNames._(map);
    }
    return _reserved;
  }

  final Parser<String> _escapeCode =
      (char('a')  > success('\a'))
    | (char('b')  > success('\b'))
    | (char('f')  > success('\f'))
    | (char('n')  > success('\n'))
    | (char('r')  > success('\r'))
    | (char('t')  > success('\t'))
    | (char('v')  > success('\v'))
    | (char('\\') > success('\\'))
    | (char('"')  > success('"'))
    | (char("'")  > success("'"));

  Parser<String> get _charChar => (char('\\') > _escapeCode)
                                | pred((c) => c != "'");

  Parser<String> get charLiteral =>
      lexeme(_charChar.between(char("'"), char("'")))
      % 'character literal';

  Parser<String> get _stringChar => (char('\\') > _escapeCode)
                                  | pred((c) => c != '"');

  Parser<String> get stringLiteral =>
      lexeme(_stringChar.many.between(char('"'), char('"')))
      .map((cs) => cs.join())
      % 'string literal';

  final Parser<String> _hexDigit = oneOf("0123456789abcdefABCDEF");

  final Parser<String> _octalDigit = oneOf("01234567");

  Parser<String> get _maybeSign => (char('-') | char('+')).orElse('');

  Parser<String> _concat(Parser<List<String>> parsers) =>
      parsers.map((list) => list.join());

  Parser<String> _concatSum(accum) => _concat(accum.list);

  Parser<String> get _decimal => _concat(digit.many1);

  Parser<String> get _hexaDecimal =>
      _concatSum(oneOf("xX") + _concat(_hexDigit.many1));

  Parser<String> get _octal =>
      _concatSum(oneOf("oO") + _concat(_octalDigit.many1));

  Parser<String> get _zeroNumber => _concat(
      (char('0') + (_hexaDecimal | _octal | _decimal).orElse('')).list);

  Parser<String> get _nat => _zeroNumber | _decimal;

  Parser<String> get _int => _concatSum(lexeme(_maybeSign) + _nat);

  Parser<String> get _exponent =>
      _concatSum(oneOf('eE') + _maybeSign + _concat(digit.many1));

  Parser<String> get _fraction =>
      _concatSum(char('.') + _concat(digit.many1));

  Parser<String> get _fractExponent =>
      _concatSum(_fraction + _exponent.orElse('')) | _exponent;

  Parser<String> get _float => _concatSum(decimal + _fractExponent);

  final RegExp _octalPrefix = new RegExp('0[Oo]');

  int parseInt(String str) {
    if (_octalPrefix.hasMatch(str)) {
      return int.parse(str.replaceFirst(_octalPrefix, ''), radix: 8);
    }
    return int.parse(str);
  }

  Parser<int> get natural =>
      lexeme(_nat).map(parseInt) % 'natural number';

  Parser<int> get intLiteral =>
      lexeme(_int).map(parseInt) % 'integer';

  Parser<double> get floatLiteral =>
      lexeme(_float).map(double.parse) % 'float';

  Parser<int> get decimal =>
      lexeme(_decimal).map(int.parse) % 'decimal number';

  Parser<int> get hexaDecimal =>
      lexeme(_hexaDecimal).map(int.parse) % 'hexadecimal number';

  Parser<int> get octal =>
      lexeme(_octal).map(parseInt) % 'octal number';

  /**
   * [lexeme] parser for [symb] symbol.
   */
  Parser<String> symbol(String symb) => lexeme(string(symb));

  /**
   * Parser combinator which skips whitespaces from the right side.
   */
  Parser lexeme(Parser p) => p < whiteSpace;

  Parser get _start => string(_commentStart);
  Parser get _end => string(_commentEnd);

  Parser get _multiLineComment =>
      skipEverythingBetween(_start, _end, nested: _nestedComments);

  Parser get _oneLineComment =>
      string(_commentLine) > (pred((c) => c != '\n').skipMany > success(null));

  Parser get whiteSpace => _whiteSpace % 'whitespace/comment';

  Parser get _whiteSpace {
    if (_commentLine.isEmpty && _commentStart.isEmpty) {
      return space.skipMany;
    } else if (_commentLine.isEmpty) {
      return (space | _multiLineComment).skipMany;
    } else if (_commentStart.isEmpty) {
      return (space | _oneLineComment).skipMany;
    } else {
      return (space | _oneLineComment | _multiLineComment).skipMany;
    }
  }

  Parser parens(Parser p) => p.between(symbol('('), symbol(')'));

  Parser braces(Parser p) => p.between(symbol('{'), symbol('}'));

  Parser angles(Parser p) => p.between(symbol('<'), symbol('>'));

  Parser brackets(Parser p) => p.between(symbol('['), symbol(']'));
}
