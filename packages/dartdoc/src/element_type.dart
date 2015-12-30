// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

/// The models used to represent Dart code.
library dartdoc.element_type;

import 'package:analyzer/src/generated/element.dart';

import 'model.dart';

class ElementType {
  final DartType _type;
  final ModelElement element;
  String _linkedName;

  ElementType(this._type, this.element);

  String toString() => "$_type";

  bool get isDynamic => _type.isDynamic;

  bool get isParameterType => (_type is TypeParameterType);

  bool get isFunctionType => (_type is FunctionType);

  String get name => _type.name;

  DartType get _returnTypeCore => (_type as FunctionType).returnType;

  // TODO: this is probably a bug. Apparently, EVERYTHING is a parameterized type?
  bool get isParameterizedType => (_type is ParameterizedType) &&
      (_type as ParameterizedType).typeArguments.isNotEmpty;

  String get _returnTypeName => _returnTypeCore.name;

  ElementType get _returnType {
    var rt = _returnTypeCore;
    Library lib = element.package.findLibraryFor(rt.element);
    if (lib == null) {
      lib = new Library(rt.element.library, element.package);
    }
    return new ElementType(rt, new ModelElement.from(rt.element, lib));
  }

  ModelElement get returnElement {
    Element e = _returnTypeCore.element;
    if (e == null) {
      return null;
    }
    Library lib = element.package.findLibraryFor(e);
    if (lib == null) {
      lib = new Library(e.library, element.package);
    }
    return (new ModelElement.from(e, lib));
  }

  List<ElementType> get typeArguments =>
      (_type as ParameterizedType).typeArguments.map((f) {
        Library lib;
        // can happen if element is dynamic
        lib = element.package.findLibraryFor(f.element);
        if (lib == null && f.element.library != null) {
          lib = new Library(f.element.library, element.package);
        }
        return new ElementType(f, new ModelElement.from(f.element, lib));
      }).toList();

  String get linkedName {
    if (_linkedName != null) return _linkedName;

    StringBuffer buf = new StringBuffer();

    if (isParameterType) {
      buf.write(name);
    } else {
      buf.write(element.linkedName);
    }

    // not TypeParameterType or Void or Union type
    if (isParameterizedType) {
      if (typeArguments.every((t) => t.linkedName == 'dynamic')) {
        _linkedName = buf.toString();
        return _linkedName;
      }
      if (typeArguments.isNotEmpty) {
        buf.write('&lt;');
        buf.writeAll(typeArguments.map((t) => t.linkedName), ', ');
        buf.write('&gt;');
      }
    }
    _linkedName = buf.toString();

    return _linkedName;
  }

  String createLinkedReturnTypeName() {
    if (_returnTypeCore.element == null ||
        _returnTypeCore.element.library == null) {
      if (_returnTypeName != null) {
        if (_returnTypeName == 'dynamic' && element.isAsynchronous) {
          // TODO(keertip): for SDK docs it should be a link
          return 'Future';
        }
        return _returnTypeName;
      } else {
        return '';
      }
    } else {
      return _returnType.linkedName;
    }
  }
}
