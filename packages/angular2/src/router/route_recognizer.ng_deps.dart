library angular2.src.router.route_recognizer.ng_deps.dart;

import 'route_recognizer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show isPresent, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/src/facade/promise.dart' show PromiseWrapper, Future;
import 'package:angular2/src/facade/collection.dart' show Map;
import 'route_handler.dart' show RouteHandler;
import 'url_parser.dart' show Url;
import 'instruction.dart' show ComponentInstruction;
import 'path_recognizer.dart' show PathRecognizer;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'route_handler.ng_deps.dart' as i1;
import 'url_parser.ng_deps.dart' as i2;
import 'instruction.ng_deps.dart' as i3;
import 'path_recognizer.ng_deps.dart' as i4;
export 'route_recognizer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
