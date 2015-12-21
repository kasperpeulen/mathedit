library angular2.src.router.path_recognizer.ng_deps.dart;

import 'path_recognizer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/facade/lang.dart' show RegExp, RegExpWrapper, RegExpMatcherWrapper, StringWrapper, isPresent, isBlank;
import 'package:angular2/src/facade/exceptions.dart' show BaseException, WrappedException;
import 'package:angular2/src/facade/collection.dart' show Map, MapWrapper, StringMapWrapper;
import 'url_parser.dart' show Url, RootUrl, serializeParams;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i0;
import 'url_parser.ng_deps.dart' as i1;
export 'path_recognizer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
