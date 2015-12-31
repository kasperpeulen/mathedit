import 'gist.service.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:github/browser.dart';
import 'dart:async';
import 'package:angular2/router.dart';
import 'package:usage/usage.dart';
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'package:angular2/router.ng_deps.dart' as i1;
export 'gist.service.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(MyGistsService, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [GitHub], const [Authentication], const [Router], const [Analytics]],
(GitHub github, Authentication _auth, Router _router, Analytics _analytics) => new MyGistsService(github, _auth, _router, _analytics))
)
;
i0.initReflector();
i1.initReflector();
}
