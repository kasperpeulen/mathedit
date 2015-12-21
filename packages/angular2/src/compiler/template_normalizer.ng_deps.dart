library angular2.src.compiler.template_normalizer.ng_deps.dart;

import 'template_normalizer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'directive_metadata.dart' show CompileTypeMetadata, CompileDirectiveMetadata, CompileTemplateMetadata;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/async.dart' show Future, PromiseWrapper;
import 'package:angular2/src/compiler/xhr.dart' show XHR;
import 'package:angular2/src/compiler/url_resolver.dart' show UrlResolver;
import 'style_url_resolver.dart' show extractStyleUrls, isStyleUrlResolvable;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'html_ast.dart' show HtmlAstVisitor, HtmlElementAst, HtmlTextAst, HtmlAttrAst, HtmlAst, htmlVisitAll;
import 'html_parser.dart' show HtmlParser;
import 'template_preparser.dart' show preparseElement, PreparsedElement, PreparsedElementType;
import 'directive_metadata.ng_deps.dart' as i0;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/facade/async.ng_deps.dart' as i2;
import 'package:angular2/src/compiler/xhr.ng_deps.dart' as i3;
import 'package:angular2/src/compiler/url_resolver.ng_deps.dart' as i4;
import 'style_url_resolver.ng_deps.dart' as i5;
import 'package:angular2/src/core/di.ng_deps.dart' as i6;
import 'package:angular2/src/core/metadata/view.ng_deps.dart' as i7;
import 'html_ast.ng_deps.dart' as i8;
import 'html_parser.ng_deps.dart' as i9;
import 'template_preparser.ng_deps.dart' as i10;
export 'template_normalizer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TemplateNormalizer, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [XHR], const [UrlResolver], const [HtmlParser]],
(XHR _xhr, UrlResolver _urlResolver, HtmlParser _htmlParser) => new TemplateNormalizer(_xhr, _urlResolver, _htmlParser))
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
}
