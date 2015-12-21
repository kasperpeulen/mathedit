library angular2.src.core.linker.view_ref.ng_deps.dart;

import 'view_ref.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent;
import 'package:angular2/src/facade/exceptions.dart' show unimplemented;
import 'view.dart' as viewModule;
import '../change_detection/change_detector_ref.dart' show ChangeDetectorRef;
import 'package:angular2/src/core/render/api.dart' show RenderViewRef, RenderFragmentRef;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'view.ng_deps.dart' as i1;
import '../change_detection/change_detector_ref.ng_deps.dart' as i2;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i3;
export 'view_ref.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
