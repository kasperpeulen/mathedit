library angular2.src.web_workers.ui.renderer.ng_deps.dart;

import 'renderer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/web_workers/shared/message_bus.dart' show MessageBus;
import 'package:angular2/src/web_workers/shared/serializer.dart' show Serializer, PRIMITIVE;
import 'package:angular2/src/core/render/api.dart' show RenderViewRef, RenderFragmentRef, RenderProtoViewRef, Renderer, RenderTemplateCmd, RenderComponentTemplate;
import 'package:angular2/src/web_workers/shared/api.dart' show WebWorkerElementRef, WebWorkerTemplateCmd;
import 'package:angular2/src/web_workers/shared/messaging_api.dart' show EVENT_CHANNEL, RENDERER_CHANNEL;
import 'package:angular2/src/facade/lang.dart' show Type;
import 'bind.dart' show bind;
import 'package:angular2/src/web_workers/ui/event_dispatcher.dart' show EventDispatcher;
import 'package:angular2/src/web_workers/shared/render_proto_view_ref_store.dart' show RenderProtoViewRefStore;
import 'package:angular2/src/web_workers/shared/render_view_with_fragments_store.dart' show RenderViewWithFragmentsStore;
import 'package:angular2/src/web_workers/shared/service_message_broker.dart' show ServiceMessageBrokerFactory;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/web_workers/shared/message_bus.ng_deps.dart' as i1;
import 'package:angular2/src/web_workers/shared/serializer.ng_deps.dart' as i2;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i3;
import 'package:angular2/src/web_workers/shared/api.ng_deps.dart' as i4;
import 'package:angular2/src/web_workers/ui/event_dispatcher.ng_deps.dart' as i5;
import 'package:angular2/src/web_workers/shared/render_proto_view_ref_store.ng_deps.dart' as i6;
import 'package:angular2/src/web_workers/shared/render_view_with_fragments_store.ng_deps.dart' as i7;
import 'package:angular2/src/web_workers/shared/service_message_broker.ng_deps.dart' as i8;
export 'renderer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(MessageBasedRenderer, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [ServiceMessageBrokerFactory], const [MessageBus], const [Serializer], const [RenderProtoViewRefStore], const [RenderViewWithFragmentsStore], const [Renderer]],
(ServiceMessageBrokerFactory _brokerFactory, MessageBus _bus, Serializer _serializer, RenderProtoViewRefStore _renderProtoViewRefStore, RenderViewWithFragmentsStore _renderViewWithFragmentsStore, Renderer _renderer) => new MessageBasedRenderer(_brokerFactory, _bus, _serializer, _renderProtoViewRefStore, _renderViewWithFragmentsStore, _renderer))
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
}
