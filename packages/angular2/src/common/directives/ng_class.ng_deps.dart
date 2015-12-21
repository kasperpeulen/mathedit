library angular2.src.common.directives.ng_class.ng_deps.dart;

import 'ng_class.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isString, StringWrapper, isBlank, isArray;
import 'package:angular2/core.dart' show DoCheck, OnDestroy, Directive, ElementRef, IterableDiffer, IterableDiffers, KeyValueDiffer, KeyValueDiffers, Renderer;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper, isListLikeIterable;
import 'package:angular2/core.ng_deps.dart' as i0;
export 'ng_class.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgClass, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["rawClass: ngClass", "initialClasses: class"], selector: "[ngClass]")],
const [const [IterableDiffers], const [KeyValueDiffers], const [ElementRef], const [Renderer]],
(IterableDiffers _iterableDiffers, KeyValueDiffers _keyValueDiffers, ElementRef _ngEl, Renderer _renderer) => new NgClass(_iterableDiffers, _keyValueDiffers, _ngEl, _renderer),
const [DoCheck, OnDestroy])
)
..registerSetters({'rawClass': (o, v) => o.rawClass = v, 'initialClasses': (o, v) => o.initialClasses = v})
;
i0.initReflector();
}
