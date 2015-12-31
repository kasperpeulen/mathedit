import 'editor.component.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:mathedit/directives/autogrow_directive.dart';
import 'dart:html';
import 'package:mathedit/directives/focus_on_init.directive.dart';
import 'package:mathedit/service/editor.service.dart';
import 'package:event_bus/event_bus.dart';
import 'editor.component.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'package:mathedit/directives/autogrow_directive.ng_deps.dart' as i1;
import 'package:mathedit/directives/focus_on_init.directive.ng_deps.dart' as i2;
import 'package:mathedit/service/editor.service.ng_deps.dart' as i3;
export 'editor.component.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(EditorComponent, new _ngRef.ReflectionInfo(
const [const Component(directives: const [AutogrowDirective, FocusOnInitDirective], encapsulation: ViewEncapsulation.None, selector: 'editor', styleUrls: const ['editor.component.css'], templateUrl: 'editor.component.html'), _templates.HostEditorComponentTemplate],
const [const [ElementRef], const [EditorService], const [EventBus]],
(ElementRef ref, EditorService _editor, EventBus _eventBus) => new EditorComponent(ref, _editor, _eventBus),
const [],
const {
'textareaValue': const [const Input()]})
)
..registerSetters({'textareaValue': (o, v) => o.textareaValue = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
