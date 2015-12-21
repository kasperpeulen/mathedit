library angular.zone.ng_deps.dart;

import 'ng_zone.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:stack_trace/stack_trace.dart' show Chain;
export 'ng_zone.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
}
