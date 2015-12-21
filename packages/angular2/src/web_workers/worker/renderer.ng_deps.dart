library angular2.src.web_workers.worker.renderer.ng_deps.dart;

import 'renderer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/render/api.dart' show Renderer, RenderProtoViewRef, RenderViewRef, RenderElementRef, RenderEventDispatcher, RenderViewWithFragments, RenderFragmentRef, RenderTemplateCmd, RenderComponentTemplate;
import 'package:angular2/src/web_workers/shared/client_message_broker.dart' show ClientMessageBroker, ClientMessageBrokerFactory, FnArg, UiArguments;
import 'package:angular2/src/facade/lang.dart' show isPresent, print;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/web_workers/shared/render_proto_view_ref_store.dart' show RenderProtoViewRefStore;
import 'package:angular2/src/web_workers/shared/render_view_with_fragments_store.dart' show RenderViewWithFragmentsStore, WebWorkerRenderViewRef;
import 'package:angular2/src/web_workers/shared/api.dart' show WebWorkerElementRef, WebWorkerTemplateCmd;
import 'package:angular2/src/web_workers/shared/messaging_api.dart' show RENDERER_CHANNEL;
import 'package:angular2/src/web_workers/worker/event_dispatcher.dart' show WebWorkerEventDispatcher;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i0;
import 'package:angular2/src/web_workers/shared/client_message_broker.ng_deps.dart' as i1;
import 'package:angular2/src/core/di.ng_deps.dart' as i2;
import 'package:angular2/src/web_workers/shared/render_proto_view_ref_store.ng_deps.dart' as i3;
import 'package:angular2/src/web_workers/shared/render_view_with_fragments_store.ng_deps.dart' as i4;
import 'package:angular2/src/web_workers/shared/api.ng_deps.dart' as i5;
import 'package:angular2/src/web_workers/worker/event_dispatcher.ng_deps.dart' as i6;
export 'renderer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(WebWorkerRenderer, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [ClientMessageBrokerFactory], const [RenderProtoViewRefStore], const [RenderViewWithFragmentsStore], const [WebWorkerEventDispatcher]],
(ClientMessageBrokerFactory messageBrokerFactory, RenderProtoViewRefStore _renderProtoViewRefStore, RenderViewWithFragmentsStore _renderViewStore, WebWorkerEventDispatcher _eventDispatcher) => new WebWorkerRenderer(messageBrokerFactory, _renderProtoViewRefStore, _renderViewStore, _eventDispatcher),
const [Renderer])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}
