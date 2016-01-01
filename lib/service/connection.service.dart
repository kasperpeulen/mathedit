import 'package:angular2/angular2.dart';
import 'dart:html';

@Injectable()
class ConnectionService {
  bool get isOnLine => window.navigator.onLine;

  bool get isOffline => !isOnLine;
}
