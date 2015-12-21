library angular2.src.core.render.view_factory.ng_deps.dart;

import 'view_factory.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent, StringWrapper;
import 'api.dart' show RenderEventDispatcher, RenderTemplateCmd, RenderCommandVisitor, RenderBeginElementCmd, RenderBeginComponentCmd, RenderNgContentCmd, RenderTextCmd, RenderEmbeddedTemplateCmd, RenderComponentTemplate;
import 'view.dart' show DefaultRenderView, DefaultRenderFragmentRef;
import 'package:angular2/src/core/metadata.dart' show ViewEncapsulation;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'api.ng_deps.dart' as i0;
import 'view.ng_deps.dart' as i1;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i2;
export 'view_factory.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
