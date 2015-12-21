library angular2.platform.worker_app.ng_deps.dart;

import 'worker_app.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/platform/worker_app_common.ng_deps.dart' as i0;
import 'package:angular2/src/platform/worker_app.ng_deps.dart' as i1;
import 'package:angular2/src/web_workers/shared/client_message_broker.ng_deps.dart' as i2;
import 'package:angular2/src/web_workers/shared/service_message_broker.ng_deps.dart' as i3;
import 'package:angular2/src/web_workers/shared/serializer.ng_deps.dart' as i4;
import 'package:angular2/src/web_workers/shared/message_bus.ng_deps.dart' as i5;
export 'worker_app.dart';
export 'package:angular2/src/platform/worker_app_common.dart' show WORKER_APP_PLATFORM, WORKER_APP_APPLICATION_COMMON;
export 'package:angular2/src/core/angular_entrypoint.dart' show AngularEntrypoint;
export 'package:angular2/src/platform/worker_app.dart' show WORKER_APP_APPLICATION, RENDER_SEND_PORT;
export 'package:angular2/src/web_workers/shared/client_message_broker.dart' show ClientMessageBroker, ClientMessageBrokerFactory, FnArg, UiArguments;
export 'package:angular2/src/web_workers/shared/service_message_broker.dart' show ReceivedMessage, ServiceMessageBroker, ServiceMessageBrokerFactory;
export 'package:angular2/src/web_workers/shared/serializer.dart' show PRIMITIVE;
export 'package:angular2/src/web_workers/shared/message_bus.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
