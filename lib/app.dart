import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:mathedit/components/math_edit.component/math_edit.component.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    directives: const [ROUTER_DIRECTIVES],
    encapsulation: ViewEncapsulation.None,
    styleUrls: const ['app.css'])
@RouteConfig( const [
  const Route(path: '/gist/:gistid', component: MathEditComponent),
  const Route(path: '', component: MathEditComponent)
])
class AppComponent {}
