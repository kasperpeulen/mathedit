import 'server.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/platform/server/html_adapter.ng_deps.dart' as i0;
export 'server.dart';
export 'package:angular2/src/platform/server/html_adapter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
