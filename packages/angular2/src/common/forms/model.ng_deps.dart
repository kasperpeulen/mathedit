library angular2.src.common.forms.model.ng_deps.dart;

import 'model.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show StringWrapper, isPresent, isBlank, normalizeBool;
import 'package:angular2/src/facade/async.dart' show Stream, EventEmitter, ObservableWrapper;
import 'package:angular2/src/facade/promise.dart' show PromiseWrapper;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper, ListWrapper;
import 'package:angular2/src/facade/async.ng_deps.dart' as i0;
export 'model.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
