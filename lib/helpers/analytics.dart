import 'package:js/js.dart';

@JS('ga')
external Ga get ga;

@JS('ga')
class Ga {
  external int get l;

  external set l(int l);

  external List get q;

  external set q(List q);
}

class Analytics {
  Analytics(String trackingNumber) {
    ga.l = new DateTime.now().millisecondsSinceEpoch;
    ga('create', trackingNumber, 'auto');
  }

  send(String event) {
    ga('send', event);
  }
}
