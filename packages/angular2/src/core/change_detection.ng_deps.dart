library angular2.src.core.change_detection.ng_deps.dart;

import 'change_detection.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'change_detection/change_detection.ng_deps.dart' as i0;
export 'change_detection.dart';
export 'change_detection/change_detection.dart' show ChangeDetectionStrategy, ExpressionChangedAfterItHasBeenCheckedException, ChangeDetectionError, ChangeDetectorRef, WrappedValue, SimpleChange, PipeTransform, IterableDiffers, IterableDiffer, IterableDifferFactory, KeyValueDiffers, KeyValueDiffer, KeyValueDifferFactory;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
