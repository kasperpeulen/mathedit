import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:firebase/firebase.dart';
import 'dart:html';
import 'package:usage/usage.dart';
import 'dart:async';

@Injectable()
class UserService {
  final Firebase _firebase;
  final Router _router;
  final Analytics _analytics;

  UserService(this._firebase, this._router, this._analytics);

  Future<Null> login() async {
    await _analytics.sendEvent('user', 'login');
    _firebase.authWithOAuthRedirect('github', scope: 'gist');
  }

  Future<Null> logout() async {
    await _analytics.sendEvent('user', 'logout');
    _firebase.unauth();
    _router.navigate(['Home']);
    window.location.reload();
  }
}
