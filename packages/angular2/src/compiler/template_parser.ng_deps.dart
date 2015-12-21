library angular2.src.compiler.template_parser.ng_deps.dart;

import 'template_parser.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, StringMapWrapper, SetWrapper;
import 'package:angular2/src/facade/lang.dart' show RegExpWrapper, isPresent, StringWrapper, isBlank;
import 'package:angular2/core.dart' show Injectable, Inject, OpaqueToken, Optional;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/core/change_detection/change_detection.dart' show Parser, AST, ASTWithSource;
import 'package:angular2/src/core/change_detection/parser/ast.dart' show TemplateBinding;
import 'directive_metadata.dart' show CompileDirectiveMetadata;
import 'html_parser.dart' show HtmlParser;
import 'html_tags.dart' show splitNsName;
import 'parse_util.dart' show ParseSourceSpan, ParseError, ParseLocation;
import 'template_ast.dart' show ElementAst, BoundElementPropertyAst, BoundEventAst, VariableAst, TemplateAst, TemplateAstVisitor, templateVisitAll, TextAst, BoundTextAst, EmbeddedTemplateAst, AttrAst, NgContentAst, PropertyBindingType, DirectiveAst, BoundDirectivePropertyAst;
import 'package:angular2/src/compiler/selector.dart' show CssSelector, SelectorMatcher;
import 'package:angular2/src/compiler/schema/element_schema_registry.dart' show ElementSchemaRegistry;
import 'template_preparser.dart' show preparseElement, PreparsedElement, PreparsedElementType;
import 'style_url_resolver.dart' show isStyleUrlResolvable;
import 'html_ast.dart' show HtmlAstVisitor, HtmlAst, HtmlElementAst, HtmlAttrAst, HtmlTextAst, htmlVisitAll;
import 'util.dart' show splitAtColon;
import 'package:angular2/core.ng_deps.dart' as i0;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/change_detection/change_detection.ng_deps.dart' as i2;
import 'package:angular2/src/core/change_detection/parser/ast.ng_deps.dart' as i3;
import 'directive_metadata.ng_deps.dart' as i4;
import 'html_parser.ng_deps.dart' as i5;
import 'html_tags.ng_deps.dart' as i6;
import 'template_ast.ng_deps.dart' as i7;
import 'package:angular2/src/compiler/selector.ng_deps.dart' as i8;
import 'template_preparser.ng_deps.dart' as i9;
import 'style_url_resolver.ng_deps.dart' as i10;
import 'html_ast.ng_deps.dart' as i11;
import 'util.ng_deps.dart' as i12;
export 'template_parser.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TemplateParser, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Parser], const [ElementSchemaRegistry], const [HtmlParser], const [List, const Optional(), const Inject(TEMPLATE_TRANSFORMS)]],
(Parser _exprParser, ElementSchemaRegistry _schemaRegistry, HtmlParser _htmlParser, List<TemplateAstVisitor> transforms) => new TemplateParser(_exprParser, _schemaRegistry, _htmlParser, transforms))
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
}
