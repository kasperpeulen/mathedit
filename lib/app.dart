import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:mathedit/components/login.component/login.component.dart';
import 'package:mathedit/components/math_edit.component/math_edit.component.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    directives: const [ROUTER_DIRECTIVES, LoginComponent, CORE_DIRECTIVES],
    encapsulation: ViewEncapsulation.None,
    styleUrls: const ['app.css'])
@RouteConfig(const [
  const Route(
      path: '/gist/:gistid', name: 'Gist', component: MathEditComponent),
  const Route(path: '', name: 'Home', component: MathEditComponent)
])
class AppComponent {}
