import 'button-radio.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'button-radio.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ButtonRadio, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"(click)" : "onClick()", "[class.active]" : "isActive"}, inputs: const ["option", "uncheckable"], selector: "n2s-btn-radio")],
const [const [NgModel], const [Renderer], const [ElementRef]],
(NgModel ngModel, Renderer renderer, ElementRef elementRef) => new ButtonRadio(ngModel, renderer, elementRef))
)
..registerSetters({'option': (o, v) => o.option = v, 'uncheckable': (o, v) => o.uncheckable = v})
;
i0.initReflector();
}
