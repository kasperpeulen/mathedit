library angular2.src.platform.dom.debug.debug_element_view_listener.ng_deps.dart;

import 'debug_element_view_listener.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, NumberWrapper, StringWrapper;
import 'package:angular2/src/facade/collection.dart' show MapWrapper, Map, ListWrapper;
import 'package:angular2/src/core/di.dart' show Injectable, provide, Provider;
import 'package:angular2/src/core/linker/view_listener.dart' show AppViewListener;
import 'package:angular2/src/core/linker/view.dart' show AppView;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/render/api.dart' show Renderer;
import 'package:angular2/src/core/debug/debug_element.dart' show DebugElement, DebugElement_;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/core/linker/view_listener.ng_deps.dart' as i1;
import 'package:angular2/src/core/linker/view.ng_deps.dart' as i2;
import 'package:angular2/src/platform/dom/dom_adapter.ng_deps.dart' as i3;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i4;
import 'package:angular2/src/core/debug/debug_element.ng_deps.dart' as i5;
export 'debug_element_view_listener.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(DebugElementViewListener, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Renderer]],
(Renderer _renderer) => new DebugElementViewListener(_renderer),
const [AppViewListener])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
