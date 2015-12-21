library angular2.src.core.platform_common_providers.ng_deps.dart;

import 'platform_common_providers.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, isBlank, isPresent, assertionsEnabled;
import 'package:angular2/src/core/di.dart' show provide, Provider, Injector, OpaqueToken;
import 'package:angular2/src/core/console.dart' show Console;
import 'reflection/reflection.dart' show Reflector, reflector;
import 'package:angular2/src/core/testability/testability.dart' show TestabilityRegistry;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/core/console.ng_deps.dart' as i1;
import 'reflection/reflection.ng_deps.dart' as i2;
import 'package:angular2/src/core/testability/testability.ng_deps.dart' as i3;
export 'platform_common_providers.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
