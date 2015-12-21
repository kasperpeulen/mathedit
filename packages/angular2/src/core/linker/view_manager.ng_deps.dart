library angular2.src.core.linker.view_manager.ng_deps.dart;

import 'view_manager.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injector, Inject, Provider, Injectable, ResolvedProvider;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'view.dart' as viewModule;
import 'element_ref.dart' show ElementRef, ElementRef_;
import 'view_ref.dart' show ProtoViewRef, ViewRef, HostViewRef, internalView, internalProtoView;
import 'view_container_ref.dart' show ViewContainerRef;
import 'template_ref.dart' show TemplateRef, TemplateRef_;
import 'package:angular2/src/core/render/api.dart' show Renderer, RenderViewRef, RenderFragmentRef, RenderViewWithFragments;
import 'view_manager_utils.dart' show AppViewManagerUtils;
import 'view_pool.dart' show AppViewPool;
import 'view_listener.dart' show AppViewListener;
import '../profile/profile.dart' show wtfCreateScope, wtfLeave, WtfScopeFn;
import 'proto_view_factory.dart' show ProtoViewFactory;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i1;
import 'view.ng_deps.dart' as i2;
import 'element_ref.ng_deps.dart' as i3;
import 'view_ref.ng_deps.dart' as i4;
import 'view_container_ref.ng_deps.dart' as i5;
import 'template_ref.ng_deps.dart' as i6;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i7;
import 'view_manager_utils.ng_deps.dart' as i8;
import 'view_pool.ng_deps.dart' as i9;
import 'view_listener.ng_deps.dart' as i10;
import '../profile/profile.ng_deps.dart' as i11;
import 'proto_view_factory.ng_deps.dart' as i12;
export 'view_manager.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(AppViewManager_, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [AppViewPool], const [AppViewListener], const [AppViewManagerUtils], const [Renderer], const [const Inject(ProtoViewFactory)]],
(AppViewPool _viewPool, AppViewListener _viewListener, AppViewManagerUtils _utils, Renderer _renderer, _protoViewFactory) => new AppViewManager_(_viewPool, _viewListener, _utils, _renderer, _protoViewFactory))
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
