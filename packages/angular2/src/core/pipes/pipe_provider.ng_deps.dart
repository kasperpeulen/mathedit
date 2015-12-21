library angular2.src.core.pipes.pipe_provider.ng_deps.dart;

import 'pipe_provider.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type;
import 'package:angular2/src/core/di/provider.dart' show ResolvedFactory, resolveProvider, ResolvedProvider_;
import 'package:angular2/src/core/di.dart' show Key, ResolvedProvider, Provider;
import '../metadata/directives.dart' show PipeMetadata;
import 'package:angular2/src/core/di/provider.ng_deps.dart' as i0;
import 'package:angular2/src/core/di.ng_deps.dart' as i1;
import '../metadata/directives.ng_deps.dart' as i2;
export 'pipe_provider.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
