import 'editor.service.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:event_bus/event_bus.dart';
import 'dart:html';
import 'package:mathedit/service/gist.service.dart';
import 'package:angular2/router.dart';
import 'package:usage/usage.dart';
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'package:mathedit/service/gist.service.ng_deps.dart' as i1;
import 'package:angular2/router.ng_deps.dart' as i2;
export 'editor.service.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(EditorService, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Analytics], const [MyGistsService], const [EventBus], const [Storage], const [Router]],
(Analytics _analytics, MyGistsService _gistsService, EventBus _eventBus, Storage _storage, Router _router) => new EditorService(_analytics, _gistsService, _eventBus, _storage, _router))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
