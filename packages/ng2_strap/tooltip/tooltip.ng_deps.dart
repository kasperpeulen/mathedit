import 'tooltip.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:ng2_strap/position.dart';
import 'dart:async';
import 'tooltip.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'package:ng2_strap/position.ng_deps.dart' as i1;
export 'tooltip.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TooltipContainer, new _ngRef.ReflectionInfo(
const [const Component(directives: const [NgClass, NgStyle], encapsulation: ViewEncapsulation.None, selector: "n2s-tooltip-container", template: '''
    <div class="tooltip" role="tooltip"
     [ngStyle]="{top: top, left: left, display: display}"
     [ngClass]="classMap" >
      <div class="tooltip-arrow"></div>
      <div class="tooltip-inner">
        {{content}}
      </div>
    </div>'''), _templates.HostTooltipContainerTemplate],
const [const [ElementRef], const [TooltipOptions]],
(ElementRef element, TooltipOptions options) => new TooltipContainer(element, options))
)
..registerType(Tooltip, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"(mouseenter)" : "show(\$event)", "(mouseleave)" : "hide(\$event)", "(focusin)" : "show(\$event)", "(focusout)" : "hide(\$event)"}, inputs: const ["content:tooltip", "placement:tooltip-placement", "appendToBody", "isOpen: tooltip-is-open", "enable: tooltip-enable"], selector: "[tooltip]")],
const [const [ElementRef], const [DynamicComponentLoader]],
(ElementRef element, DynamicComponentLoader loader) => new Tooltip(element, loader))
)
..registerSetters({'content': (o, v) => o.content = v, 'placement': (o, v) => o.placement = v, 'appendToBody': (o, v) => o.appendToBody = v, 'isOpen': (o, v) => o.isOpen = v, 'enable': (o, v) => o.enable = v})
;
i0.initReflector();
i1.initReflector();
}
