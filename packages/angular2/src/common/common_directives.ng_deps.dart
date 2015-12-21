library angular2.src.common.common_directives.ng_deps.dart;

import 'common_directives.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type;
import 'forms.dart' show FORM_DIRECTIVES;
import 'directives.dart' show CORE_DIRECTIVES;
import 'forms.ng_deps.dart' as i0;
import 'directives.ng_deps.dart' as i1;
export 'common_directives.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
