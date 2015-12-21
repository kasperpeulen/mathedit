library angular2.src.compiler.change_detector_compiler.ng_deps.dart;

import 'change_detector_compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'directive_metadata.dart' show CompileTypeMetadata;
import 'source_module.dart' show SourceExpressions, moduleRef;
import 'package:angular2/src/core/change_detection/change_detection_jit_generator.dart' show ChangeDetectorJITGenerator;
import 'change_definition_factory.dart' show createChangeDetectorDefinitions;
import 'package:angular2/src/facade/lang.dart' show IS_DART, isJsObject;
import 'package:angular2/src/core/change_detection/change_detection.dart' show ChangeDetectorGenConfig, ChangeDetectorDefinition, DynamicProtoChangeDetector, ChangeDetectionStrategy;
import 'template_ast.dart' show TemplateAst;
import 'package:angular2/src/transform/template_compiler/change_detector_codegen.dart' show Codegen;
import 'util.dart' show MODULE_SUFFIX;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'directive_metadata.ng_deps.dart' as i0;
import 'source_module.ng_deps.dart' as i1;
import 'change_definition_factory.ng_deps.dart' as i2;
import 'package:angular2/src/core/change_detection/change_detection.ng_deps.dart' as i3;
import 'template_ast.ng_deps.dart' as i4;
import 'package:angular2/src/transform/template_compiler/change_detector_codegen.ng_deps.dart' as i5;
import 'util.ng_deps.dart' as i6;
import 'package:angular2/src/core/di.ng_deps.dart' as i7;
export 'change_detector_compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ChangeDetectionCompiler, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [ChangeDetectorGenConfig]],
(ChangeDetectorGenConfig _genConfig) => new ChangeDetectionCompiler(_genConfig))
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
}
