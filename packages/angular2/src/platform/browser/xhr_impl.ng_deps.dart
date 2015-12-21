library angular2.src.services.xhr_impl.ng_deps.dart;

import 'xhr_impl.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async' show Future;
import 'dart:html' show HttpRequest;
import 'package:angular2/core.dart';
import 'package:angular2/src/compiler/xhr.dart';
import 'package:angular2/core.ng_deps.dart' as i0;
import 'package:angular2/src/compiler/xhr.ng_deps.dart' as i1;
export 'xhr_impl.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(XHRImpl, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new XHRImpl())
)
;
i0.initReflector();
i1.initReflector();
}
