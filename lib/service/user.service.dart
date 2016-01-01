import 'dart:async';
import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:firebase/firebase.dart';
import 'package:github/browser.dart';
import 'package:usage/usage.dart';

@Injectable()
class UserService {
  final Firebase _firebase;
  final Router _router;
  final Analytics _analytics;
  final GitHub _gitHub;

  CurrentUser _user;

  /// May be null.
  CurrentUser get user => _user;

  UserService(this._gitHub, this._firebase, this._router, this._analytics) {
    if (_gitHub.auth.isToken) {
      _gitHub.users.getCurrentUser().then((c) => _user = c);
    }
  }

  Future<Null> login() async {
    await _analytics.sendEvent('user', 'login');
    _firebase.authWithOAuthRedirect('github', scope: 'gist');
  }

  Future<Null> logout() async {
    await _analytics.sendEvent('user', 'logout');
    _firebase.unauth();
    await _router.navigate(['Home']);
    window.location.reload();
  }
}
