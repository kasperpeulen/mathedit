library angular2.src.mock.mock_application_ref.ng_deps.dart;

import 'mock_application_ref.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/application_ref.dart' show ApplicationRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/facade/lang.dart' show Type;
import 'package:angular2/src/core/linker/dynamic_component_loader.dart' show ComponentRef;
import 'package:angular2/src/core/di.dart' show Provider, Injector;
import 'package:angular2/src/core/zone/ng_zone.dart' show NgZone;
import 'package:angular2/src/facade/async.dart' show Future;
import 'package:angular2/src/core/application_ref.ng_deps.dart' as i0;
import 'package:angular2/src/core/di.ng_deps.dart' as i1;
import 'package:angular2/src/core/linker/dynamic_component_loader.ng_deps.dart' as i2;
import 'package:angular2/src/core/zone/ng_zone.ng_deps.dart' as i3;
import 'package:angular2/src/facade/async.ng_deps.dart' as i4;
export 'mock_application_ref.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(MockApplicationRef, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new MockApplicationRef())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
