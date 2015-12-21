library angular2.src.core.di.key.ng_deps.dart;

import 'key.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show stringify, Type, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'type_literal.dart' show TypeLiteral;
import 'forward_ref.dart' show resolveForwardRef;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
export 'key.dart';
export 'type_literal.dart' show TypeLiteral;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
