library angular2.src.platform.dom.shared_styles_host.ng_deps.dart;

import 'shared_styles_host.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/di.dart' show Inject, Injectable;
import 'package:angular2/src/facade/collection.dart' show SetWrapper;
import 'dom_tokens.dart' show DOCUMENT;
import 'package:angular2/src/platform/dom/dom_adapter.ng_deps.dart' as i0;
import 'package:angular2/src/core/di.ng_deps.dart' as i1;
import 'dom_tokens.ng_deps.dart' as i2;
export 'shared_styles_host.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(SharedStylesHost, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new SharedStylesHost())
)
..registerType(DomSharedStylesHost, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [dynamic, const Inject(DOCUMENT)]],
(dynamic doc) => new DomSharedStylesHost(doc))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
