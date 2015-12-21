library angular2.transform.common.options_reader.ng_deps.dart;

import 'options_reader.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:barback/barback.dart';
import 'annotation_matcher.dart';
import 'mirror_mode.dart';
import 'options.dart';
import 'annotation_matcher.ng_deps.dart' as i0;
import 'options.ng_deps.dart' as i1;
export 'options_reader.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
