library angular2.src.common.forms.directives.ng_control.ng_deps.dart;

import 'ng_control.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'control_value_accessor.dart' show ControlValueAccessor;
import 'abstract_control_directive.dart' show AbstractControlDirective;
import 'package:angular2/src/facade/exceptions.dart' show unimplemented;
import 'control_value_accessor.ng_deps.dart' as i0;
import 'abstract_control_directive.ng_deps.dart' as i1;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i2;
export 'ng_control.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
