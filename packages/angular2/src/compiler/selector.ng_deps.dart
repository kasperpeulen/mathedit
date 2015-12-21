library angular2.src.compiler.selector.ng_deps.dart;

import 'selector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show Map, ListWrapper, MapWrapper;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, RegExpWrapper, RegExpMatcherWrapper, StringWrapper;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
export 'selector.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
