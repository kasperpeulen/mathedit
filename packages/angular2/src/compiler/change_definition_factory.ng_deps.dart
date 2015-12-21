library angular2.src.compiler.change_definition_factory.ng_deps.dart;

import 'change_definition_factory.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show ListWrapper;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/core/change_detection/change_detection.dart' show DirectiveIndex, BindingRecord, DirectiveRecord, ChangeDetectionStrategy, ChangeDetectorDefinition, ChangeDetectorGenConfig, ASTWithSource;
import 'directive_metadata.dart' show CompileDirectiveMetadata, CompileTypeMetadata;
import 'template_ast.dart' show TemplateAst, ElementAst, BoundTextAst, PropertyBindingType, DirectiveAst, TemplateAstVisitor, templateVisitAll, NgContentAst, EmbeddedTemplateAst, VariableAst, BoundElementPropertyAst, BoundEventAst, BoundDirectivePropertyAst, AttrAst, TextAst;
import 'package:angular2/src/core/linker/interfaces.dart' show LifecycleHooks;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i0;
import 'package:angular2/src/core/change_detection/change_detection.ng_deps.dart' as i1;
import 'directive_metadata.ng_deps.dart' as i2;
import 'template_ast.ng_deps.dart' as i3;
import 'package:angular2/src/core/linker/interfaces.ng_deps.dart' as i4;
export 'change_definition_factory.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
