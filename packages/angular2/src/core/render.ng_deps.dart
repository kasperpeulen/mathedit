library angular2.src.core.render.ng_deps.dart;

import 'render.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'render/api.ng_deps.dart' as i0;
export 'render.dart';
export 'render/api.dart' show RenderEventDispatcher, Renderer, RenderElementRef, RenderViewRef, RenderProtoViewRef, RenderFragmentRef, RenderViewWithFragments, RenderTemplateCmd, RenderCommandVisitor, RenderTextCmd, RenderNgContentCmd, RenderBeginElementCmd, RenderBeginComponentCmd, RenderEmbeddedTemplateCmd, RenderBeginCmd, RenderComponentTemplate;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
