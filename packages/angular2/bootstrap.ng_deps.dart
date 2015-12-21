library angular2.bootstrap.ng_deps.dart;

import 'bootstrap.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/platform/browser.ng_deps.dart' as i0;
export 'bootstrap.dart';
export 'package:angular2/platform/browser.dart' show bootstrap;
export 'package:angular2/src/core/angular_entrypoint.dart' show AngularEntrypoint;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
