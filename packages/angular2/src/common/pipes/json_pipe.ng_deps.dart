library angular2.src.common.pipes.json_pipe.ng_deps.dart;

import 'json_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent, Json;
import 'package:angular2/core.dart' show Injectable, PipeTransform, WrappedValue, Pipe;
import 'package:angular2/core.ng_deps.dart' as i0;
export 'json_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(JsonPipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "json", pure: false), const Injectable()],
const [],
() => new JsonPipe(),
const [PipeTransform])
)
;
i0.initReflector();
}
