library angular2.src.common.pipes.async_pipe.ng_deps.dart;

import 'async_pipe.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent, isPromise;
import 'package:angular2/src/facade/async.dart' show Future, ObservableWrapper, Stream, EventEmitter;
import 'package:angular2/core.dart' show Pipe, Injectable, ChangeDetectorRef, OnDestroy, PipeTransform, WrappedValue;
import 'invalid_pipe_argument_exception.dart' show InvalidPipeArgumentException;
import 'package:angular2/src/facade/async.ng_deps.dart' as i0;
import 'package:angular2/core.ng_deps.dart' as i1;
import 'invalid_pipe_argument_exception.ng_deps.dart' as i2;
export 'async_pipe.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(AsyncPipe, new _ngRef.ReflectionInfo(
const [const Pipe(name: "async", pure: false), const Injectable()],
const [const [ChangeDetectorRef]],
(ChangeDetectorRef _ref) => new AsyncPipe(_ref),
const [PipeTransform, OnDestroy])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
