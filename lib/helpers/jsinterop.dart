import 'package:js/js.dart';

@JS()
@anonymous
class Description {
  external factory Description({bool configurable, bool enumerable, value});
}

@JS('JSON.stringify')
external String stringify(Object a);

@JS('Object.defineProperty')
external void defineProperty(o, String prop, Description description);

setValue(o, String key, value) =>
    defineProperty(o, key, new Description(value: value, enumerable: true));
