library angular2.platform.browser.ng_deps.dart;

import 'browser.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, isPresent;
import 'package:angular2/src/facade/promise.dart' show Future;
import 'package:angular2/src/platform/browser_common.dart' show BROWSER_PROVIDERS, BROWSER_APP_COMMON_PROVIDERS;
import 'package:angular2/compiler.dart' show COMPILER_PROVIDERS;
import 'package:angular2/core.dart' show ComponentRef, platform, reflector;
import 'package:angular2/src/platform/browser/xhr_impl.dart' show XHRImpl;
import 'package:angular2/compiler.dart' show XHR;
import 'package:angular2/src/core/di.dart' show Provider;
import 'package:angular2/src/platform/browser_common.ng_deps.dart' as i0;
import 'package:angular2/compiler.ng_deps.dart' as i1;
import 'package:angular2/core.ng_deps.dart' as i2;
import 'package:angular2/src/platform/browser/xhr_impl.ng_deps.dart' as i3;
import 'package:angular2/src/core/di.ng_deps.dart' as i4;
export 'browser.dart';
export 'package:angular2/src/core/angular_entrypoint.dart' show AngularEntrypoint;
export 'package:angular2/src/platform/browser_common.dart' show BROWSER_PROVIDERS, ELEMENT_PROBE_BINDINGS, ELEMENT_PROBE_PROVIDERS, inspectNativeElement, BrowserDomAdapter, By, Title, DOCUMENT, enableDebugTools, disableDebugTools;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
