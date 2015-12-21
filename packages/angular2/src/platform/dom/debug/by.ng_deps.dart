library angular2.src.platform.dom.debug.by.ng_deps.dart;

import 'by.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, isPresent, isBlank;
import 'package:angular2/src/facade/collection.dart' show Predicate;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/core.dart' show DebugElement;
import 'package:angular2/src/platform/dom/dom_adapter.ng_deps.dart' as i0;
import 'package:angular2/core.ng_deps.dart' as i1;
export 'by.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
