import 'progressbar.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'progressbar.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'progressbar.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Progress, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"class" : "progress", "[attr.max]" : "max"}, inputs: const ["animate", "max"], selector: "[n2s-progress]")],
const [],
() => new Progress(),
const [OnInit])
)
..registerType(Bar, new _ngRef.ReflectionInfo(
const [const Component(directives: const [NgStyle, NgClass], encapsulation: ViewEncapsulation.None, inputs: const ["type", "value"], selector: "n2s-bar", template: '''
  <div class="progress-bar"
    style="min-width: 0;"
    role="progressbar"
    [ngClass]="type"
    [ngStyle]="{'width': (percent < 100 ? percent : 100).toString() + \'%\', transition: transition}"
    aria-valuemin="0"
    [attr.aria-valuenow]="value"
    [attr.aria-valuetext]="percent.toStringAsFixed(0) + \'%\'"
    [attr.aria-valuemax]="max"
    ><ng-content></ng-content></div>
'''), _templates.HostBarTemplate],
const [const [Progress, const Host()]],
(Progress progress) => new Bar(progress),
const [OnInit, OnDestroy])
)
..registerType(Progressbar, new _ngRef.ReflectionInfo(
const [const Component(directives: const [Progress, Bar], inputs: const ["animate", "max", "type", "value"], selector: "n2s-progressbar", template: '''
    <div n2s-progress [animate]="animate" [max]="max">
      <n2s-bar [type]="type" [value]="value">
          <ng-content></ng-content>
      </n2s-bar>
    </div>
  '''), _templates.HostProgressbarTemplate],
const [],
() => new Progressbar())
)
..registerSetters({'animate': (o, v) => o.animate = v, 'max': (o, v) => o.max = v, 'type': (o, v) => o.type = v, 'value': (o, v) => o.value = v})
;
i0.initReflector();
}
