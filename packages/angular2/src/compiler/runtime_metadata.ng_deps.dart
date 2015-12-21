library angular2.src.compiler.runtime_metadata.ng_deps.dart;

import 'runtime_metadata.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show resolveForwardRef;
import 'package:angular2/src/facade/lang.dart' show Type, isBlank, isPresent, isArray, stringify, RegExpWrapper;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'directive_metadata.dart' as cpl;
import 'package:angular2/src/core/metadata/directives.dart' as md;
import 'package:angular2/src/core/linker/directive_resolver.dart' show DirectiveResolver;
import 'package:angular2/src/core/linker/view_resolver.dart' show ViewResolver;
import 'package:angular2/src/core/metadata/view.dart' show ViewMetadata;
import 'package:angular2/src/core/linker/directive_lifecycle_reflector.dart' show hasLifecycleHook;
import 'package:angular2/src/core/linker/interfaces.dart' show LifecycleHooks, LIFECYCLE_HOOKS_VALUES;
import 'package:angular2/src/core/reflection/reflection.dart' show reflector;
import 'package:angular2/src/core/di.dart' show Injectable, Inject, Optional;
import 'package:angular2/src/core/platform_directives_and_pipes.dart' show PLATFORM_DIRECTIVES;
import 'util.dart' show MODULE_SUFFIX;
import 'package:angular2/src/compiler/url_resolver.dart' show getUrlScheme;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i1;
import 'directive_metadata.ng_deps.dart' as i2;
import 'package:angular2/src/core/metadata/directives.ng_deps.dart' as i3;
import 'package:angular2/src/core/linker/directive_resolver.ng_deps.dart' as i4;
import 'package:angular2/src/core/linker/view_resolver.ng_deps.dart' as i5;
import 'package:angular2/src/core/metadata/view.ng_deps.dart' as i6;
import 'package:angular2/src/core/linker/directive_lifecycle_reflector.ng_deps.dart' as i7;
import 'package:angular2/src/core/linker/interfaces.ng_deps.dart' as i8;
import 'package:angular2/src/core/reflection/reflection.ng_deps.dart' as i9;
import 'package:angular2/src/core/platform_directives_and_pipes.ng_deps.dart' as i10;
import 'util.ng_deps.dart' as i11;
import 'package:angular2/src/compiler/url_resolver.ng_deps.dart' as i12;
export 'runtime_metadata.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(RuntimeMetadataResolver, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [DirectiveResolver], const [ViewResolver], const [List, const Optional(), const Inject(PLATFORM_DIRECTIVES)]],
(DirectiveResolver _directiveResolver, ViewResolver _viewResolver, List<Type> _platformDirectives) => new RuntimeMetadataResolver(_directiveResolver, _viewResolver, _platformDirectives))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
i7.initReflector();
i8.initReflector();
i9.initReflector();
i10.initReflector();
i11.initReflector();
i12.initReflector();
}
