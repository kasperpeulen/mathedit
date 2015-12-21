library angular2.transform.common.code.parameter_code.ng_deps.dart;

import 'parameter_code.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/analyzer.dart';
import 'package:analyzer/src/generated/ast.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/model/parameter_model.pb.dart';
import 'constify.dart';
import 'package:angular2/src/transform/common/logging.ng_deps.dart' as i0;
import 'package:angular2/src/transform/common/model/parameter_model.pb.ng_deps.dart' as i1;
import 'constify.ng_deps.dart' as i2;
export 'parameter_code.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
