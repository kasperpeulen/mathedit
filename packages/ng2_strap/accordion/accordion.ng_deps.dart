import 'accordion.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:node_shims/js.dart';
import 'dart:html';
import 'package:ng2_strap/collapse/collapse.dart';
import 'accordion.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'package:ng2_strap/collapse/collapse.ng_deps.dart' as i1;
export 'accordion.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Accordion, new _ngRef.ReflectionInfo(
const [const Component(host: const {"[class.panel-group]" : "true"}, inputs: const ["templateUrl", "closeOthers"], selector: "n2s-accordion", template: '''<ng-content></ng-content>'''), _templates.HostAccordionTemplate],
const [],
() => new Accordion())
)
..registerType(AccordionTransclude, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["accordionTransclude"], selector: "accordion-transclude, [accordion-transclude]")],
const [const [ViewContainerRef, const Inject(ViewContainerRef)]],
(ViewContainerRef viewRef) => new AccordionTransclude(viewRef),
const [OnInit])
)
..registerType(AccordionPanel, new _ngRef.ReflectionInfo(
const [const Component(directives: const [Collapse, NgClass], host: const {"[class.panel-open]" : "isOpen"}, inputs: const ["heading", "isOpen", "isDisabled", "panelClass"], selector: "n2s-accordion-panel", template: '''
  <div class="panel" [ngClass]="panelClass">
    <div class="panel-heading" (click)="toggleOpen(\$event)">
      <h4 class="panel-title">
        <a href tabindex="0" class="accordion-toggle">
          <span [ngClass]="{\'text-muted\': isDisabled}">
            {{heading}}
            <ng-content select="n2s-accordion-heading"></ng-content>
          </span>
        </a>
      </h4>
    </div>
    <div class="panel-collapse collapse" [collapse]="!isOpen">
      <div class="panel-body">
        <ng-content></ng-content>
      </div>
    </div>
  </div>
  '''), _templates.HostAccordionPanelTemplate],
const [const [Accordion]],
(Accordion accordion) => new AccordionPanel(accordion),
const [OnInit, OnDestroy])
)
..registerSetters({'templateUrl': (o, v) => o.templateUrl = v, 'closeOthers': (o, v) => o.closeOthers = v, 'accordionTransclude': (o, v) => o.accordionTransclude = v, 'heading': (o, v) => o.heading = v, 'isOpen': (o, v) => o.isOpen = v, 'isDisabled': (o, v) => o.isDisabled = v, 'panelClass': (o, v) => o.panelClass = v})
;
i0.initReflector();
i1.initReflector();
}
