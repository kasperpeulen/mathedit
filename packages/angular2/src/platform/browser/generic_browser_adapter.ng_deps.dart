library angular2.src.platform.browser.generic_browser_adapter.ng_deps.dart;

import 'generic_browser_adapter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, StringMapWrapper;
import 'package:angular2/src/facade/lang.dart' show isPresent, isFunction, Type;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DomAdapter;
import 'package:angular2/src/platform/browser/xhr_impl.dart' show XHRImpl;
import 'package:angular2/src/platform/dom/dom_adapter.ng_deps.dart' as i0;
import 'package:angular2/src/platform/browser/xhr_impl.ng_deps.dart' as i1;
export 'generic_browser_adapter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
