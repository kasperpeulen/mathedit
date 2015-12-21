library angular2.src.router.component_recognizer.ng_deps.dart;

import 'component_recognizer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/collection.dart' show Map, MapWrapper, ListWrapper, StringMapWrapper;
import 'package:angular2/src/facade/async.dart' show Future, PromiseWrapper;
import 'route_recognizer.dart' show AbstractRecognizer, RouteRecognizer, RedirectRecognizer, RouteMatch;
import 'route_config_impl.dart' show Route, AsyncRoute, AuxRoute, Redirect, RouteDefinition;
import 'async_route_handler.dart' show AsyncRouteHandler;
import 'sync_route_handler.dart' show SyncRouteHandler;
import 'url_parser.dart' show Url;
import 'instruction.dart' show ComponentInstruction;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'package:angular2/src/facade/async.ng_deps.dart' as i1;
import 'route_recognizer.ng_deps.dart' as i2;
import 'route_config_impl.ng_deps.dart' as i3;
import 'async_route_handler.ng_deps.dart' as i4;
import 'sync_route_handler.ng_deps.dart' as i5;
import 'url_parser.ng_deps.dart' as i6;
import 'instruction.ng_deps.dart' as i7;
export 'component_recognizer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
}
