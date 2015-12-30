import 'math_edit.component.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:mathedit/components/editor.component/editor.component.dart';
import 'package:mathedit/components/preview.component/preview.component.dart';
import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/mathjax_preview.dart';
import 'package:github/browser.dart';
import 'dart:html';
import 'package:mathedit/service/gist.service.dart';
import 'math_edit.component.template.dart' as _templates;
import 'package:angular2/router.ng_deps.dart' as i0;
import 'package:angular2/angular2.ng_deps.dart' as i1;
import 'package:mathedit/components/editor.component/editor.component.ng_deps.dart' as i2;
import 'package:mathedit/components/preview.component/preview.component.ng_deps.dart' as i3;
import 'package:mathedit/helpers/mathjax_preview.ng_deps.dart' as i4;
import 'package:mathedit/service/gist.service.ng_deps.dart' as i5;
export 'math_edit.component.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(MathEditComponent, new _ngRef.ReflectionInfo(
const [const Component(directives: const [EditorComponent, PreviewComponent], encapsulation: ViewEncapsulation.None, selector: 'math-edit', styleUrls: const ['math_edit.component.css'], templateUrl: 'math_edit.component.html'), _templates.HostMathEditComponentTemplate],
const [const [Authentication], const [Router], const [RouteParams], const [ElementRef], const [CommonMarkParser], const [HtmlWriter], const [MyGistsService]],
(Authentication auth, Router router, RouteParams params, ElementRef ref, CommonMarkParser cmParser, HtmlWriter htmlWriter, MyGistsService gistService) => new MathEditComponent(auth, router, params, ref, cmParser, htmlWriter, gistService),
const [OnInit])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
