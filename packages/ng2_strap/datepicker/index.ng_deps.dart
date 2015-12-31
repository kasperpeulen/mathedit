library ns_datepicker.ng_deps.dart;

import 'index.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:angular2/src/core/di.dart';
import 'package:ng2_strap/position.dart';
import 'datepicker-inner.dart';
import 'daypicker.dart';
import 'monthpicker.dart';
import 'yearpicker.dart';
import 'dart:async';
import 'index.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'package:angular2/src/core/di.ng_deps.dart' as i1;
import 'package:ng2_strap/position.ng_deps.dart' as i2;
import 'datepicker-inner.ng_deps.dart' as i3;
import 'daypicker.ng_deps.dart' as i4;
import 'monthpicker.ng_deps.dart' as i5;
import 'yearpicker.ng_deps.dart' as i6;
export 'index.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(PopupContainer, new _ngRef.ReflectionInfo(
const [const Component(outputs: const ["update1"], selector: "popup-container"), const View(directives: const [NgClass, NgStyle, DatePicker, FORM_DIRECTIVES, CORE_DIRECTIVES], encapsulation: ViewEncapsulation.None, template: '''
    <ul class="dropdown-menu"
        style="display: block"
        [ng-style]="{top: top, left: left, display: display}"
        [ngClass]="classMap">
        <li>
             <datepicker (cupdate)="onUpdate(\$event)" *ngIf="popupComp" [(ngModel)]="popupComp.cd.model" [show-weeks]="true"></datepicker>
        </li>
        <li *ngIf="showButtonBar" style="padding:10px 9px 2px">
            <span class="btn-group pull-left">
                 <button type="button" class="btn btn-sm btn-info" (click)="select(\'today\')" ng-disabled="isDisabled(\'today\')">{{ currentText }}</button>
                 <button type="button" class="btn btn-sm btn-danger" (click)="select(null)">{{ clearText }}</button>
            </span>
            <button type="button" class="btn btn-sm btn-success pull-right" (click)="close()">{{ closeText }}</button>
        </li>
    </ul>'''), _templates.HostPopupContainerTemplate],
const [const [ElementRef], const [PopupOptions]],
(ElementRef element, PopupOptions options) => new PopupContainer(element, options))
)
..registerType(DatePickerPopup, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"(cupdate)" : "onUpdate1(\$event)"}, inputs: const ["datepickerPopup", "isOpen"], selector: "[datepicker-popup][ngModel]")],
const [const [NgModel, const Self()], const [ElementRef], const [Renderer], const [DynamicComponentLoader]],
(NgModel cd, ElementRef element, Renderer renderer, DynamicComponentLoader loader) => new DatePickerPopup(cd, element, renderer, loader),
const [OnInit])
)
..registerType(DatePicker, new _ngRef.ReflectionInfo(
const [const Component(directives: const [DatePickerInner, DayPicker, MonthPicker, YearPicker, FORM_DIRECTIVES, CORE_DIRECTIVES], inputs: const ["datepickerMode", "minDate", "maxDate", "dateDisabled", "activeDate", "showWeeks", "startingDay", "initDate", "minMode", "maxMode", "formatDay", "formatMonth", "formatYear", "formatDayHeader", "formatDayTitle", "formatMonthTitle", "yearRange", "shortcutPropagation"], selector: "n2s-datepicker", template: '''
    <n2s-datepicker-inner [activeDate]="activeDate"
                      (update)="onUpdate(\$event)"
                      [datepicker-mode]="datepickerMode"
                      [initDate]="initDate"
                      [minDate]="minDate"
                      [maxDate]="maxDate"
                      [minDode]="minMode"
                      [maxDode]="maxMode"
                      [showDeeks]="showWeeks"
                      [formatDay]="formatDay"
                      [formatMonth]="formatMonth"
                      [formatYear]="formatYear"
                      [formatDayHeader]="formatDayHeader"
                      [formatDayTitle]="formatDayTitle"
                      [formatMonthTitle]="formatMonthTitle"
                      [startingDay]="startingDay"
                      [yearRange]="yearRange"
                      [customClass]="customClass"
                      [dateDisabled]="dateDisabled"
                      [templateUrl]="templateUrl"
                      [shortcutPropagation]="shortcutPropagation">
      <n2s-daypicker tabindex="0"></n2s-daypicker>
      <n2s-monthpicker tabindex="0"></n2s-monthpicker>
      <n2s-yearpicker tabindex="0"></n2s-yearpicker>
    </n2s-datepicker-inner>
    '''), _templates.HostDatePickerTemplate],
const [const [NgModel], const [Renderer], const [ElementRef]],
(NgModel cd, Renderer renderer, ElementRef elementRef) => new DatePicker(cd, renderer, elementRef))
)
..registerGetters({'update1': (o) => o.update1})
..registerSetters({'datepickerPopup': (o, v) => o.datepickerPopup = v, 'isOpen': (o, v) => o.isOpen = v, 'datepickerMode': (o, v) => o.datepickerMode = v, 'minDate': (o, v) => o.minDate = v, 'maxDate': (o, v) => o.maxDate = v, 'dateDisabled': (o, v) => o.dateDisabled = v, 'activeDate': (o, v) => o.activeDate = v, 'showWeeks': (o, v) => o.showWeeks = v, 'startingDay': (o, v) => o.startingDay = v, 'initDate': (o, v) => o.initDate = v, 'minMode': (o, v) => o.minMode = v, 'maxMode': (o, v) => o.maxMode = v, 'formatDay': (o, v) => o.formatDay = v, 'formatMonth': (o, v) => o.formatMonth = v, 'formatYear': (o, v) => o.formatYear = v, 'formatDayHeader': (o, v) => o.formatDayHeader = v, 'formatDayTitle': (o, v) => o.formatDayTitle = v, 'formatMonthTitle': (o, v) => o.formatMonthTitle = v, 'yearRange': (o, v) => o.yearRange = v, 'shortcutPropagation': (o, v) => o.shortcutPropagation = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}
