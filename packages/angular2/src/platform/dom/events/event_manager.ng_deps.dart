library angular2.src.platform.dom.events.event_manager.ng_deps.dart;

import 'event_manager.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/core/di.dart' show Injectable, Inject, OpaqueToken;
import 'package:angular2/src/core/zone/ng_zone.dart' show NgZone;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'package:angular2/src/core/di.ng_deps.dart' as i1;
import 'package:angular2/src/core/zone/ng_zone.ng_deps.dart' as i2;
export 'event_manager.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(EventManager, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [List, const Inject(EVENT_MANAGER_PLUGINS)], const [NgZone]],
(List<EventManagerPlugin> plugins, NgZone _zone) => new EventManager(plugins, _zone))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
