library angular2.bootstrap_static.ng_deps.dart;

import 'bootstrap_static.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/platform/browser_static.ng_deps.dart' as i0;
export 'bootstrap_static.dart';
export 'package:angular2/platform/browser_static.dart' show bootstrapStatic;
export 'package:angular2/src/core/angular_entrypoint.dart' show AngularEntrypoint;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
