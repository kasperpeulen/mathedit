library angular2.src.compiler.command_compiler.ng_deps.dart;

import 'command_compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, Type, isString, StringWrapper, IS_DART;
import 'package:angular2/src/facade/collection.dart' show SetWrapper, StringMapWrapper, ListWrapper;
import 'package:angular2/src/core/linker/template_commands.dart' show TemplateCmd, TextCmd, NgContentCmd, BeginElementCmd, EndElementCmd, BeginComponentCmd, EndComponentCmd, EmbeddedTemplateCmd, CompiledComponentTemplate;
import 'template_ast.dart' show TemplateAst, TemplateAstVisitor, NgContentAst, EmbeddedTemplateAst, ElementAst, VariableAst, BoundEventAst, BoundElementPropertyAst, AttrAst, BoundTextAst, TextAst, DirectiveAst, BoundDirectivePropertyAst, templateVisitAll;
import 'directive_metadata.dart' show CompileTypeMetadata, CompileDirectiveMetadata;
import 'source_module.dart' show SourceExpressions, SourceExpression, moduleRef;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'util.dart' show escapeSingleQuoteString, codeGenConstConstructorCall, codeGenValueFn, MODULE_SUFFIX;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/linker/template_commands.ng_deps.dart' as i0;
import 'template_ast.ng_deps.dart' as i1;
import 'directive_metadata.ng_deps.dart' as i2;
import 'source_module.ng_deps.dart' as i3;
import 'package:angular2/src/core/metadata/view.ng_deps.dart' as i4;
import 'util.ng_deps.dart' as i5;
import 'package:angular2/src/core/di.ng_deps.dart' as i6;
export 'command_compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(CommandCompiler, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new CommandCompiler())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}
