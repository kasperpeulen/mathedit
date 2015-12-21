library angular2.src.router.hash_location_strategy.ng_deps.dart;

import 'hash_location_strategy.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Injectable, Inject, Optional;
import 'location_strategy.dart' show LocationStrategy, joinWithSlash, APP_BASE_HREF, normalizeQueryParams;
import 'package:angular2/src/facade/browser.dart' show EventListener;
import 'package:angular2/src/facade/lang.dart' show isPresent;
import 'platform_location.dart' show PlatformLocation;
import 'package:angular2/core.ng_deps.dart' as i0;
import 'location_strategy.ng_deps.dart' as i1;
import 'platform_location.ng_deps.dart' as i2;
export 'hash_location_strategy.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(HashLocationStrategy, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [PlatformLocation], const [String, const Optional(), const Inject(APP_BASE_HREF)]],
(PlatformLocation _platformLocation, String _baseHref) => new HashLocationStrategy(_platformLocation, _baseHref))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
