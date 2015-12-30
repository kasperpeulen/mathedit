import 'editor.component.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:mathedit/directives/autogrow_directive.dart';
import 'dart:html';
import 'package:mathedit/helpers/local_storage.dart';
import 'editor.component.template.dart' as _templates;
import 'package:angular2/router.ng_deps.dart' as i0;
import 'package:angular2/angular2.ng_deps.dart' as i1;
import 'package:mathedit/directives/autogrow_directive.ng_deps.dart' as i2;
export 'editor.component.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(EditorComponent, new _ngRef.ReflectionInfo(
const [const Component(directives: const [AutogrowDirective], encapsulation: ViewEncapsulation.None, selector: 'editor', styleUrls: const ['editor.component.css'], templateUrl: 'editor.component.html'), _templates.HostEditorComponentTemplate],
const [const [RouteParams], const [ElementRef]],
(RouteParams params, ElementRef ref) => new EditorComponent(params, ref),
const [OnInit],
const {
'value': const [const Output()], 
'textareaValue': const [const Input()]})
)
..registerGetters({'value': (o) => o.value})
..registerSetters({'textareaValue': (o, v) => o.textareaValue = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
