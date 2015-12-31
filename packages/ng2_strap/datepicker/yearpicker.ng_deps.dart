import 'yearpicker.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'datepicker-inner.dart';
import 'yearpicker.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'datepicker-inner.ng_deps.dart' as i1;
export 'yearpicker.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(YearPicker, new _ngRef.ReflectionInfo(
const [const Component(selector: "n2s-yearpicker"), const View(directives: const [FORM_DIRECTIVES, CORE_DIRECTIVES, NgClass], template: '''
<table [hidden]="datePicker.datepickerMode!='year'" role="grid">
  <thead>
    <tr>
      <th>
        <button type="button" class="btn btn-default btn-sm pull-left"
                (click)="datePicker.move(-1)" tabindex="-1">
          <i class="glyphicon glyphicon-chevron-left"></i>
        </button>
      </th>
      <th colspan="3">
        <button [id]="uniqueId + \'-title\'" role="heading"
                type="button" class="btn btn-default btn-sm"
                (click)="datePicker.toggleMode()"
                [disabled]="datePicker.datepickerMode === datePicker.maxMode"
                [ngClass]="{disabled: datePicker.datepickerMode === datePicker.maxMode}" tabindex="-1" style="width:100%;">
          <strong>{{title}}</strong>
        </button>
      </th>
      <th>
        <button type="button" class="btn btn-default btn-sm pull-right"
                (click)="datePicker.move(1)" tabindex="-1">
          <i class="glyphicon glyphicon-chevron-right"></i>
        </button>
      </th>
    </tr>
  </thead>
  <tbody>
    <tr *ngFor="#rowz of rows">
      <td *ngFor="#dtz of rowz" class="text-center" role="gridcell">

        <button type="button" style="min-width:100%;" class="btn btn-default"
                [ngClass]="{\'btn-info\': dtz['selected'], active: datePicker.isActive(dtz), disabled: dtz['disabled']}"
                [disabled]="dtz['disabled']"
                (click)="datePicker.select(dtz['date'])" tabindex="-1">
          <span [ngClass]="{\'text-info\': dtz['current']}">{{dtz['label']}}</span>
        </button>

      </td>
    </tr>
  </tbody>
</table>
  '''), _templates.HostYearPickerTemplate],
const [const [DatePickerInner]],
(DatePickerInner datePicker) => new YearPicker(datePicker),
const [OnInit])
)
;
i0.initReflector();
i1.initReflector();
}
