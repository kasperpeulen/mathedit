library angular2.transform.common.options.ng_deps.dart;

import 'options.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:glob/glob.dart';
import 'annotation_matcher.dart';
import 'mirror_mode.dart';
import 'annotation_matcher.ng_deps.dart' as i0;
export 'options.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
