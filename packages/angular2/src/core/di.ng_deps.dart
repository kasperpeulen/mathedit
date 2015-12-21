library angular2.src.core.di.ng_deps.dart;

import 'di.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'di/metadata.ng_deps.dart' as i0;
import 'di/decorators.ng_deps.dart' as i1;
import 'di/injector.ng_deps.dart' as i2;
import 'di/provider.ng_deps.dart' as i3;
import 'di/key.ng_deps.dart' as i4;
import 'di/exceptions.ng_deps.dart' as i5;
export 'di.dart';
export 'di/metadata.dart' show InjectMetadata, OptionalMetadata, InjectableMetadata, SelfMetadata, HostMetadata, SkipSelfMetadata, DependencyMetadata;
export 'di/decorators.dart';
export 'di/forward_ref.dart' show forwardRef, resolveForwardRef, ForwardRefFn;
export 'di/injector.dart' show Injector;
export 'di/provider.dart' show Binding, ProviderBuilder, ResolvedBinding, ResolvedFactory, Dependency, bind, Provider, ResolvedProvider, provide;
export 'di/key.dart' show Key, TypeLiteral;
export 'di/exceptions.dart' show NoProviderError, AbstractProviderError, CyclicDependencyError, InstantiationError, InvalidProviderError, NoAnnotationError, OutOfBoundsError;
export 'di/opaque_token.dart' show OpaqueToken;
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
