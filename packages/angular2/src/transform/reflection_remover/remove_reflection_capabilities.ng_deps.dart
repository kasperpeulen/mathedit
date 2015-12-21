library angular2.transform.reflection_remover.remove_reflection_capabilities.ng_deps.dart;

import 'remove_reflection_capabilities.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:analyzer/analyzer.dart';
import 'package:barback/barback.dart';
import 'package:angular2/src/transform/common/annotation_matcher.dart';
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/mirror_mode.dart';
import 'codegen.dart';
import 'entrypoint_matcher.dart';
import 'rewriter.dart';
import 'package:angular2/src/transform/common/annotation_matcher.ng_deps.dart' as i0;
import 'package:angular2/src/transform/common/asset_reader.ng_deps.dart' as i1;
import 'codegen.ng_deps.dart' as i2;
import 'entrypoint_matcher.ng_deps.dart' as i3;
import 'rewriter.ng_deps.dart' as i4;
export 'remove_reflection_capabilities.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
