library angular2.src.common.pipes.slice_pipe.ng_deps.dart;

import 'slice_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isBlank, isString, isArray, StringWrapper;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'package:angular2/core.dart' show Injectable, PipeTransform, WrappedValue, Pipe;
import 'invalid_pipe_argument_exception.dart' show InvalidPipeArgumentException;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'package:angular2/core.ng_deps.dart' as i1;
import 'invalid_pipe_argument_exception.ng_deps.dart' as i2;
export 'slice_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(SlicePipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "slice", pure: false), const Injectable()],
const [],
() => new SlicePipe(),
const [PipeTransform])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
