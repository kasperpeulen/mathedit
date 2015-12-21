library angular2.src.core.change_detection.parser.locals.ng_deps.dart;

import 'locals.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, MapWrapper;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
export 'locals.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
