library angular2.platform.browser_static.ng_deps.dart;

import 'browser_static.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, isPresent;
import 'package:angular2/src/facade/promise.dart' show Future;
import 'package:angular2/src/platform/browser_common.dart' show BROWSER_PROVIDERS, BROWSER_APP_COMMON_PROVIDERS;
import 'package:angular2/core.dart' show ComponentRef, platform;
import 'package:angular2/src/platform/browser_common.ng_deps.dart' as i0;
import 'package:angular2/core.ng_deps.dart' as i1;
export 'browser_static.dart';
export 'package:angular2/src/core/angular_entrypoint.dart' show AngularEntrypoint;
export 'package:angular2/src/platform/browser_common.dart' show BROWSER_PROVIDERS, ELEMENT_PROBE_BINDINGS, ELEMENT_PROBE_PROVIDERS, inspectNativeElement, BrowserDomAdapter, By, Title, enableDebugTools, disableDebugTools;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
