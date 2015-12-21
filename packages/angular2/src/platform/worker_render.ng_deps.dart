library angular2.src.platform.worker_render.ng_deps.dart;

import 'worker_render.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/platform/worker_render_common.dart' show WORKER_RENDER_APP_COMMON, WORKER_RENDER_MESSAGING_PROVIDERS, WORKER_SCRIPT, initializeGenericWorkerRenderer;
import 'package:angular2/src/web_workers/shared/isolate_message_bus.dart';
import 'package:angular2/src/web_workers/shared/message_bus.dart';
import 'package:angular2/core.dart';
import 'package:angular2/src/core/di.dart';
import 'package:angular2/src/core/zone/ng_zone.dart';
import 'dart:isolate';
import 'dart:async';
import 'package:angular2/src/platform/worker_render_common.ng_deps.dart' as i0;
import 'package:angular2/src/web_workers/shared/isolate_message_bus.ng_deps.dart' as i1;
import 'package:angular2/src/web_workers/shared/message_bus.ng_deps.dart' as i2;
import 'package:angular2/core.ng_deps.dart' as i3;
import 'package:angular2/src/core/di.ng_deps.dart' as i4;
import 'package:angular2/src/core/zone/ng_zone.ng_deps.dart' as i5;
export 'worker_render.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(WebWorkerInstance, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Isolate], const [MessageBus]],
(Isolate worker, MessageBus bus) => new WebWorkerInstance(worker, bus))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
