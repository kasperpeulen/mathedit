library angular2.src.core.change_detection.event_binding.ng_deps.dart;

import 'event_binding.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'directive_record.dart' show DirectiveIndex;
import 'proto_record.dart' show ProtoRecord;
import 'directive_record.ng_deps.dart' as i0;
import 'proto_record.ng_deps.dart' as i1;
export 'event_binding.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
