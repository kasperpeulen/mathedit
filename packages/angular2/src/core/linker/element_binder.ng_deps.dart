library angular2.src.core.linker.element_binder.ng_deps.dart;

import 'element_binder.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'element_injector.dart' as eiModule;
import 'element_injector.dart' show DirectiveProvider;
import 'view.dart' as viewModule;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'element_injector.ng_deps.dart' as i1;
import 'view.ng_deps.dart' as i2;
export 'element_binder.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
