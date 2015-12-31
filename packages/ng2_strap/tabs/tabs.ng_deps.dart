import 'tabs.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:ng2_strap/common.dart';
import 'package:node_shims/js.dart';
import 'tabs.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'package:ng2_strap/common.ng_deps.dart' as i1;
export 'tabs.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Tabset, new _ngRef.ReflectionInfo(
const [const Component(directives: const [CORE_DIRECTIVES, NgTransclude], inputs: const ["vertical", "justified", "type"], selector: "n2s-tabset", template: '''
    <ul class="nav"
        [ngClass]="{
          'nav-stacked' : vertical,
          'nav-justified' : justified,
          'nav-tabs' : type == 'tabs',
          'nav-pills' : type == 'pills'
        }"
        (click)="\$event.preventDefault()">
        <li *ngFor="#tabz of tabs" class="nav-item" [ngClass]="{active: tabz.active, disabled: tabz.disabled}">
          <a href class="nav-link" [ngClass]="{active: tabz.active, disabled: tabz.disabled}" (click)="tabz.active = true">
            <span ng-transclude [ngTransclude]="tabz.headingRef">{{tabz.heading}}</span>
          </a>
        </li>
    </ul>
    <div class="tab-content">
      <ng-content></ng-content>
    </div>
  '''), _templates.HostTabsetTemplate],
const [],
() => new Tabset(),
const [OnInit])
)
..registerType(Tab, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"[class.tab-pane]" : "true", "[class.active]" : "active"}, inputs: const ["active", "disable", "disabled", "heading"], outputs: const ["select", "deselect"], selector: "n2s-tab")],
const [const [Tabset]],
(Tabset tabset) => new Tab(tabset),
const [OnInit, OnDestroy, DoCheck],
const {
'disable': const [deprecated, deprecated]})
)
..registerType(TabHeading, new _ngRef.ReflectionInfo(
const [const Directive(selector: "[n2s-tab-heading]")],
const [const [TemplateRef], const [Tab]],
(TemplateRef templateRef, Tab tab) => new TabHeading(templateRef, tab))
)
..registerGetters({'select': (o) => o.select, 'deselect': (o) => o.deselect})
..registerSetters({'vertical': (o, v) => o.vertical = v, 'justified': (o, v) => o.justified = v, 'type': (o, v) => o.type = v, 'active': (o, v) => o.active = v, 'disable': (o, v) => o.disable = v, 'disabled': (o, v) => o.disabled = v, 'heading': (o, v) => o.heading = v})
;
i0.initReflector();
i1.initReflector();
}
