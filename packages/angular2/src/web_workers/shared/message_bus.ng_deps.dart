library angular2.src.web_workers.shared.message_bus.ng_deps.dart;

import 'message_bus.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/async.dart' show EventEmitter;
import 'package:angular2/src/core/zone/ng_zone.dart' show NgZone;
import 'package:angular2/src/facade/async.ng_deps.dart' as i0;
import 'package:angular2/src/core/zone/ng_zone.ng_deps.dart' as i1;
export 'message_bus.dart';
export 'package:angular2/src/facade/async.dart' show EventEmitter, Stream;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
