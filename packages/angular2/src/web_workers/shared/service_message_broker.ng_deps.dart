library angular2.src.web_workers.shared.service_message_broker.ng_deps.dart;

import 'service_message_broker.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, Map, MapWrapper;
import 'package:angular2/src/web_workers/shared/serializer.dart' show Serializer;
import 'package:angular2/src/facade/lang.dart' show isPresent, Type, FunctionWrapper;
import 'package:angular2/src/web_workers/shared/message_bus.dart' show MessageBus;
import 'package:angular2/src/facade/async.dart' show EventEmitter, Future, PromiseWrapper, ObservableWrapper;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/web_workers/shared/serializer.ng_deps.dart' as i1;
import 'package:angular2/src/web_workers/shared/message_bus.ng_deps.dart' as i2;
import 'package:angular2/src/facade/async.ng_deps.dart' as i3;
export 'service_message_broker.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ServiceMessageBrokerFactory_, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [MessageBus], const [Serializer]],
(MessageBus _messageBus, Serializer _serializer) => new ServiceMessageBrokerFactory_(_messageBus, _serializer))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
