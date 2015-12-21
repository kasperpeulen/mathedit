library angular2.transform.common.annotation_matcher.ng_deps.dart;

import 'annotation_matcher.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/src/generated/ast.dart';
import 'package:barback/barback.dart' show AssetId;
import 'class_matcher_base.dart';
import 'class_matcher_base.ng_deps.dart' as i0;
export 'annotation_matcher.dart';
export 'class_matcher_base.dart' show ClassDescriptor;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
