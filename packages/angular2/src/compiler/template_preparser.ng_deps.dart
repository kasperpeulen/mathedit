library angular2.src.compiler.template_preparser.ng_deps.dart;

import 'template_preparser.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'html_ast.dart' show HtmlElementAst;
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent;
import 'html_tags.dart' show splitNsName;
import 'html_ast.ng_deps.dart' as i0;
import 'html_tags.ng_deps.dart' as i1;
export 'template_preparser.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
