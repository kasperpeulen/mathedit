import 'editor_component.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'editor_component.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'editor_component.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(EditorComponent, new _ngRef.ReflectionInfo(
const [const Component(encapsulation: ViewEncapsulation.None, selector: 'editor', styleUrls: const ['editor_component.css'], templateUrl: 'editor_component.html'), _templates.HostEditorComponentTemplate],
const [],
() => new EditorComponent(),
const [],
const {
'value': const [const Output()]})
)
..registerGetters({'value': (o) => o.value})
;
i0.initReflector();
}
