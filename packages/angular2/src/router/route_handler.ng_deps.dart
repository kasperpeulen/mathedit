library angular2.src.router.route_handler.ng_deps.dart;

import 'route_handler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/async.dart' show Future, PromiseWrapper;
import 'package:angular2/src/facade/lang.dart' show Type;
import 'instruction.dart' show RouteData;
import 'package:angular2/src/facade/async.ng_deps.dart' as i0;
import 'instruction.ng_deps.dart' as i1;
export 'route_handler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
