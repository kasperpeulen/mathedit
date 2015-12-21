library angular2.transform.reflection_remover.rewriter.ng_deps.dart;

import 'rewriter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:analyzer/src/generated/ast.dart';
import 'package:path/path.dart' as path;
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/mirror_matcher.dart';
import 'package:angular2/src/transform/common/mirror_mode.dart';
import 'package:angular2/src/transform/common/names.dart';
import 'codegen.dart';
import 'entrypoint_matcher.dart';
import 'package:angular2/src/transform/common/logging.ng_deps.dart' as i0;
import 'package:angular2/src/transform/common/mirror_matcher.ng_deps.dart' as i1;
import 'codegen.ng_deps.dart' as i2;
import 'entrypoint_matcher.ng_deps.dart' as i3;
export 'rewriter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
