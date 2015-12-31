import 'pagination.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'dart:html';
import 'dart:math';
import 'package:node_shims/js.dart';
import 'pagination.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'pagination.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Pagination, new _ngRef.ReflectionInfo(
const [const Component(directives: const [CORE_DIRECTIVES, NgClass], encapsulation: ViewEncapsulation.None, inputs: const ["rotate", "disabled", "totalItems", "itemsPerPage", "maxSize", "boundaryLinks", "directionLinks", "firstText", "previousText", "nextText", "lastText"], outputs: const ["numPages"], selector: "n2s-pagination", template: '''
  <ul class="pagination" [ngClass]="classMap">
    <li class="pagination-first"
        [ngClass]="{disabled: noPrevious()||disabled, hidden: !boundaryLinks}"
        [hidden]="!boundaryLinks">
      <a href (click)="selectPage(1, \$event)">{{firstText}}</a>
    </li>

    <li class="pagination-prev"
        [ngClass]="{disabled: noPrevious()||disabled, hidden: !directionLinks}"
        [hidden]="!directionLinks">
      <a href (click)="selectPage(page - 1, \$event)">{{previousText}}</a>
      </li>

    <li *ngFor="#page of pages" [ngClass]="{active: page['active'], disabled: disabled && !page['active']}" class="pagination-page">
      <a href (click)="selectPage(page['number'], \$event)">{{page['text']}}</a>
    </li>

    <li class="pagination-next"
        [ngClass]="{disabled: noNext()||disabled, hidden: !directionLinks}"
        [hidden]="!directionLinks">
      <a href (click)="selectPage(page + 1, \$event)">{{nextText}}</a></li>

    <li class="pagination-last"
        [ngClass]="{disabled: noNext()||disabled, hidden: !boundaryLinks}"
        [hidden]="!boundaryLinks">
      <a href (click)="selectPage(totalPages, \$event)">{{lastText}}</a></li>
  </ul>
  '''), _templates.HostPaginationTemplate],
const [const [NgModel], const [Renderer], const [ElementRef]],
(NgModel ngModel, Renderer renderer, ElementRef elementRef) => new Pagination(ngModel, renderer, elementRef),
const [OnInit])
)
..registerType(Pager, new _ngRef.ReflectionInfo(
const [const Component(inputs: const ["align", "totalItems", "itemsPerPage", "previousText", "nextText"], selector: "pager[ngModel], [pager][ngModel]"), const View(directives: const [NgClass], template: '''
<ul class="pager">
  <li [ngClass]="{disabled: noPrevious(), previous: align, \'pull-left\': align}"><a href (click)="selectPage(page - 1, \$event)">{{previousText}}</a></li>
  <li [ngClass]="{disabled: noNext(), next: align, \'pull-right\': align}"><a href (click)="selectPage(page + 1, \$event)">{{nextText}}</a></li>
</ul>
'''), _templates.HostPagerTemplate],
const [const [NgModel, const Self()], const [Renderer], const [ElementRef]],
(NgModel ngModel, Renderer renderer, ElementRef elementRef) => new Pager(ngModel, renderer, elementRef),
const [OnInit])
)
..registerGetters({'numPages': (o) => o.numPages})
..registerSetters({'rotate': (o, v) => o.rotate = v, 'disabled': (o, v) => o.disabled = v, 'totalItems': (o, v) => o.totalItems = v, 'itemsPerPage': (o, v) => o.itemsPerPage = v, 'maxSize': (o, v) => o.maxSize = v, 'boundaryLinks': (o, v) => o.boundaryLinks = v, 'directionLinks': (o, v) => o.directionLinks = v, 'firstText': (o, v) => o.firstText = v, 'previousText': (o, v) => o.previousText = v, 'nextText': (o, v) => o.nextText = v, 'lastText': (o, v) => o.lastText = v, 'align': (o, v) => o.align = v})
;
i0.initReflector();
}
