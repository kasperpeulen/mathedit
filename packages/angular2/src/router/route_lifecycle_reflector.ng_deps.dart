library angular.router.route_lifecycle_reflector.ng_deps.dart;

import 'route_lifecycle_reflector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/router/lifecycle_annotations_impl.dart';
import 'package:angular2/src/router/interfaces.dart';
import 'package:angular2/src/core/reflection/reflection.dart';
import 'package:angular2/src/router/interfaces.ng_deps.dart' as i0;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i1;
export 'route_lifecycle_reflector.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
