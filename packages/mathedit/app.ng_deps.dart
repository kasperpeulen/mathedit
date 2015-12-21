import 'app.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:mathedit/components/editor_component/editor_component.dart';
import 'package:mathedit/components/preview_component/preview_component.dart';
import 'dart:async';
import 'package:mathjax/mathjax.dart';
import 'dart:html';
import 'dart:js';
import 'package:md_proc/md_proc.dart';
import 'app.template.dart' as _templates;
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'package:mathedit/components/editor_component/editor_component.ng_deps.dart' as i1;
import 'package:mathedit/components/preview_component/preview_component.ng_deps.dart' as i2;
export 'app.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(AppComponent, new _ngRef.ReflectionInfo(
const [const Component(directives: const [EditorComponent, PreviewComponent], encapsulation: ViewEncapsulation.None, selector: 'app', styleUrls: const ['app.css'], templateUrl: 'app.html'), _templates.HostAppComponentTemplate],
const [const [ElementRef]],
(ElementRef ref) => new AppComponent(ref))
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
