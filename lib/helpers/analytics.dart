import 'package:js/js.dart';

@JS('ga')
external Ga get ga;

class Analytics {
  Analytics(String trackingNumber) {
    ga.l = new DateTime.now().millisecondsSinceEpoch;
    create(trackingNumber, cookieDomain: 'auto');
  }

  create(String trackingId, {String cookieDomain, String name}) {
    ga('create', trackingId, cookieDomain, name);
  }

  send(String event) {
    ga('send', event);
  }
}

@JS('ga')
class Ga {
  external int get l;

  external set l(int l);

  external List get q;

  external set q(List q);
}
