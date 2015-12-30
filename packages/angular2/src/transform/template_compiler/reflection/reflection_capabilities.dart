library angular2.transform.template_compiler.reflection.reflection_capabilities;

import 'package:angular2/src/core/reflection/reflection_capabilities.dart';
import 'package:angular2/src/core/reflection/types.dart';

/// ReflectionCapabilities object that responds to all requests for `getter`s,
/// `setter`s, and `method`s with `null`.
class NullReflectionCapabilities implements ReflectionCapabilities {
  const NullReflectionCapabilities();

  _notImplemented(String name) => throw 'Not implemented: $name';

  bool isReflectionEnabled() => false;

  Function factory(Type type) => _notImplemented("factory");

  List<List> parameters(typeOrFunc) => _notImplemented('parameters');

  List<List> interfaces(typeOrFunc) => _notImplemented('interfaces');

  List annotations(typeOrFunc) => _notImplemented('annotations');

  Map propMetadata(typeOrFunc) => _notImplemented('propMetadata');

  GetterFn getter(String name) => _nullGetter;

  SetterFn setter(String name) => _nullSetter;

  MethodFn method(String name) => _nullMethod;

  String importUri(Type type) => './';
}

_nullGetter(Object p) => null;
_nullSetter(Object p, v) => null;
_nullMethod(Object p, List a) => null;
