library angular2.src.services.url_resolver.ng_deps.dart;

import 'url_resolver.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable, Inject, Provider;
import 'package:angular2/src/facade/lang.dart' show isPresent, StringWrapper;
import 'package:angular2/src/core/application_tokens.dart' show PACKAGE_ROOT_URL;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/core/application_tokens.ng_deps.dart' as i1;
export 'url_resolver.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(UrlResolver, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [String, const Inject(PACKAGE_ROOT_URL)]],
(String _packagePrefix) => new UrlResolver(_packagePrefix))
)
;
i0.initReflector();
i1.initReflector();
}
