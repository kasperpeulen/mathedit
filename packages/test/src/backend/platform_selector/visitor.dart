// Copyright (c) 2015, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library test.backend.platform_selector.visitor;

import 'ast.dart';

/// The interface for visitors of the platform selector AST.
abstract class Visitor<T> {
  T visitVariable(VariableNode node);
  T visitNot(NotNode node);
  T visitOr(OrNode node);
  T visitAnd(AndNode node);
  T visitConditional(ConditionalNode node);
}

/// An abstract superclass for side-effect-based visitors.
///
/// The default implementations of this visitor's methods just traverse the AST
/// and do nothing with it.
abstract class RecursiveVisitor implements Visitor {
  const RecursiveVisitor();

  void visitVariable(VariableNode node) {}

  void visitNot(NotNode node) {
    node.child.accept(this);
  }

  void visitOr(OrNode node) {
    node.left.accept(this);
    node.right.accept(this);
  }

  void visitAnd(AndNode node) {
    node.left.accept(this);
    node.right.accept(this);
  }

  void visitConditional(ConditionalNode node) {
    node.condition.accept(this);
    node.whenTrue.accept(this);
    node.whenFalse.accept(this);
  }
}
