library reflection.reflection_capabilities.ng_deps.dart;

import 'reflection_capabilities.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart';
import 'types.dart';
import 'dart:mirrors';
import 'platform_reflection_capabilities.dart';
import 'platform_reflection_capabilities.ng_deps.dart' as i0;
export 'reflection_capabilities.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
