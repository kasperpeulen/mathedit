library angular2.src.common.forms.validators.ng_deps.dart;

import 'validators.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent;
import 'package:angular2/src/facade/promise.dart' show PromiseWrapper;
import 'package:angular2/src/facade/async.dart' show ObservableWrapper;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, StringMapWrapper;
import 'package:angular2/core.dart' show OpaqueToken;
import 'model.dart' as modelModule;
import 'package:angular2/src/facade/async.ng_deps.dart' as i0;
import 'package:angular2/core.ng_deps.dart' as i1;
import 'model.ng_deps.dart' as i2;
export 'validators.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
