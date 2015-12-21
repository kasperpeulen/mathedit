library angular2.common.ng_deps.dart;

import 'common.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'src/common/pipes.ng_deps.dart' as i0;
import 'src/common/directives.ng_deps.dart' as i1;
import 'src/common/forms.ng_deps.dart' as i2;
import 'src/common/common_directives.ng_deps.dart' as i3;
export 'common.dart';
export 'src/common/pipes.dart';
export 'src/common/directives.dart';
export 'src/common/forms.dart';
export 'src/common/common_directives.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerGetters({'update': (o) => o.update, 'ngSubmit': (o) => o.ngSubmit})
..registerSetters({'rawClass': (o, v) => o.rawClass = v, 'initialClasses': (o, v) => o.initialClasses = v, 'ngForOf': (o, v) => o.ngForOf = v, 'ngForTemplate': (o, v) => o.ngForTemplate = v, 'ngIf': (o, v) => o.ngIf = v, 'rawStyle': (o, v) => o.rawStyle = v, 'ngSwitch': (o, v) => o.ngSwitch = v, 'ngSwitchWhen': (o, v) => o.ngSwitchWhen = v, 'name': (o, v) => o.name = v, 'model': (o, v) => o.model = v, 'form': (o, v) => o.form = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
