library angular2.src.compiler.template_compiler.ng_deps.dart;

import 'template_compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show IS_DART, Type, Json, isBlank, stringify;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, SetWrapper, MapWrapper;
import 'package:angular2/src/facade/async.dart' show PromiseWrapper, Future;
import 'package:angular2/src/core/linker/template_commands.dart' show CompiledComponentTemplate, TemplateCmd, CompiledHostTemplate, BeginComponentCmd;
import 'directive_metadata.dart' show createHostComponentMeta, CompileDirectiveMetadata, CompileTypeMetadata, CompileTemplateMetadata;
import 'template_ast.dart' show TemplateAst;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'source_module.dart' show SourceModule, moduleRef;
import 'change_detector_compiler.dart' show ChangeDetectionCompiler;
import 'style_compiler.dart' show StyleCompiler;
import 'command_compiler.dart' show CommandCompiler;
import 'template_parser.dart' show TemplateParser;
import 'template_normalizer.dart' show TemplateNormalizer;
import 'runtime_metadata.dart' show RuntimeMetadataResolver;
import 'command_compiler.dart' show TEMPLATE_COMMANDS_MODULE_REF;
import 'util.dart' show codeGenExportVariable, escapeSingleQuoteString, codeGenValueFn, MODULE_SUFFIX;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'package:angular2/src/facade/async.ng_deps.dart' as i1;
import 'package:angular2/src/core/linker/template_commands.ng_deps.dart' as i2;
import 'directive_metadata.ng_deps.dart' as i3;
import 'template_ast.ng_deps.dart' as i4;
import 'package:angular2/src/core/di.ng_deps.dart' as i5;
import 'source_module.ng_deps.dart' as i6;
import 'change_detector_compiler.ng_deps.dart' as i7;
import 'style_compiler.ng_deps.dart' as i8;
import 'command_compiler.ng_deps.dart' as i9;
import 'template_parser.ng_deps.dart' as i10;
import 'template_normalizer.ng_deps.dart' as i11;
import 'runtime_metadata.ng_deps.dart' as i12;
import 'util.ng_deps.dart' as i13;
export 'template_compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TemplateCompiler, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [RuntimeMetadataResolver], const [TemplateNormalizer], const [TemplateParser], const [StyleCompiler], const [CommandCompiler], const [ChangeDetectionCompiler]],
(RuntimeMetadataResolver _runtimeMetadataResolver, TemplateNormalizer _templateNormalizer, TemplateParser _templateParser, StyleCompiler _styleCompiler, CommandCompiler _commandCompiler, ChangeDetectionCompiler _cdCompiler) => new TemplateCompiler(_runtimeMetadataResolver, _templateNormalizer, _templateParser, _styleCompiler, _commandCompiler, _cdCompiler))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
i13.initReflector();
}
