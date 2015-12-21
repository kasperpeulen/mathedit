library angular2.transform.common.class_matcher_base.ng_deps.dart;

import 'class_matcher_base.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/src/generated/ast.dart';
import 'package:barback/barback.dart' show AssetId;
import 'package:code_transformers/assets.dart';
import 'package:path/path.dart' as path;
import 'logging.dart' show log;
import 'logging.ng_deps.dart' as i0;
export 'class_matcher_base.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
