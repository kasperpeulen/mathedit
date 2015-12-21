library angular2.transform.common.code.import_export_code.ng_deps.dart;

import 'import_export_code.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/analyzer.dart';
import 'package:angular2/src/transform/common/mirror_matcher.dart';
import 'package:angular2/src/transform/common/names.dart';
import 'package:angular2/src/transform/common/model/import_export_model.pb.dart';
import 'package:angular2/src/transform/common/mirror_matcher.ng_deps.dart' as i0;
import 'package:angular2/src/transform/common/model/import_export_model.pb.ng_deps.dart' as i1;
export 'import_export_code.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
