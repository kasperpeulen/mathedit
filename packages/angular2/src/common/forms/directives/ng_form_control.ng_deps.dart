library angular2.src.common.forms.directives.ng_form_control.ng_deps.dart;

import 'ng_form_control.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper;
import 'package:angular2/src/facade/async.dart' show EventEmitter, ObservableWrapper;
import 'package:angular2/core.dart' show OnChanges, SimpleChange, Query, Directive, Provider, Inject, Optional, Self;
import 'ng_control.dart' show NgControl;
import '../model.dart' show Control;
import '../validators.dart' show Validators, NG_VALIDATORS, NG_ASYNC_VALIDATORS;
import 'control_value_accessor.dart' show ControlValueAccessor, NG_VALUE_ACCESSOR;
import 'shared.dart' show setUpControl, composeValidators, composeAsyncValidators, isPropertyUpdated, selectValueAccessor;
import 'package:angular2/src/facade/async.ng_deps.dart' as i0;
import 'package:angular2/core.ng_deps.dart' as i1;
import 'ng_control.ng_deps.dart' as i2;
import '../model.ng_deps.dart' as i3;
import '../validators.ng_deps.dart' as i4;
import 'control_value_accessor.ng_deps.dart' as i5;
import 'shared.ng_deps.dart' as i6;
export 'ng_form_control.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgFormControl, new _ngRef.ReflectionInfo(
const [const Directive(bindings: const [formControlBinding], exportAs: "ngForm", inputs: const ["form: ngFormControl", "model: ngModel"], outputs: const ["update: ngModelChange"], selector: "[ngFormControl]")],
const [const [List, const Optional(), const Self(), const Inject(NG_VALIDATORS)], const [List, const Optional(), const Self(), const Inject(NG_ASYNC_VALIDATORS)], const [List, const Optional(), const Self(), const Inject(NG_VALUE_ACCESSOR)]],
(List<dynamic> _validators, List<dynamic> _asyncValidators, List<ControlValueAccessor> valueAccessors) => new NgFormControl(_validators, _asyncValidators, valueAccessors),
const [OnChanges])
)
..registerGetters({'update': (o) => o.update})
..registerSetters({'form': (o, v) => o.form = v, 'model': (o, v) => o.model = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}
