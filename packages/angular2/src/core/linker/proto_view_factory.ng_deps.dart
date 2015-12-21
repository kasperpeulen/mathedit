library angular2.src.core.linker.proto_view_factory.ng_deps.dart;

import 'proto_view_factory.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank, Type, isArray, isNumber;
import 'package:angular2/src/core/render/api.dart' show RenderProtoViewRef, RenderComponentTemplate;
import 'package:angular2/src/core/di.dart' show Optional, Injectable, Provider, resolveForwardRef, Inject;
import '../pipes/pipe_provider.dart' show PipeProvider;
import '../pipes/pipes.dart' show ProtoPipes;
import 'view.dart' show AppProtoView, AppProtoViewMergeInfo, ViewType;
import 'element_binder.dart' show ElementBinder;
import 'element_injector.dart' show ProtoElementInjector, DirectiveProvider;
import 'directive_resolver.dart' show DirectiveResolver;
import 'view_resolver.dart' show ViewResolver;
import 'pipe_resolver.dart' show PipeResolver;
import '../metadata/view.dart' show ViewMetadata, ViewEncapsulation;
import 'package:angular2/src/core/platform_directives_and_pipes.dart' show PLATFORM_PIPES;
import 'template_commands.dart' show visitAllCommands, CompiledComponentTemplate, CompiledHostTemplate, TemplateCmd, CommandVisitor, EmbeddedTemplateCmd, BeginComponentCmd, BeginElementCmd, IBeginElementCmd, TextCmd, NgContentCmd;
import 'package:angular2/src/core/render/api.dart' show Renderer;
import 'package:angular2/src/core/application_tokens.dart' show APP_ID;
import 'package:angular2/src/core/render/api.ng_deps.dart' as i0;
import 'package:angular2/src/core/di.ng_deps.dart' as i1;
import '../pipes/pipe_provider.ng_deps.dart' as i2;
import '../pipes/pipes.ng_deps.dart' as i3;
import 'view.ng_deps.dart' as i4;
import 'element_binder.ng_deps.dart' as i5;
import 'element_injector.ng_deps.dart' as i6;
import 'directive_resolver.ng_deps.dart' as i7;
import 'view_resolver.ng_deps.dart' as i8;
import 'pipe_resolver.ng_deps.dart' as i9;
import '../metadata/view.ng_deps.dart' as i10;
import 'package:angular2/src/core/platform_directives_and_pipes.ng_deps.dart' as i11;
import 'template_commands.ng_deps.dart' as i12;
import 'package:angular2/src/core/application_tokens.ng_deps.dart' as i13;
export 'proto_view_factory.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(ProtoViewFactory, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Renderer], const [List, const Optional(), const Inject(PLATFORM_PIPES)], const [DirectiveResolver], const [ViewResolver], const [PipeResolver], const [String, const Inject(APP_ID)]],
(Renderer _renderer, List<dynamic> _platformPipes, DirectiveResolver _directiveResolver, ViewResolver _viewResolver, PipeResolver _pipeResolver, String _appId) => new ProtoViewFactory(_renderer, _platformPipes, _directiveResolver, _viewResolver, _pipeResolver, _appId))
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
i13.initReflector();
}
