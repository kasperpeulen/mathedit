library angular2.src.facade.exception_handler.ng_deps.dart;

import 'exception_handler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, print;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, isListLikeIterable;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
export 'exception_handler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
