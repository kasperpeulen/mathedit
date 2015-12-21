library testing.matchers.ng_deps.dart;

import 'matchers.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:guinness/guinness.dart' as gns;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/facade/lang.dart' show isString;
import 'package:angular2/src/platform/dom/dom_adapter.ng_deps.dart' as i0;
export 'matchers.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
