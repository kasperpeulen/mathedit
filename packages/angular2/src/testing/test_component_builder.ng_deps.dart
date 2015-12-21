library angular2.src.testing.test_component_builder.ng_deps.dart;

import 'test_component_builder.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/core.dart' show ComponentRef, DebugElement, DirectiveResolver, DynamicComponentLoader, Injector, Injectable, ViewMetadata, ViewRef, ViewResolver, provide;
import 'package:angular2/src/facade/lang.dart' show Type, isPresent, isBlank;
import 'package:angular2/src/facade/async.dart' show Future;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, MapWrapper;
import 'package:angular2/src/core/linker/view.dart' show AppView;
import 'package:angular2/src/core/linker/view_ref.dart' show internalView;
import 'utils.dart' show el;
import 'package:angular2/src/platform/dom/dom_tokens.dart' show DOCUMENT;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'package:angular2/src/core/debug/debug_element.dart' show DebugElement_;
import 'package:angular2/core.ng_deps.dart' as i0;
import 'package:angular2/src/facade/async.ng_deps.dart' as i1;
import 'package:angular2/src/core/linker/view.ng_deps.dart' as i2;
import 'package:angular2/src/core/linker/view_ref.ng_deps.dart' as i3;
import 'utils.ng_deps.dart' as i4;
import 'package:angular2/src/platform/dom/dom_tokens.ng_deps.dart' as i5;
import 'package:angular2/src/platform/dom/dom_adapter.ng_deps.dart' as i6;
import 'package:angular2/src/core/debug/debug_element.ng_deps.dart' as i7;
export 'test_component_builder.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TestComponentBuilder, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Injector]],
(Injector _injector) => new TestComponentBuilder(_injector))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
}
