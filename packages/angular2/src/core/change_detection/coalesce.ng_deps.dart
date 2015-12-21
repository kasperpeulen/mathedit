library angular2.src.core.change_detection.coalesce.ng_deps.dart;

import 'coalesce.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, looseIdentical;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, Map;
import 'proto_record.dart' show RecordType, ProtoRecord;
import 'proto_record.ng_deps.dart' as i0;
export 'coalesce.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
