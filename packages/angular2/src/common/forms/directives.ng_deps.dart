library angular2.src.common.forms.directives.ng_deps.dart;

import 'directives.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type;
import 'directives/ng_control_name.dart' show NgControlName;
import 'directives/ng_form_control.dart' show NgFormControl;
import 'directives/ng_model.dart' show NgModel;
import 'directives/ng_control_group.dart' show NgControlGroup;
import 'directives/ng_form_model.dart' show NgFormModel;
import 'directives/ng_form.dart' show NgForm;
import 'directives/default_value_accessor.dart' show DefaultValueAccessor;
import 'directives/checkbox_value_accessor.dart' show CheckboxControlValueAccessor;
import 'directives/number_value_accessor.dart' show NumberValueAccessor;
import 'directives/ng_control_status.dart' show NgControlStatus;
import 'directives/select_control_value_accessor.dart' show SelectControlValueAccessor, NgSelectOption;
import 'directives/validators.dart' show RequiredValidator, MinLengthValidator, MaxLengthValidator;
import 'directives/ng_control_name.ng_deps.dart' as i0;
import 'directives/ng_form_control.ng_deps.dart' as i1;
import 'directives/ng_model.ng_deps.dart' as i2;
import 'directives/ng_control_group.ng_deps.dart' as i3;
import 'directives/ng_form_model.ng_deps.dart' as i4;
import 'directives/ng_form.ng_deps.dart' as i5;
import 'directives/default_value_accessor.ng_deps.dart' as i6;
import 'directives/checkbox_value_accessor.ng_deps.dart' as i7;
import 'directives/number_value_accessor.ng_deps.dart' as i8;
import 'directives/ng_control_status.ng_deps.dart' as i9;
import 'directives/select_control_value_accessor.ng_deps.dart' as i10;
import 'directives/validators.ng_deps.dart' as i11;
import 'directives/ng_control.ng_deps.dart' as i12;
import 'directives/control_value_accessor.ng_deps.dart' as i13;
export 'directives.dart';
export 'directives/ng_control_name.dart' show NgControlName;
export 'directives/ng_form_control.dart' show NgFormControl;
export 'directives/ng_model.dart' show NgModel;
export 'directives/ng_control_group.dart' show NgControlGroup;
export 'directives/ng_form_model.dart' show NgFormModel;
export 'directives/ng_form.dart' show NgForm;
export 'directives/default_value_accessor.dart' show DefaultValueAccessor;
export 'directives/checkbox_value_accessor.dart' show CheckboxControlValueAccessor;
export 'directives/number_value_accessor.dart' show NumberValueAccessor;
export 'directives/ng_control_status.dart' show NgControlStatus;
export 'directives/select_control_value_accessor.dart' show SelectControlValueAccessor, NgSelectOption;
export 'directives/validators.dart' show RequiredValidator, MinLengthValidator, MaxLengthValidator;
export 'directives/ng_control.dart' show NgControl;
export 'directives/control_value_accessor.dart' show ControlValueAccessor;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerGetters({'update': (o) => o.update, 'ngSubmit': (o) => o.ngSubmit})
..registerSetters({'name': (o, v) => o.name = v, 'model': (o, v) => o.model = v, 'form': (o, v) => o.form = v})
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
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
i13.initReflector();
}
