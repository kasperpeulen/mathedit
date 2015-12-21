library angular2.src.router.instruction.ng_deps.dart;

import 'instruction.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show Map, MapWrapper, StringMapWrapper, ListWrapper;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, Type;
import 'package:angular2/src/facade/async.dart' show Future, PromiseWrapper;
import 'package:angular2/src/facade/async.ng_deps.dart' as i0;
export 'instruction.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
