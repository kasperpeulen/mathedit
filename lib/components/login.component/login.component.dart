import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'dart:html';
import 'package:ng2_strap/index.dart';
import 'package:github/browser.dart';
import 'package:firebase/firebase.dart';
import 'package:mathedit/service/gist.service.dart';
import 'package:mathedit/service/editor.service.dart';
@Component(
    selector: 'login',
    templateUrl: 'login.component.html',
    directives: const [CORE_DIRECTIVES, DROPDOWN_DIRECTIVES],
    styleUrls: const ['login.component.css']
)
class LoginComponent {
  final Firebase _firebase;
  final Authentication _auth;
  final Router _router;
  final MyGistsService _gistsService;
  final EditorService _editor;

  LoginComponent(this._auth, this._firebase, this._router, this._gistsService, this._editor);

  bool get loggedIn {
    return _auth.isAnonymous ? false : true;
  }

  void login() {
    _firebase.authWithOAuthRedirect('github', scope: 'gist');
  }

  void logout() {
    _firebase.unauth();
    _router.navigate(['Home']);
    window.location.reload();
  }

  void save() {
    _gistsService.saveGist(_editor.value);
  }
}