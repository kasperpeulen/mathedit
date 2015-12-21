library angular2.transform.common.ng_meta.ng_deps.dart;

import 'ng_meta.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/compiler/directive_metadata.dart';
import 'logging.dart';
import 'model/ng_deps_model.pb.dart';
import 'url_resolver.dart' show isDartCoreUri;
import 'package:angular2/src/compiler/directive_metadata.ng_deps.dart' as i0;
import 'logging.ng_deps.dart' as i1;
import 'model/ng_deps_model.pb.ng_deps.dart' as i2;
import 'url_resolver.ng_deps.dart' as i3;
export 'ng_meta.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
