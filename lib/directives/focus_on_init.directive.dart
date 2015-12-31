import 'dart:async';

import 'package:angular2/angular2.dart';

@Directive(selector: '[focusOnInit]')
class FocusOnInitDirective implements AfterViewInit {
  final ElementRef ref;
  FocusOnInitDirective(this.ref);

  Future<Null> ngAfterViewInit() async {
    Timer.run(() => ref.nativeElement.focus());
  }
}
