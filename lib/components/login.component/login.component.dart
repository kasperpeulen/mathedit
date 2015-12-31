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
  bool disabled = false;
  Map status = {"isopen": false};

  Firebase firebase;

  Authentication auth;
  final Router router;
  final MyGistsService _gistsService;
  final EditorService _editor;

  LoginComponent(this.auth, this.firebase, this.router, this._gistsService, this._editor);
  List<String> items = [
    "The first choice!",
    "And another choice for you.",
    "but wait! A third!"
  ];

  bool get loggedIn {
    if (auth.isAnonymous) {
      return false;
    }
    return true;
  }

  void login() {
    firebase.authWithOAuthRedirect('github', scope: 'gist');
  }

  void logout() {
    firebase.unauth();
    router.navigate(['Home']);
    window.location.reload();
  }

  void toggled(bool open) {
    print("Dropdown is now: $open");
  }

  void save() {
    _gistsService.saveGist(_editor.value);
  }

  void toggleDropdown(MouseEvent $event) {
    $event.preventDefault();
    $event.stopPropagation();
    this.status['isopen'] = !this.status['isopen'];
  }
}