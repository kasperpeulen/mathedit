library angular2.src.compiler.directive_metadata.ng_deps.dart;

import 'directive_metadata.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, normalizeBool, serializeEnum, Type, RegExpWrapper, StringWrapper;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper;
import 'package:angular2/src/core/change_detection/change_detection.dart' show ChangeDetectionStrategy, CHANGE_DETECTION_STRATEGY_VALUES;
import 'package:angular2/src/core/metadata/view.dart' show ViewEncapsulation, VIEW_ENCAPSULATION_VALUES;
import 'package:angular2/src/compiler/selector.dart' show CssSelector;
import 'util.dart' show splitAtColon;
import 'package:angular2/src/core/linker/interfaces.dart' show LifecycleHooks, LIFECYCLE_HOOKS_VALUES;
import 'package:angular2/src/core/change_detection/change_detection.ng_deps.dart' as i0;
import 'package:angular2/src/core/metadata/view.ng_deps.dart' as i1;
import 'package:angular2/src/compiler/selector.ng_deps.dart' as i2;
import 'util.ng_deps.dart' as i3;
import 'package:angular2/src/core/linker/interfaces.ng_deps.dart' as i4;
export 'directive_metadata.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
