import 'common.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'common.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(NgTransclude, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["ngTransclude"], selector: "[ng-transclude]")],
const [const [ViewContainerRef, const Inject(ViewContainerRef)]],
(ViewContainerRef viewRef) => new NgTransclude(viewRef))
)
..registerSetters({'ngTransclude': (o, v) => o.ngTransclude = v})
;
i0.initReflector();
}
