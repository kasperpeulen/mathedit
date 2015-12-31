import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:firebase/firebase.dart';
import 'dart:html';
import 'package:usage/usage.dart';

@Injectable()
class UserService {
  final Firebase _firebase;
  final Router _router;
  final Analytics _analytics;

  UserService(this._firebase, this._router, this._analytics);

  void login() {
    _analytics.sendEvent('login', 'true');
    _firebase.authWithOAuthRedirect('github', scope: 'gist');
  }

  void logout() {
    _analytics.sendEvent('logout', 'true');
    _firebase.unauth();
    _router.navigate(['Home']);
    window.location.reload();
  }
}
