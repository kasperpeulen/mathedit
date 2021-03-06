import 'dart:async';

import 'package:angular2/angular2.dart';
import 'package:github/browser.dart';
import 'package:mathedit/service/editor.service.dart';
import 'package:mathedit/service/gist.service.dart';
import 'package:mathedit/service/user.service.dart';
import 'package:ng2_strap/index.dart';
import 'package:mathedit/service/connection.service.dart';

@Component(
    selector: 'login',
    templateUrl: 'login.component.html',
    directives: const [
      CORE_DIRECTIVES,
      FORM_DIRECTIVES,
      DROPDOWN_DIRECTIVES,
      TOOLTIP_DIRECTIVES
    ],
    styleUrls: const ['login.component.css'],
    encapsulation: ViewEncapsulation.None)
class LoginComponent {
  final Authentication _auth;
  final MyGistsService _gistsService;
  final EditorService _editor;
  final UserService _userService;
  final ConnectionService _connection;

  LoginComponent(this._userService, this._auth, this._gistsService,
      this._editor, this._connection);

  bool get loggedIn => _auth.isAnonymous ? false : true;

  bool get offline => _connection.isOffline;

  String get saveAsGist =>
      _auth.isAnonymous ? 'Save as anonymous Gist' : 'Save as Gist';

  Future login() async {
    await _userService.login();
  }

  Future logout() async {
    await _userService.logout();
  }

  void save([bool public = true]) {
    _gistsService.saveGist(_editor.value, public: public);
  }
}
