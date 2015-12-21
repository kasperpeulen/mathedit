library angular2.src.core.debug.debug_element.ng_deps.dart;

import 'debug_element.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, isPresent, isBlank;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, MapWrapper, Predicate;
import 'package:angular2/src/facade/exceptions.dart' show unimplemented;
import 'package:angular2/src/core/linker/element_injector.dart' show ElementInjector;
import 'package:angular2/src/core/linker/view.dart' show AppView, ViewType;
import 'package:angular2/src/core/linker/view_ref.dart' show internalView;
import 'package:angular2/src/core/linker/element_ref.dart' show ElementRef, ElementRef_;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'package:angular2/src/core/linker/element_injector.ng_deps.dart' as i1;
import 'package:angular2/src/core/linker/view.ng_deps.dart' as i2;
import 'package:angular2/src/core/linker/view_ref.ng_deps.dart' as i3;
import 'package:angular2/src/core/linker/element_ref.ng_deps.dart' as i4;
export 'debug_element.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
