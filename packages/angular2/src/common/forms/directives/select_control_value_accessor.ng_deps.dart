library angular2.src.common.forms.directives.select_control_value_accessor.ng_deps.dart;

import 'select_control_value_accessor.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Query, Directive, Renderer, Self, Provider, ElementRef, QueryList;
import 'package:angular2/src/facade/async.dart' show ObservableWrapper;
import 'control_value_accessor.dart' show NG_VALUE_ACCESSOR, ControlValueAccessor;
import 'package:angular2/core.ng_deps.dart' as i0;
import 'package:angular2/src/facade/async.ng_deps.dart' as i1;
import 'control_value_accessor.ng_deps.dart' as i2;
export 'select_control_value_accessor.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgSelectOption, new _ngRef.ReflectionInfo(
const [const Directive(selector: "option")],
const [],
() => new NgSelectOption())
)
..registerType(SelectControlValueAccessor, new _ngRef.ReflectionInfo(
const [const Directive(bindings: const [SELECT_VALUE_ACCESSOR], host: const {"(change)" : "onChange(\$event.target.value)", "(input)" : "onChange(\$event.target.value)", "(blur)" : "onTouched()"}, selector: "select[ngControl],select[ngFormControl],select[ngModel]")],
const [const [Renderer], const [ElementRef], const [QueryList, const Query(NgSelectOption, descendants: true)]],
(Renderer _renderer, ElementRef _elementRef, QueryList<NgSelectOption> query) => new SelectControlValueAccessor(_renderer, _elementRef, query),
const [ControlValueAccessor])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
