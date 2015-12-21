library angular2.src.core.application_tokens.ng_deps.dart;

import 'application_tokens.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show OpaqueToken, Provider;
import 'package:angular2/src/facade/lang.dart' show Math, StringWrapper;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
export 'application_tokens.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
