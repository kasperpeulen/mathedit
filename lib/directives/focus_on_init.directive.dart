import 'package:angular2/angular2.dart';
import 'dart:async';

@Directive(selector: '[focusOnInit]')
class FocusOnInitDirective implements AfterViewInit {
  final ElementRef ref;
  FocusOnInitDirective(this.ref);

  ngAfterViewInit() async {
    Timer.run(() => ref.nativeElement.focus());
  }
}
