library angular2.src.core.linker.template_ref.ng_deps.dart;

import 'template_ref.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'view_ref.dart' show internalView, ProtoViewRef;
import 'element_ref.dart' show ElementRef, ElementRef_;
import 'view.dart' as viewModule;
import 'view_ref.ng_deps.dart' as i0;
import 'element_ref.ng_deps.dart' as i1;
import 'view.ng_deps.dart' as i2;
export 'template_ref.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
