library angular2.src.platform.dom.dom_tokens.ng_deps.dart;

import 'dom_tokens.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show OpaqueToken;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
export 'dom_tokens.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
