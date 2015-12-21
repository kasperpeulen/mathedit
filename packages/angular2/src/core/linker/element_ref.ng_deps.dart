library angular2.src.core.linker.element_ref.ng_deps.dart;

import 'element_ref.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, unimplemented;
import 'view_ref.dart' show ViewRef, ViewRef_;
import 'package:angular2/src/core/render/api.dart' show RenderViewRef, RenderElementRef, Renderer;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'view_ref.ng_deps.dart' as i1;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i2;
export 'element_ref.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
