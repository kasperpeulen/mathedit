import 'focus_on_init.directive.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'dart:async';
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'focus_on_init.directive.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(FocusOnInitDirective, new _ngRef.ReflectionInfo(
const [const Directive(selector: '[focusOnInit]')],
const [const [ElementRef]],
(ElementRef ref) => new FocusOnInitDirective(ref),
const [AfterViewInit])
)
;
i0.initReflector();
}
