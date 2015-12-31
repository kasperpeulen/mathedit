import 'carousel.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import '../ng2-bootstrap-config.dart';
import 'package:node_shims/js.dart';
import 'dart:async';
import 'carousel.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
export 'carousel.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Carousel, new _ngRef.ReflectionInfo(
const [const Component(directives: const [CORE_DIRECTIVES, NgClass], inputs: const ["interval", "noTransition", "noPause", "noWrap"], selector: "n2s-carousel", template: '''
<div (mouseenter)="pause()" (mouseleave)="play()" class="carousel slide">
  <ol class="carousel-indicators" [hidden]="slides.length <= 1">
     <li *ngFor="#slidez of slides" [ngClass]="{active: slidez.active === true}" (click)="select(slidez)"></li>
  </ol>
  <div class="carousel-inner"><ng-content></ng-content></div>
</div>
  '''), _templates.HostCarouselTemplate],
const [],
() => new Carousel(),
const [OnDestroy])
)
..registerType(Slide, new _ngRef.ReflectionInfo(
const [const Component(directives: const [NgClass], host: const {"[class.active]" : "active", "[class.item]" : "true", "[class.carousel-item]" : "true"}, inputs: const ["direction", "active", "index"], selector: "n2s-slide", template: '''
  <div [ngClass]="{active: active}" class="item text-center">
    <ng-content></ng-content>
  </div>
  '''), _templates.HostSlideTemplate],
const [const [Carousel]],
(Carousel carousel) => new Slide(carousel),
const [OnInit, OnDestroy])
)
..registerSetters({'interval': (o, v) => o.interval = v, 'noTransition': (o, v) => o.noTransition = v, 'noPause': (o, v) => o.noPause = v, 'noWrap': (o, v) => o.noWrap = v, 'direction': (o, v) => o.direction = v, 'active': (o, v) => o.active = v, 'index': (o, v) => o.index = v})
;
i0.initReflector();
}
