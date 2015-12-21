library angular2.src.core.linker.interfaces.ng_deps.dart;

import 'interfaces.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show MapWrapper;
import 'package:angular2/src/core/change_detection/change_detection_util.dart' show SimpleChange;
import 'package:angular2/src/core/change_detection/change_detection_util.ng_deps.dart' as i0;
export 'interfaces.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
