library angular2.src.core.change_detection.proto_record.ng_deps.dart;

import 'proto_record.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'binding_record.dart' show BindingRecord;
import 'directive_record.dart' show DirectiveIndex;
import 'binding_record.ng_deps.dart' as i0;
import 'directive_record.ng_deps.dart' as i1;
export 'proto_record.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
