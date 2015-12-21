library angular2.src.platform.dom.dom_renderer.ng_deps.dart;

import 'dom_renderer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Inject, Injectable, OpaqueToken;
import 'package:angular2/src/animate/animation_builder.dart' show AnimationBuilder;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, Json, RegExpWrapper, stringify, StringWrapper;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'shared_styles_host.dart' show DomSharedStylesHost;
import 'package:angular2/src/core/profile/profile.dart' show WtfScopeFn, wtfLeave, wtfCreateScope;
import 'package:angular2/core.dart' show Renderer, RenderProtoViewRef, RenderViewRef, RenderElementRef, RenderFragmentRef, RenderViewWithFragments, RenderTemplateCmd, RenderEventDispatcher, RenderComponentTemplate;
import 'events/event_manager.dart' show EventManager;
import 'dom_tokens.dart' show DOCUMENT;
import 'package:angular2/src/core/render/view_factory.dart' show createRenderView, NodeFactory, encapsulateStyles;
import 'package:angular2/src/core/render/view.dart' show DefaultRenderView, DefaultRenderFragmentRef, DefaultProtoViewRef;
import 'package:angular2/src/core/metadata.dart' show ViewEncapsulation;
import 'package:angular2/src/platform/dom/dom_adapter.dart' show DOM;
import 'util.dart' show camelCaseToDashCase;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/animate/animation_builder.ng_deps.dart' as i1;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i2;
import 'shared_styles_host.ng_deps.dart' as i3;
import 'package:angular2/src/core/profile/profile.ng_deps.dart' as i4;
import 'package:angular2/core.ng_deps.dart' as i5;
import 'events/event_manager.ng_deps.dart' as i6;
import 'dom_tokens.ng_deps.dart' as i7;
import 'package:angular2/src/core/render/view_factory.ng_deps.dart' as i8;
import 'package:angular2/src/core/render/view.ng_deps.dart' as i9;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i10;
import 'package:angular2/src/platform/dom/dom_adapter.ng_deps.dart' as i11;
import 'util.ng_deps.dart' as i12;
export 'dom_renderer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(DomRenderer_, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [EventManager], const [DomSharedStylesHost], const [AnimationBuilder], const [const Inject(DOCUMENT)]],
(EventManager _eventManager, DomSharedStylesHost _domSharedStylesHost, AnimationBuilder _animate, document) => new DomRenderer_(_eventManager, _domSharedStylesHost, _animate, document))
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
i8.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
}
