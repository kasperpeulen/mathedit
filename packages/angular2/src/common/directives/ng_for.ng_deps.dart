library angular2.src.common.directives.ng_for.ng_deps.dart;

import 'ng_for.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show DoCheck, Directive, ChangeDetectorRef, IterableDiffer, IterableDiffers, ViewContainerRef, TemplateRef, ViewRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/core.ng_deps.dart' as i0;
export 'ng_for.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgFor, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["ngForOf", "ngForTemplate"], selector: "[ngFor][ngForOf]")],
const [const [ViewContainerRef], const [TemplateRef], const [IterableDiffers], const [ChangeDetectorRef]],
(ViewContainerRef _viewContainer, TemplateRef _templateRef, IterableDiffers _iterableDiffers, ChangeDetectorRef _cdr) => new NgFor(_viewContainer, _templateRef, _iterableDiffers, _cdr),
const [DoCheck])
)
..registerSetters({'ngForOf': (o, v) => o.ngForOf = v, 'ngForTemplate': (o, v) => o.ngForTemplate = v})
;
i0.initReflector();
}
