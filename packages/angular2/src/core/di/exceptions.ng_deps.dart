library angular2.src.core.di.exceptions.ng_deps.dart;

import 'exceptions.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/facade/lang.dart' show stringify, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException, unimplemented;
import 'key.dart' show Key;
import 'injector.dart' show Injector;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'key.ng_deps.dart' as i1;
import 'injector.ng_deps.dart' as i2;
export 'exceptions.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
