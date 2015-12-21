library angular2.src.router.router.ng_deps.dart;

import 'router.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/async.dart' show Future, PromiseWrapper, EventEmitter, ObservableWrapper;
import 'package:angular2/src/facade/collection.dart' show Map, StringMapWrapper, MapWrapper, ListWrapper;
import 'package:angular2/src/facade/lang.dart' show isBlank, isString, isPresent, Type, isArray;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/core.dart' show Inject, Injectable;
import 'route_registry.dart' show RouteRegistry, ROUTER_PRIMARY_COMPONENT;
import 'instruction.dart' show ComponentInstruction, Instruction;
import 'router_outlet.dart' show RouterOutlet;
import 'location.dart' show Location;
import 'route_lifecycle_reflector.dart' show getCanActivateHook;
import 'route_config_impl.dart' show RouteDefinition;
import 'package:angular2/src/facade/async.ng_deps.dart' as i0;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/core.ng_deps.dart' as i2;
import 'route_registry.ng_deps.dart' as i3;
import 'instruction.ng_deps.dart' as i4;
import 'router_outlet.ng_deps.dart' as i5;
import 'location.ng_deps.dart' as i6;
import 'route_lifecycle_reflector.ng_deps.dart' as i7;
import 'route_config_impl.ng_deps.dart' as i8;
export 'router.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(RootRouter, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [RouteRegistry], const [Location], const [Type, const Inject(ROUTER_PRIMARY_COMPONENT)]],
(RouteRegistry registry, Location location, Type primaryComponent) => new RootRouter(registry, location, primaryComponent))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
}
