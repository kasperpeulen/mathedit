import 'app.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:mathedit/components/math_edit.component/math_edit.component.dart';
import 'package:usage/usage.dart';
import 'dart:html';
import 'package:mathedit/service/gist.service.dart';
import 'package:github/browser.dart';
import 'app.template.dart' as _templates;
import 'package:angular2/router.ng_deps.dart' as i0;
import 'package:angular2/angular2.ng_deps.dart' as i1;
import 'package:mathedit/components/math_edit.component/math_edit.component.ng_deps.dart' as i2;
import 'package:mathedit/service/gist.service.ng_deps.dart' as i3;
export 'app.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(AppComponent, new _ngRef.ReflectionInfo(
const [const Component(directives: const [ROUTER_DIRECTIVES], encapsulation: ViewEncapsulation.None, selector: 'app', styleUrls: const ['app.css'], templateUrl: 'app.html'), const RouteConfig(const [const Route(path: '/gist/:gistid', name: 'Gist', component: MathEditComponent), const Route(path: '', name: 'Home', component: MathEditComponent)]), _templates.HostAppComponentTemplate],
const [const [Analytics]],
(Analytics ga) => new AppComponent(ga))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
