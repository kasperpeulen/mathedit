import 'alert.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:node_shims/js.dart';
import 'alert.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'alert.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Alert, new _ngRef.ReflectionInfo(
const [const Component(directives: const [NgIf, NgClass], inputs: const ["type", "dismissible", "dismissOnTimeout"], outputs: const ["close"], selector: "n2s-alert", template: '''
<div class="alert" role="alert" [ngClass]="classes" *ngIf="!closed">
    <button *ngIf="closeable" type="button" class="close" (click)="onClose()">
        <span aria-hidden="true">&times;</span>
        <span class="sr-only">Close</span>
    </button>
    <ng-content></ng-content>
</div>
'''), _templates.HostAlertTemplate],
const [const [ElementRef]],
(ElementRef el) => new Alert(el),
const [OnInit])
)
..registerGetters({'close': (o) => o.close})
..registerSetters({'type': (o, v) => o.type = v, 'dismissible': (o, v) => o.dismissible = v, 'dismissOnTimeout': (o, v) => o.dismissOnTimeout = v})
;
i0.initReflector();
}
