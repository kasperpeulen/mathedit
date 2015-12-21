library angular2.src.core.zone.ng_deps.dart;

import 'zone.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'zone/ng_zone.ng_deps.dart' as i0;
export 'zone.dart';
export 'zone/ng_zone.dart' show NgZone, ZeroArgFunction, ErrorHandlingFn, NgZoneError;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
