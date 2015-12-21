library angular2.src.common.forms.directives.ng_form_model.ng_deps.dart;

import 'ng_form_model.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, StringMapWrapper;
import 'package:angular2/src/facade/async.dart' show ObservableWrapper, EventEmitter;
import 'package:angular2/core.dart' show SimpleChange, OnChanges, Directive, Provider, Inject, Optional, Self;
import 'ng_control.dart' show NgControl;
import 'ng_control_group.dart' show NgControlGroup;
import 'control_container.dart' show ControlContainer;
import 'form_interface.dart' show Form;
import '../model.dart' show Control, ControlGroup;
import 'shared.dart' show setUpControl, setUpControlGroup, composeValidators, composeAsyncValidators;
import '../validators.dart' show Validators, NG_VALIDATORS, NG_ASYNC_VALIDATORS;
import 'package:angular2/src/facade/async.ng_deps.dart' as i0;
import 'package:angular2/core.ng_deps.dart' as i1;
import 'ng_control.ng_deps.dart' as i2;
import 'ng_control_group.ng_deps.dart' as i3;
import 'control_container.ng_deps.dart' as i4;
import 'form_interface.ng_deps.dart' as i5;
import '../model.ng_deps.dart' as i6;
import 'shared.ng_deps.dart' as i7;
import '../validators.ng_deps.dart' as i8;
export 'ng_form_model.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgFormModel, new _ngRef.ReflectionInfo(
const [const Directive(bindings: const [formDirectiveProvider], exportAs: "ngForm", host: const {"(submit)" : "onSubmit()"}, inputs: const ["form: ngFormModel"], outputs: const ["ngSubmit"], selector: "[ngFormModel]")],
const [const [List, const Optional(), const Self(), const Inject(NG_VALIDATORS)], const [List, const Optional(), const Self(), const Inject(NG_ASYNC_VALIDATORS)]],
(List<dynamic> _validators, List<dynamic> _asyncValidators) => new NgFormModel(_validators, _asyncValidators),
const [Form, OnChanges])
)
..registerGetters({'ngSubmit': (o) => o.ngSubmit})
..registerSetters({'form': (o, v) => o.form = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
}
