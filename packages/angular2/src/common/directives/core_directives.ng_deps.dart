library angular2.src.common.directives.core_directives.ng_deps.dart;

import 'core_directives.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type;
import 'ng_class.dart' show NgClass;
import 'ng_for.dart' show NgFor;
import 'ng_if.dart' show NgIf;
import 'ng_style.dart' show NgStyle;
import 'ng_switch.dart' show NgSwitch, NgSwitchWhen, NgSwitchDefault;
import 'ng_class.ng_deps.dart' as i0;
import 'ng_for.ng_deps.dart' as i1;
import 'ng_if.ng_deps.dart' as i2;
import 'ng_style.ng_deps.dart' as i3;
import 'ng_switch.ng_deps.dart' as i4;
export 'core_directives.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
