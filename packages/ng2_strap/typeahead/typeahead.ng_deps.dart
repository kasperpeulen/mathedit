import 'typeahead.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import '../ng2-bootstrap-config.dart';
import '../position.dart';
import 'dart:html';
import 'dart:async';
import 'package:node_shims/js.dart';
import 'typeahead.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
import '../position.ng_deps.dart' as i1;
export 'typeahead.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(TypeaheadContainer, new _ngRef.ReflectionInfo(
const [const Component(directives: const [CORE_DIRECTIVES], encapsulation: ViewEncapsulation.None, selector: "n2s-typeahead-dropdown", styles: const ['''
n2s-typeahead-dropdown {
  position: absolute;
}
'''], template: '''
  <ul class="dropdown-menu"
      [ng-style]="{top: top, left: left, display: display}"
      style="display: block">
    <li *ngFor="#match of matches"
        [ngClass]="{active: isActive(match) }"
        (mouseenter)="selectActive(match)">
        <a href="#" (click)="selectMatch(match, \$event)" tabindex="-1" [innerHtml]="hightlight(match, query)"></a>
    </li>
  </ul>
  '''), _templates.HostTypeaheadContainerTemplate],
const [const [ElementRef], const [TypeaheadOptions]],
(ElementRef element, TypeaheadOptions typeaheadOptions) => new TypeaheadContainer(element, typeaheadOptions))
)
..registerType(Typeahead, new _ngRef.ReflectionInfo(
const [const Component(directives: const [FORM_DIRECTIVES], inputs: const ['context', "source", "appendToBody", "editable", "focusFirst", "inputFormatter", "minLength", "selectOnExact", "templateUrl", "popupTemplateUrl", "waitMs", "optionsLimit", "selectOnBlur", "focusOnSelect", "optionField", "async"], outputs: const ["onLoading", "onNoResults", "onSelect"], selector: "n2s-typeahead", template: '<input type="text"[(ngModel)]="cd.model" (keyup)="onTypeaheadChange(\$event)" class="form-control">'), _templates.HostTypeaheadTemplate],
const [const [NgModel], const [Renderer], const [ElementRef], const [DynamicComponentLoader]],
(NgModel cd, Renderer renderer, ElementRef elementRef, DynamicComponentLoader loader) => new Typeahead(cd, renderer, elementRef, loader),
const [OnInit])
)
..registerGetters({'onLoading': (o) => o.onLoading, 'onNoResults': (o) => o.onNoResults, 'onSelect': (o) => o.onSelect})
..registerSetters({'context': (o, v) => o.context = v, 'source': (o, v) => o.source = v, 'appendToBody': (o, v) => o.appendToBody = v, 'editable': (o, v) => o.editable = v, 'focusFirst': (o, v) => o.focusFirst = v, 'inputFormatter': (o, v) => o.inputFormatter = v, 'minLength': (o, v) => o.minLength = v, 'selectOnExact': (o, v) => o.selectOnExact = v, 'templateUrl': (o, v) => o.templateUrl = v, 'popupTemplateUrl': (o, v) => o.popupTemplateUrl = v, 'waitMs': (o, v) => o.waitMs = v, 'optionsLimit': (o, v) => o.optionsLimit = v, 'selectOnBlur': (o, v) => o.selectOnBlur = v, 'focusOnSelect': (o, v) => o.focusOnSelect = v, 'optionField': (o, v) => o.optionField = v, 'async': (o, v) => o.async = v})
;
i0.initReflector();
i1.initReflector();
}
