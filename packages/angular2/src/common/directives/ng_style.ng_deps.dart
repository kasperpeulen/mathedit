library angular2.src.common.directives.ng_style.ng_deps.dart;

import 'ng_style.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show DoCheck, KeyValueDiffer, KeyValueDiffers, ElementRef, Directive, Renderer;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, print;
import 'package:angular2/core.ng_deps.dart' as i0;
export 'ng_style.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgStyle, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["rawStyle: ngStyle"], selector: "[ngStyle]")],
const [const [KeyValueDiffers], const [ElementRef], const [Renderer]],
(KeyValueDiffers _differs, ElementRef _ngEl, Renderer _renderer) => new NgStyle(_differs, _ngEl, _renderer),
const [DoCheck])
)
..registerSetters({'rawStyle': (o, v) => o.rawStyle = v})
;
i0.initReflector();
}
