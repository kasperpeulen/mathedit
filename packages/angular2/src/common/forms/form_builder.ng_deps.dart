library angular2.src.common.forms.form_builder.ng_deps.dart;

import 'form_builder.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show Injectable;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper;
import 'package:angular2/src/facade/lang.dart' show isPresent, isArray, Type;
import 'model.dart' as modelModule;
import 'package:angular2/core.ng_deps.dart' as i0;
import 'model.ng_deps.dart' as i1;
export 'form_builder.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(FormBuilder, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new FormBuilder())
)
;
i0.initReflector();
i1.initReflector();
}
