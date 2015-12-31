import 'button-checkbox.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'button-checkbox.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ButtonCheckbox, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"(click)" : "onClick()", "[class.active]" : "state"}, inputs: const ["trueValue", "falseValue"], selector: "n2s-btn-checkbox")],
const [const [NgModel], const [Renderer], const [ElementRef]],
(NgModel ngModel, Renderer renderer, ElementRef elementRef) => new ButtonCheckbox(ngModel, renderer, elementRef),
const [OnInit])
)
..registerSetters({'trueValue': (o, v) => o.trueValue = v, 'falseValue': (o, v) => o.falseValue = v})
;
i0.initReflector();
}
