import 'datepicker-inner.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'date-formatter.dart' show DateFormatter;
import 'package:node_shims/js.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'datepicker-inner.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'datepicker-inner.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(DatePickerInner, new _ngRef.ReflectionInfo(
const [const Component(inputs: const ["activeDate", "datepickerMode", "initDate", "minDate", "maxDate", "minMode", "maxMode", "showWeeks", "formatDay", "formatMonth", "formatYear", "formatDayHeader", "formatDayTitle", "formatMonthTitle", "startingDay", "yearRange", "shortcutPropagation", "customClass", "dateDisabled", "templateUrl"], outputs: const ["update"], selector: "n2s-datepicker-inner"), const View(directives: const [FORM_DIRECTIVES, CORE_DIRECTIVES, NgClass, NgModel], template: '''
<div [hidden]="datepickerMode == null" class="well well-sm bg-faded p-a card" role="application" ><!--&lt;!&ndash;ng-keydown="keydown(\$event)"&ndash;&gt;-->
  <ng-content></ng-content>
</div>
  '''), _templates.HostDatePickerInnerTemplate],
const [],
() => new DatePickerInner(),
const [OnInit])
)
..registerGetters({'update': (o) => o.update})
..registerSetters({'activeDate': (o, v) => o.activeDate = v, 'datepickerMode': (o, v) => o.datepickerMode = v, 'initDate': (o, v) => o.initDate = v, 'minDate': (o, v) => o.minDate = v, 'maxDate': (o, v) => o.maxDate = v, 'minMode': (o, v) => o.minMode = v, 'maxMode': (o, v) => o.maxMode = v, 'showWeeks': (o, v) => o.showWeeks = v, 'formatDay': (o, v) => o.formatDay = v, 'formatMonth': (o, v) => o.formatMonth = v, 'formatYear': (o, v) => o.formatYear = v, 'formatDayHeader': (o, v) => o.formatDayHeader = v, 'formatDayTitle': (o, v) => o.formatDayTitle = v, 'formatMonthTitle': (o, v) => o.formatMonthTitle = v, 'startingDay': (o, v) => o.startingDay = v, 'yearRange': (o, v) => o.yearRange = v, 'shortcutPropagation': (o, v) => o.shortcutPropagation = v, 'customClass': (o, v) => o.customClass = v, 'dateDisabled': (o, v) => o.dateDisabled = v, 'templateUrl': (o, v) => o.templateUrl = v})
;
i0.initReflector();
}
