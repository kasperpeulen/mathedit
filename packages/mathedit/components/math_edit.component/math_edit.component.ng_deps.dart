import 'math_edit.component.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:mathedit/components/editor.component/editor.component.dart';
import 'package:mathedit/components/preview.component/preview.component.dart';
import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/mathjax_preview.dart';
import 'dart:html';
import 'package:mathedit/service/gist.service.dart';
import 'package:mathedit/service/editor.service.dart';
import 'package:event_bus/event_bus.dart';
import 'package:mathedit/service/user.service.dart';
import 'package:usage/usage.dart';
import 'math_edit.component.template.dart' as _templates;
import 'package:angular2/router.ng_deps.dart' as i0;
import 'package:angular2/angular2.ng_deps.dart' as i1;
import 'package:mathedit/components/editor.component/editor.component.ng_deps.dart' as i2;
import 'package:mathedit/components/preview.component/preview.component.ng_deps.dart' as i3;
import 'package:mathedit/helpers/mathjax_preview.ng_deps.dart' as i4;
import 'package:mathedit/service/gist.service.ng_deps.dart' as i5;
import 'package:mathedit/service/editor.service.ng_deps.dart' as i6;
import 'package:mathedit/service/user.service.ng_deps.dart' as i7;
export 'math_edit.component.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(MathEditComponent, new _ngRef.ReflectionInfo(
const [const Component(directives: const [EditorComponent, PreviewComponent], encapsulation: ViewEncapsulation.None, selector: 'math-edit', styleUrls: const ['math_edit.component.css'], templateUrl: 'math_edit.component.html'), _templates.HostMathEditComponentTemplate],
const [const [RouteParams], const [ElementRef], const [CommonMarkParser], const [HtmlWriter], const [MyGistsService], const [EditorService], const [EventBus], const [UserService], const [Analytics]],
(RouteParams _params, ElementRef ref, CommonMarkParser _cmParser, HtmlWriter _htmlWriter, MyGistsService _gistService, EditorService _editor, EventBus _eventBus, UserService _userService, Analytics _analytics) => new MathEditComponent(_params, ref, _cmParser, _htmlWriter, _gistService, _editor, _eventBus, _userService, _analytics),
const [OnInit])
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
