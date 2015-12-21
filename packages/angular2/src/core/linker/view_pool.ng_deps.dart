library angular2.src.core.linker.view_pool.ng_deps.dart;

import 'view_pool.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Inject, Injectable, OpaqueToken;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/facade/collection.dart' show MapWrapper, Map;
import 'view.dart' as viewModule;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'view.ng_deps.dart' as i1;
export 'view_pool.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(AppViewPool, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [const Inject(APP_VIEW_POOL_CAPACITY)]],
(poolCapacityPerProtoView) => new AppViewPool(poolCapacityPerProtoView))
)
;
i0.initReflector();
i1.initReflector();
}
