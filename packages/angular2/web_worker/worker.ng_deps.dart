library angular2.web_worker.worker.ng_deps.dart;

import 'worker.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import '../common.ng_deps.dart' as i0;
import '../core.ng_deps.dart' as i1;
import '../platform/worker_app.ng_deps.dart' as i2;
import '../compiler.ng_deps.dart' as i3;
import '../instrumentation.ng_deps.dart' as i4;
import 'package:angular2/src/platform/worker_app.ng_deps.dart' as i5;
export 'worker.dart';
export '../common.dart';
export '../core.dart';
export '../platform/worker_app.dart';
export '../compiler.dart' show UrlResolver;
export '../instrumentation.dart';
export 'package:angular2/src/platform/worker_app.dart';
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
i4.initReflector();
i5.initReflector();
}
