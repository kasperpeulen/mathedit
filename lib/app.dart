import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:mathedit/components/math_edit.component/math_edit.component.dart';
import 'package:usage/usage.dart';
import 'dart:html';
import 'package:mathedit/service/gist.service.dart';
import 'package:github/browser.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    directives: const [ROUTER_DIRECTIVES],
    encapsulation: ViewEncapsulation.None,
    styleUrls: const ['app.css'])
@RouteConfig(const [
  const Route(path: '/gist/:gistid', name: 'Gist', component: MathEditComponent),
  const Route(path: '', name: 'Home', component: MathEditComponent)
])
class AppComponent {
  final Analytics ga;

  AppComponent(this.ga) {
    ga.sendScreenView(window.location.pathname);
  }


}
