import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:firebase/firebase.dart';
import 'dart:html';

@Injectable()
class UserService {
  final Firebase _firebase;
  final Router _router;

  UserService(this._firebase, this._router);

  void login() {
    _firebase.authWithOAuthRedirect('github', scope: 'gist');
  }

  void logout() {
    _firebase.unauth();
    _router.navigate(['Home']);
    window.location.reload();
  }
}