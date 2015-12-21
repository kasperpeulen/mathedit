library angular2.src.compiler.util.ng_deps.dart;

import 'util.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show IS_DART, StringWrapper, isBlank;
export 'util.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
}
