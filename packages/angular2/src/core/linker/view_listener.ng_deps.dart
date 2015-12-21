library angular2.src.core.linker.view_listener.ng_deps.dart;

import 'view_listener.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'view.dart' as viewModule;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'view.ng_deps.dart' as i1;
export 'view_listener.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(AppViewListener, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new AppViewListener())
)
;
i0.initReflector();
i1.initReflector();
}
