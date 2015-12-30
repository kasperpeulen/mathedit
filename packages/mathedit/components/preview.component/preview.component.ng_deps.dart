import 'preview.component.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'preview.component.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'preview.component.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(PreviewComponent, new _ngRef.ReflectionInfo(
const [const Component(encapsulation: ViewEncapsulation.None, selector: 'preview ', styleUrls: const ['preview.component.css'], templateUrl: 'preview.component.html'), _templates.HostPreviewComponentTemplate],
const [],
() => new PreviewComponent(),
const [],
const {
'value': const [const Input()]})
)
..registerSetters({'value': (o, v) => o.value = v})
;
i0.initReflector();
}
