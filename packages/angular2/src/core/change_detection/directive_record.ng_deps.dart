library angular2.src.core.change_detection.directive_record.ng_deps.dart;

import 'directive_record.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show StringWrapper, normalizeBool, isBlank;
import 'constants.dart' show isDefaultChangeDetectionStrategy, ChangeDetectionStrategy;
import 'constants.ng_deps.dart' as i0;
export 'directive_record.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
