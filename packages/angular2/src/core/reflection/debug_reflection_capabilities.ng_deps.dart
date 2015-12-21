library reflection.debug_reflection_capabilities.ng_deps.dart;

import 'debug_reflection_capabilities.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:mirrors';
import 'package:logging/logging.dart' as log;
import 'package:stack_trace/stack_trace.dart';
import 'types.dart';
import 'reflection_capabilities.dart' as standard;
import 'reflection_capabilities.ng_deps.dart' as i0;
export 'debug_reflection_capabilities.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
