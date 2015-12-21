library angular2.src.compiler.xhr_mock.ng_deps.dart;

import 'xhr_mock.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/compiler/xhr.dart' show XHR;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, Map, MapWrapper;
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/async.dart' show PromiseCompleter, PromiseWrapper, Future;
import 'package:angular2/src/compiler/xhr.ng_deps.dart' as i0;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/facade/async.ng_deps.dart' as i2;
export 'xhr_mock.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
