library angular2.src.core.reflection.reflector.ng_deps.dart;

import 'reflector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, isPresent, stringify;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, Map, MapWrapper, Set, SetWrapper, StringMapWrapper;
import 'types.dart' show SetterFn, GetterFn, MethodFn;
import 'platform_reflection_capabilities.dart' show PlatformReflectionCapabilities;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'platform_reflection_capabilities.ng_deps.dart' as i1;
export 'reflector.dart';
export 'types.dart' show SetterFn, GetterFn, MethodFn;
export 'platform_reflection_capabilities.dart' show PlatformReflectionCapabilities;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
