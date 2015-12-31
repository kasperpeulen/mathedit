import 'package:js/js.dart';

@JS('Object.defineProperty')
external void defineProperty(dynamic o, String prop, Description description);

dynamic setValue(dynamic o, String key, dynamic value) =>
    defineProperty(o, key, new Description(value: value, enumerable: true));

@JS('JSON.stringify')
external String stringify(Object a);

@JS()
@anonymous
class Description {
  external factory Description({bool configurable, bool enumerable, value});
}
