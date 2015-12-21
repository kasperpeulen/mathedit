library angular2.src.compiler.style_compiler.ng_deps.dart;

import 'style_compiler.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'directive_metadata.dart' show CompileTypeMetadata, CompileTemplateMetadata;
import 'source_module.dart' show SourceModule, SourceExpression, moduleRef;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'package:angular2/src/compiler/xhr.dart' show XHR;
import 'package:angular2/src/facade/lang.dart' show IS_DART, StringWrapper, isBlank;
import 'package:angular2/src/facade/async.dart' show PromiseWrapper, Future;
import 'package:angular2/src/compiler/shadow_css.dart' show ShadowCss;
import 'package:angular2/src/compiler/url_resolver.dart' show UrlResolver;
import 'style_url_resolver.dart' show extractStyleUrls;
import 'util.dart' show escapeSingleQuoteString, codeGenExportVariable, codeGenToString, MODULE_SUFFIX;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/core/render/view_factory.dart' show COMPONENT_VARIABLE, HOST_ATTR, CONTENT_ATTR;
import 'directive_metadata.ng_deps.dart' as i0;
import 'source_module.ng_deps.dart' as i1;
import 'package:angular2/src/core/metadata/view.ng_deps.dart' as i2;
import 'package:angular2/src/compiler/xhr.ng_deps.dart' as i3;
import 'package:angular2/src/facade/async.ng_deps.dart' as i4;
import 'package:angular2/src/compiler/shadow_css.ng_deps.dart' as i5;
import 'package:angular2/src/compiler/url_resolver.ng_deps.dart' as i6;
import 'style_url_resolver.ng_deps.dart' as i7;
import 'util.ng_deps.dart' as i8;
import 'package:angular2/src/core/di.ng_deps.dart' as i9;
import 'package:angular2/src/core/render/view_factory.ng_deps.dart' as i10;
export 'style_compiler.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(StyleCompiler, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [XHR], const [UrlResolver]],
(XHR _xhr, UrlResolver _urlResolver) => new StyleCompiler(_xhr, _urlResolver))
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
