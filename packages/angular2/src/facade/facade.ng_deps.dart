library angular2.src.facade.facade.ng_deps.dart;

import 'facade.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'async.ng_deps.dart' as i0;
import 'exceptions.ng_deps.dart' as i1;
import 'exception_handler.ng_deps.dart' as i2;
export 'facade.dart';
export 'lang.dart' show Type;
export 'async.dart' show Stream, EventEmitter;
export 'exceptions.dart' show WrappedException;
export 'exception_handler.dart' show ExceptionHandler;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
