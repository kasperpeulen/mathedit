import 'autogrow_directive.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'dart:html';
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'autogrow_directive.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(AutogrowDirective, new _ngRef.ReflectionInfo(
const [const Directive(host: const {'(input)' : 'onInput(\$event.target)'}, selector: 'textarea[autogrow]')],
const [],
() => new AutogrowDirective())
)
;
i0.initReflector();
}
