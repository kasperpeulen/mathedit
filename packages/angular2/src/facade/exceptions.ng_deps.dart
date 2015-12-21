library angular.core.facade.exceptions.ng_deps.dart;

import 'exceptions.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'exception_handler.dart';
import 'exception_handler.ng_deps.dart' as i0;
export 'exceptions.dart';
export 'exception_handler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
