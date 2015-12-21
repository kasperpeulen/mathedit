library angular2.src.animate.browser_details.ng_deps.dart;

import 'browser_details.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/facade/math.dart' show Math;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/platform/dom/dom_adapter.ng_deps.dart' as i1;
export 'browser_details.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(BrowserDetails, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new BrowserDetails())
)
;
i0.initReflector();
i1.initReflector();
}
