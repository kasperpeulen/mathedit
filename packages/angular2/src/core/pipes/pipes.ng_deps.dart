library angular2.src.core.pipes.pipes.ng_deps.dart;

import 'pipes.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent, Type;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/collection.dart' show StringMapWrapper;
import 'package:angular2/src/core/di.dart' show Injectable, OptionalMetadata, SkipSelfMetadata, Provider, Injector, bind;
import 'pipe_provider.dart' show PipeProvider;
import 'package:angular2/src/core/change_detection/pipes.dart' as cd;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'package:angular2/src/core/di.ng_deps.dart' as i1;
import 'pipe_provider.ng_deps.dart' as i2;
import 'package:angular2/src/core/change_detection/pipes.ng_deps.dart' as i3;
export 'pipes.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
