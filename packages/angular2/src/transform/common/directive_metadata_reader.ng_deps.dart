library angular2.transform.common.directive_metadata_reader.ng_deps.dart;

import 'directive_metadata_reader.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:analyzer/analyzer.dart';
import 'package:angular2/src/compiler/directive_metadata.dart';
import 'package:angular2/src/compiler/template_compiler.dart';
import 'package:angular2/src/core/change_detection/change_detection.dart';
import 'package:angular2/src/core/linker/interfaces.dart' show LifecycleHooks;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation;
import 'package:angular2/src/transform/common/annotation_matcher.dart';
import 'package:angular2/src/transform/common/interface_matcher.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:barback/barback.dart' show AssetId;
import 'naive_eval.dart';
import 'package:angular2/src/compiler/directive_metadata.ng_deps.dart' as i0;
import 'package:angular2/src/compiler/template_compiler.ng_deps.dart' as i1;
import 'package:angular2/src/core/change_detection/change_detection.ng_deps.dart' as i2;
import 'package:angular2/src/core/linker/interfaces.ng_deps.dart' as i3;
import 'package:angular2/src/core/metadata/view.ng_deps.dart' as i4;
import 'package:angular2/src/transform/common/annotation_matcher.ng_deps.dart' as i5;
import 'package:angular2/src/transform/common/interface_matcher.ng_deps.dart' as i6;
import 'package:angular2/src/transform/common/logging.ng_deps.dart' as i7;
import 'naive_eval.ng_deps.dart' as i8;
export 'directive_metadata_reader.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
}
