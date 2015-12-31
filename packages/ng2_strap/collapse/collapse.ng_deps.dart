import 'collapse.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'dart:async';
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'collapse.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Collapse, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"[class.in]" : "isExpanded", "[class.collapse]" : "isCollapse", "[class.collapsing]" : "isCollapsing", "[attr.aria-expanded]" : "isExpanded", "[attr.aria-hidden]" : "isCollapsed", "[style.height]" : "height"}, inputs: const ["collapse"], selector: "[collapse]")],
const [const [ElementRef]],
(ElementRef el) => new Collapse(el))
)
..registerSetters({'collapse': (o, v) => o.collapse = v})
;
i0.initReflector();
}
