library angular2.src.web_workers.worker.xhr_impl.ng_deps.dart;

import 'xhr_impl.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/facade/async.dart' show Future;
import 'package:angular2/src/compiler/xhr.dart' show XHR;
import 'package:angular2/src/web_workers/shared/client_message_broker.dart' show FnArg, UiArguments, ClientMessageBroker, ClientMessageBrokerFactory;
import 'package:angular2/src/web_workers/shared/messaging_api.dart' show XHR_CHANNEL;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/facade/async.ng_deps.dart' as i1;
import 'package:angular2/src/compiler/xhr.ng_deps.dart' as i2;
import 'package:angular2/src/web_workers/shared/client_message_broker.ng_deps.dart' as i3;
export 'xhr_impl.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(WebWorkerXHRImpl, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [ClientMessageBrokerFactory]],
(ClientMessageBrokerFactory messageBrokerFactory) => new WebWorkerXHRImpl(messageBrokerFactory))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
