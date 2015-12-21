library angular2.src.core.di.provider.ng_deps.dart;

import 'provider.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show Type, isBlank, isPresent, stringify, isArray, isType, isFunction, normalizeBool;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/collection.dart' show MapWrapper, ListWrapper;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'key.dart' show Key;
import 'metadata.dart' show InjectMetadata, InjectableMetadata, OptionalMetadata, SelfMetadata, HostMetadata, SkipSelfMetadata, DependencyMetadata;
import 'exceptions.dart' show NoAnnotationError, MixingMultiProvidersWithRegularProvidersError, InvalidProviderError;
import 'forward_ref.dart' show resolveForwardRef;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i1;
import 'key.ng_deps.dart' as i2;
import 'metadata.ng_deps.dart' as i3;
import 'exceptions.ng_deps.dart' as i4;
export 'provider.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
