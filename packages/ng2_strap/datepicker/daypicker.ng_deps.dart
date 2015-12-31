import 'daypicker.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'datepicker-inner.dart';
import 'package:intl/intl.dart';
import 'daypicker.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'datepicker-inner.ng_deps.dart' as i1;
export 'daypicker.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(DayPicker, new _ngRef.ReflectionInfo(
const [const Component(directives: const [FORM_DIRECTIVES, CORE_DIRECTIVES, NgClass], selector: "n2s-daypicker", template: '''
<table [hidden]="datePicker.datepickerMode != 'day'" role="grid" aria-labelledby="uniqueId+\'-title\'" aria-activedescendant="activeDateId">
  <thead>
    <tr>
      <th>
        <button type="button" class="btn btn-default btn-secondary btn-sm pull-left" (click)="datePicker.move(-1)" tabindex="-1">
          <i class="glyphicon glyphicon-chevron-left"></i>
        </button>
      </th>
      <th colspan="5" [hidden]="!datePicker.showWeeks">
        <button [id]="datePicker.uniqueId + '-title'"
                type="button"
                class="btn btn-default btn-secondary btn-sm"
                (click)="datePicker.toggleMode()"
                [disabled]="false"
                [ngClass]="{disabled: false}" tabindex="-1" style="width:100%;">
          <strong>{{monthTitle}}</strong>
        </button>
      </th>
      <th colspan="6" [hidden]="!datePicker.showWeeks">
        <button [id]="datePicker.uniqueId + '-title'"
                type="button" class="btn btn-default btn-secondary btn-sm"
                (click)="datePicker.toggleMode(2)"
                [disabled]="datePicker.datepickerMode == maxMode"
                [ngClass]="{disabled: datePicker.datepickerMode == maxMode}" tabindex="-1" style="width:100%;">
          <strong>{{yearTitle}}</strong>
        </button>
      </th>
      <th>
        <button type="button" class="btn btn-default btn-secondary btn-sm pull-right" (click)="datePicker.move(1)" tabindex="-1">
          <i class="glyphicon glyphicon-chevron-right"></i>
        </button>
      </th>
    </tr>
    <tr>
      <th [hidden]="!datePicker.showWeeks" class="text-center"></th>
      <th *ngFor="#labelz of labels" class="text-center"><small aria-label="labelz['full']"><b>{{labelz['abbr']}}</b></small></th>
    </tr>
  </thead>
  <tbody>
    <tr *ngFor="#rowz of rows;#index=index">
      <td [hidden]="!datePicker.showWeeks" class="text-center h6"><em>{{ weekNumbers[index] }}</em></td>
      <!--  [ngClass]="dtz['customClass']" -->
      <td *ngFor="#dtz of rowz" class="text-center" role="gridcell" [id]="dtz['uid']">
        <button type="button" style="min-width:100%;" class="btn btn-default btn-sm"
                [ngClass]="{'btn-info': dtz['selected'], active: datePicker.isActive(dtz), disabled: dtz['disabled']}"
                [disabled]="dtz['disabled']"
                (click)="datePicker.select(dtz['date'])" tabindex="-1">
          <span [ngClass]="{'text-muted': dtz['secondary'], 'text-info': dtz['current']}">{{dtz['label']}}</span>
        </button>
      </td>
    </tr>
  </tbody>
</table>
  '''), _templates.HostDayPickerTemplate],
const [const [DatePickerInner]],
(DatePickerInner datePicker) => new DayPicker(datePicker),
const [OnInit])
)
;
i0.initReflector();
i1.initReflector();
}
