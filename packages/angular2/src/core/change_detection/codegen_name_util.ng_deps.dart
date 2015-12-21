library angular2.src.core.change_detection.codegen_name_util.ng_deps.dart;

import 'codegen_name_util.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show RegExpWrapper, StringWrapper;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, MapWrapper, Map;
import 'directive_record.dart' show DirectiveIndex;
import 'proto_record.dart' show ProtoRecord;
import 'event_binding.dart' show EventBinding;
import 'directive_record.ng_deps.dart' as i0;
import 'proto_record.ng_deps.dart' as i1;
import 'event_binding.ng_deps.dart' as i2;
export 'codegen_name_util.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
