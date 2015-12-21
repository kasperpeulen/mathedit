library angular2.src.core.linker.template_commands.ng_deps.dart;

import 'template_commands.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, isPresent, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show unimplemented;
import 'package:angular2/src/core/render/api.dart' show RenderTemplateCmd, RenderCommandVisitor, RenderBeginElementCmd, RenderTextCmd, RenderNgContentCmd, RenderBeginComponentCmd, RenderEmbeddedTemplateCmd;
import 'package:angular2/src/core/metadata.dart' show ViewEncapsulation;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i1;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i2;
export 'template_commands.dart';
export 'package:angular2/src/core/metadata.dart' show ViewEncapsulation;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
