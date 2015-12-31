/// <reference path="../../tsd.d.ts" />

import {
  Component, View, Host,
  EventEmitter,
  DefaultValueAccessor,
  ElementRef, ViewContainerRef,
  NgIf, NgClass, FORM_DIRECTIVES, CORE_DIRECTIVES,
  Self, NgModel, Renderer,
  QueryList, Query
} from 'angular2/angular2';

import * as moment from 'moment';

import {DatePickerInner} from './datepicker-inner';
import {DatePickerPopup} from './datepicker-popup';
import {DayPicker} from './daypicker';
import {MonthPicker} from './monthpicker';
import {YearPicker} from './yearpicker';

@Component({
  selector: 'datepicker[ngModel], [datepicker][ngModel]',
  properties: [
    'datepickerMode',
    'minDate', 'maxDate',
    'dateDisabled', 'activeDate',
    'showWeeks', 'startingDay',
    'initDate',
    'minMode', 'maxMode',
    'formatDay', 'formatMonth', 'formatYear',
    'formatDayHeader', 'formatDayTitle', 'formatMonthTitle',
    'yearRange',
    'shortcutPropagation'
  ]
})
@View({
  template: `
    <datepicker-inner [active-date]="activeDate"
                      (update)="onUpdate($event)"
                      [datepicker-mode]="datepickerMode"
                      [init-date]="initDate"
                      [min-date]="minDate"
                      [max-date]="maxDate"
                      [min-mode]="minMode"
                      [max-mode]="maxMode"
                      [show-weeks]="showWeeks"
                      [format-day]="formatDay"
                      [format-month]="formatMonth"
                      [format-year]="formatYear"
                      [format-day-header]="formatDayHeader"
                      [format-day-title]="formatDayTitle"
                      [format-month-title]="formatMonthTitle"
                      [starting-day]="startingDay"
                      [year-range]="yearRange"
                      [custom-class]="customClass"
                      [date-disabled]="dateDisabled"
                      [template-url]="templateUrl"
                      [shortcut-propagation]="shortcutPropagation">
      <daypicker tabindex="0"></daypicker>
      <monthpicker tabindex="0"></monthpicker>
      <yearpicker tabindex="0"></yearpicker>
    </datepicker-inner>
    `,
  directives: [DatePickerInner, DayPicker, MonthPicker, YearPicker, FORM_DIRECTIVES, CORE_DIRECTIVES]
})
export class DatePicker extends DefaultValueAccessor {
  private _activeDate:Date;
  private datepickerMode:string;
  private initDate:Date;
  private minDate:Date;
  private maxDate:Date;
  private minMode:string;
  private maxMode:string;
  private showWeeks:boolean;
  private formatDay:string;
  private formatMonth:string;
  private formatYear:string;
  private formatDayHeader:string;
  private formatDayTitle:string;
  private formatMonthTitle:string;
  private startingDay:number;
  private yearRange:number;
  private shortcutPropagation:boolean;
  // todo: change type during implementation
  private customClass:any;
  // todo: change type during implementation
  private dateDisabled:any;
  private templateUrl:string;

  constructor(@Self() cd:NgModel, renderer:Renderer, elementRef:ElementRef) {
    super(cd, renderer, elementRef);
  }

  public get activeDate():Date {
    return this._activeDate;
  }

  public set activeDate(value:Date) {
    this._activeDate = value;
    this.cd.viewToModelUpdate(moment(this.activeDate).toDate());
  }

  private onUpdate(event) {
    this.writeValue(event);
  }

  writeValue(value:any) {
    if (value) {
      if (typeof value !== 'Date') {
        value = new Date(value);
      }

      this.activeDate = value;
    }
  }
}
