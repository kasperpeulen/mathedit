library angular2.src.common.directives.ng_deps.dart;

import 'directives.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'directives/ng_class.ng_deps.dart' as i0;
import 'directives/ng_for.ng_deps.dart' as i1;
import 'directives/ng_if.ng_deps.dart' as i2;
import 'directives/ng_style.ng_deps.dart' as i3;
import 'directives/ng_switch.ng_deps.dart' as i4;
import 'directives/observable_list_diff.ng_deps.dart' as i5;
import 'directives/core_directives.ng_deps.dart' as i6;
export 'directives.dart';
export 'directives/ng_class.dart' show NgClass;
export 'directives/ng_for.dart' show NgFor;
export 'directives/ng_if.dart' show NgIf;
export 'directives/ng_style.dart' show NgStyle;
export 'directives/ng_switch.dart' show NgSwitch, NgSwitchWhen, NgSwitchDefault;
export 'directives/observable_list_diff.dart';
export 'directives/core_directives.dart' show CORE_DIRECTIVES;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerSetters({'rawClass': (o, v) => o.rawClass = v, 'initialClasses': (o, v) => o.initialClasses = v, 'ngForOf': (o, v) => o.ngForOf = v, 'ngForTemplate': (o, v) => o.ngForTemplate = v, 'ngIf': (o, v) => o.ngIf = v, 'rawStyle': (o, v) => o.rawStyle = v, 'ngSwitch': (o, v) => o.ngSwitch = v, 'ngSwitchWhen': (o, v) => o.ngSwitchWhen = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}
