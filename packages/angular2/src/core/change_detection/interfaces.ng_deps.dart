library angular2.src.core.change_detection.interfaces.ng_deps.dart;

import 'interfaces.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'parser/locals.dart' show Locals;
import 'binding_record.dart' show BindingTarget, BindingRecord;
import 'directive_record.dart' show DirectiveIndex, DirectiveRecord;
import 'constants.dart' show ChangeDetectionStrategy;
import 'change_detector_ref.dart' show ChangeDetectorRef;
import 'parser/locals.ng_deps.dart' as i0;
import 'binding_record.ng_deps.dart' as i1;
import 'directive_record.ng_deps.dart' as i2;
import 'constants.ng_deps.dart' as i3;
import 'change_detector_ref.ng_deps.dart' as i4;
export 'interfaces.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
