import 'rating.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'dart:html';
import 'package:node_shims/js.dart';
import 'rating.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'rating.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Rating, new _ngRef.ReflectionInfo(
const [const Component(directives: const [NgClass, NgFor], host: const {"(keydown)" : "onKeydown(\$event)"}, inputs: const ["max", "readonly", "titles", "stateOn", "stateOff", "ratingStates"], outputs: const ["onHover", "onLeave"], selector: "n2s-rating", template: '''
    <span (mouseleave)="reset()" (keydown)="onKeydown(\$event)" tabindex="0" role="slider" aria-valuemin="0" [attr.aria-valuemax]="range.length" [attr.aria-valuenow]="value">
      <template ngFor #r [ngForOf]="range" #index="index">
        <span class="sr-only">({{ index < value ? '*' : ' ' }})</span>
        <i (mouseenter)="enter(index + 1)" (click)="rate(index + 1)" class="glyphicon" [ngClass]="index < value ? r['stateOn'] : r['stateOff']" [title]="r['title']" ></i>
      </template>
    </span>
  '''), _templates.HostRatingTemplate],
const [const [NgModel], const [Renderer], const [ElementRef]],
(NgModel cd, Renderer renderer, ElementRef elementRef) => new Rating(cd, renderer, elementRef),
const [OnInit])
)
..registerGetters({'onHover': (o) => o.onHover, 'onLeave': (o) => o.onLeave})
..registerSetters({'max': (o, v) => o.max = v, 'readonly': (o, v) => o.readonly = v, 'titles': (o, v) => o.titles = v, 'stateOn': (o, v) => o.stateOn = v, 'stateOff': (o, v) => o.stateOff = v, 'ratingStates': (o, v) => o.ratingStates = v})
;
i0.initReflector();
}
