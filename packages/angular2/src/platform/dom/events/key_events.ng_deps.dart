library angular2.src.platform.dom.events.key_events.ng_deps.dart;

import 'key_events.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:html';
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, StringWrapper, RegExpWrapper, NumberWrapper;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper, ListWrapper;
import 'event_manager.dart' show EventManagerPlugin;
import 'package:angular2/src/core/zone/ng_zone.dart' show NgZone;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/platform/dom/dom_adapter.ng_deps.dart' as i0;
import 'event_manager.ng_deps.dart' as i1;
import 'package:angular2/src/core/zone/ng_zone.ng_deps.dart' as i2;
import 'package:angular2/src/core/di.ng_deps.dart' as i3;
export 'key_events.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(KeyEventsPlugin, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new KeyEventsPlugin())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
