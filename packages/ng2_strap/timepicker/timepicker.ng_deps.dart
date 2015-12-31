import 'timepicker.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'dart:html';
import 'timepicker.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'timepicker.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Timepicker, new _ngRef.ReflectionInfo(
const [const Component(directives: const [FORM_DIRECTIVES, NgClass], inputs: const ["hourStep", "minuteStep", "meridians", "showMeridian", "readonlyInput", "mousewheel", "arrowkeys", "showSpinners", "min", "max"], selector: "timepicker[ngModel]", template: '''
    <table>
      <tbody>
        <tr class="text-center" [ngClass]="{hidden: !showSpinners}">
          <td><a (click)="incrementHours()" [ngClass]="{disabled: noIncrementHours()}" class="btn btn-link"><span class="glyphicon glyphicon-chevron-up"></span></a></td>
          <td>&nbsp;</td>
          <td><a (click)="incrementMinutes()" [ngClass]="{disabled: noIncrementMinutes()}" class="btn btn-link"><span class="glyphicon glyphicon-chevron-up"></span></a></td>
          <td [ngClass]="{hidden: !showMeridian}" [hidden]="!showMeridian"></td>
        </tr>
        <tr>
          <td class="form-group" [ngClass]="{\'has-error\': invalidHours}">
            <input style="width:50px;" type="text" [(ngModel)]="hours" (change)="updateHours()" class="form-control text-center" [readonly]="readonlyInput" (blur)="hoursOnBlur(\$event)" maxlength="2">
          </td>
          <td>:</td>
          <td class="form-group" [ngClass]="{\'has-error\': invalidMinutes}">
            <input style="width:50px;" type="text" [(ngModel)]="minutes" (change)="updateMinutes()" class="form-control text-center" [readonly]="readonlyInput" (blur)="minutesOnBlur(\$event)" maxlength="2">
          </td>
          <td [ngClass]="{hidden: !showMeridian}" [hidden]="!showMeridian"><button type="button" [ngClass]="{disabled: noToggleMeridian()}" class="btn btn-default text-center" (click)="toggleMeridian()">{{meridian}}</button></td>
        </tr>
        <tr class="text-center" [ngClass]="{hidden: !showSpinners}">
          <td><a (click)="decrementHours()" [ngClass]="{disabled: noDecrementHours()}" class="btn btn-link"><span class="glyphicon glyphicon-chevron-down"></span></a></td>
          <td>&nbsp;</td>
          <td><a (click)="decrementMinutes()" [ngClass]="{disabled: noDecrementMinutes()}" class="btn btn-link"><span class="glyphicon glyphicon-chevron-down"></span></a></td>
          <td [ngClass]="{hidden: !showMeridian}" [hidden]="!showMeridian"></td>
        </tr>
      </tbody>
    </table>
  '''), _templates.HostTimepickerTemplate],
const [const [NgModel], const [Renderer], const [ElementRef]],
(NgModel cd, Renderer renderer, ElementRef elementRef) => new Timepicker(cd, renderer, elementRef),
const [OnInit])
)
..registerSetters({'hourStep': (o, v) => o.hourStep = v, 'minuteStep': (o, v) => o.minuteStep = v, 'meridians': (o, v) => o.meridians = v, 'showMeridian': (o, v) => o.showMeridian = v, 'readonlyInput': (o, v) => o.readonlyInput = v, 'mousewheel': (o, v) => o.mousewheel = v, 'arrowkeys': (o, v) => o.arrowkeys = v, 'showSpinners': (o, v) => o.showSpinners = v, 'min': (o, v) => o.min = v, 'max': (o, v) => o.max = v})
;
i0.initReflector();
}
