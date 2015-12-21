library angular.core.facade.dom.ng_deps.dart;

import 'browser_adapter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:html';
import 'package:angular2/platform/common_dom.dart' show setRootDomAdapter;
import 'generic_browser_adapter.dart' show GenericBrowserDomAdapter;
import 'package:angular2/src/facade/browser.dart';
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent;
import 'dart:js' as js;
import 'package:angular2/platform/common_dom.ng_deps.dart' as i0;
import 'generic_browser_adapter.ng_deps.dart' as i1;
export 'browser_adapter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
