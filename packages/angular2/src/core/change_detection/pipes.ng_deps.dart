library angular2.src.core.change_detection.pipes.ng_deps.dart;

import 'pipes.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'pipe_transform.dart' show PipeTransform;
export 'pipes.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
}
