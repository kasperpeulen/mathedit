library angular2.src.router.route_registry.ng_deps.dart;

import 'route_registry.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, Map, MapWrapper, StringMapWrapper;
import 'package:angular2/src/facade/async.dart' show Future, PromiseWrapper;
import 'package:angular2/src/facade/lang.dart' show isPresent, isArray, isBlank, isType, isString, isStringMap, Type, getTypeNameForDebugging;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/core.dart' show Injectable, Inject, OpaqueToken;
import 'route_config_impl.dart' show RouteConfig, AsyncRoute, Route, AuxRoute, Redirect, RouteDefinition;
import 'route_recognizer.dart' show PathMatch, RedirectMatch, RouteMatch;
import 'component_recognizer.dart' show ComponentRecognizer;
import 'instruction.dart' show Instruction, ResolvedInstruction, RedirectInstruction, UnresolvedInstruction, DefaultInstruction;
import 'route_config_nomalizer.dart' show normalizeRouteConfig, assertComponentExists;
import 'url_parser.dart' show parser, Url, pathSegmentsToUrl;
import 'package:angular2/src/facade/async.ng_deps.dart' as i0;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i2;
import 'package:angular2/core.ng_deps.dart' as i3;
import 'route_config_impl.ng_deps.dart' as i4;
import 'route_recognizer.ng_deps.dart' as i5;
import 'component_recognizer.ng_deps.dart' as i6;
import 'instruction.ng_deps.dart' as i7;
import 'route_config_nomalizer.ng_deps.dart' as i8;
import 'url_parser.ng_deps.dart' as i9;
export 'route_registry.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(RouteRegistry, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Type, const Inject(ROUTER_PRIMARY_COMPONENT)]],
(Type _rootComponent) => new RouteRegistry(_rootComponent))
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
i9.initReflector();
}
