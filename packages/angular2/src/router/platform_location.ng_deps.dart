library angular2.src.router.platform_location.ng_deps.dart;

import 'platform_location.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/core.dart' show Injectable;
import 'package:angular2/src/facade/browser.dart' show EventListener, History, Location;
import 'package:angular2/src/platform/dom/dom_adapter.ng_deps.dart' as i0;
import 'package:angular2/core.ng_deps.dart' as i1;
export 'platform_location.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(PlatformLocation, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new PlatformLocation())
)
;
i0.initReflector();
i1.initReflector();
}
