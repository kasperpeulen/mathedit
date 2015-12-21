library angular2.src.core.platform_directives_and_pipes.ng_deps.dart;

import 'platform_directives_and_pipes.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show OpaqueToken;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
export 'platform_directives_and_pipes.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
