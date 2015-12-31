import 'login.component.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:ng2_strap/index.dart';
import 'package:github/browser.dart';
import 'package:mathedit/service/gist.service.dart';
import 'package:mathedit/service/editor.service.dart';
import 'package:mathedit/service/user.service.dart';
import 'dart:async';
import 'dart:html';
import 'login.component.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'package:ng2_strap/index.ng_deps.dart' as i1;
import 'package:mathedit/service/gist.service.ng_deps.dart' as i2;
import 'package:mathedit/service/editor.service.ng_deps.dart' as i3;
import 'package:mathedit/service/user.service.ng_deps.dart' as i4;
export 'login.component.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(LoginComponent, new _ngRef.ReflectionInfo(
const [const Component(directives: const [CORE_DIRECTIVES, FORM_DIRECTIVES, DROPDOWN_DIRECTIVES], selector: 'login', styleUrls: const ['login.component.css'], templateUrl: 'login.component.html'), _templates.HostLoginComponentTemplate],
const [const [UserService], const [Authentication], const [MyGistsService], const [EditorService]],
(UserService _userService, Authentication _auth, MyGistsService _gistsService, EditorService _editor) => new LoginComponent(_userService, _auth, _gistsService, _editor),
const [],
const {
'dropdown': const [const ViewChild(Dropdown)]})
)
..registerSetters({'dropdown': (o, v) => o.dropdown = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
