import 'package:angular2/angular2.dart';
import 'package:ng2_strap/index.dart';
import 'package:github/browser.dart';
import 'package:mathedit/service/gist.service.dart';
import 'package:mathedit/service/editor.service.dart';
import 'package:mathedit/service/user.service.dart';
import 'dart:async';

@Component(
    selector: 'login',
    templateUrl: 'login.component.html',
    directives: const [CORE_DIRECTIVES, FORM_DIRECTIVES, DROPDOWN_DIRECTIVES],
    styleUrls: const ['login.component.css'])
class LoginComponent {
  final Authentication _auth;
  final MyGistsService _gistsService;
  final EditorService _editor;
  final UserService _userService;

  LoginComponent(
      this._userService, this._auth, this._gistsService, this._editor);

  bool get loggedIn {
    return _auth.isAnonymous ? false : true;
  }

  bool secretGist;

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
