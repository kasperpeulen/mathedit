import 'user.service.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:firebase/firebase.dart';
import 'dart:html';
import 'package:usage/usage.dart';
import 'package:angular2/router.ng_deps.dart' as i0;
import 'package:angular2/angular2.ng_deps.dart' as i1;
export 'user.service.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(UserService, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Firebase], const [Router], const [Analytics]],
(Firebase _firebase, Router _router, Analytics _analytics) => new UserService(_firebase, _router, _analytics))
)
;
i0.initReflector();
i1.initReflector();
}
