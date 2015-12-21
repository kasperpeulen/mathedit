library angular2.src.core.linker.directive_resolver.ng_deps.dart;

import 'directive_resolver.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show resolveForwardRef, Injectable;
import 'package:angular2/src/facade/lang.dart' show Type, isPresent, isBlank, stringify;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/collection.dart' show ListWrapper, StringMapWrapper;
import 'package:angular2/src/core/metadata.dart' show DirectiveMetadata, ComponentMetadata, InputMetadata, OutputMetadata, HostBindingMetadata, HostListenerMetadata, ContentChildrenMetadata, ViewChildrenMetadata, ContentChildMetadata, ViewChildMetadata;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i1;
import 'package:angular2/src/core/metadata.ng_deps.dart' as i2;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i3;
export 'directive_resolver.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(DirectiveResolver, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new DirectiveResolver())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
