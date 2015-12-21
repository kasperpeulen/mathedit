library angular2.src.router.sync_route_handler.ng_deps.dart;

import 'sync_route_handler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/async.dart' show Future, PromiseWrapper;
import 'package:angular2/src/facade/lang.dart' show isPresent, Type;
import 'route_handler.dart' show RouteHandler;
import 'instruction.dart' show RouteData, BLANK_ROUTE_DATA;
import 'package:angular2/src/facade/async.ng_deps.dart' as i0;
import 'route_handler.ng_deps.dart' as i1;
import 'instruction.ng_deps.dart' as i2;
export 'sync_route_handler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
