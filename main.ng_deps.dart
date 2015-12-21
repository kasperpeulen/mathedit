import 'main.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/bootstrap_static.dart';
import 'package:mathedit/app.dart';
import 'package:mathjax/mathjax.dart';
import 'package:mathjax/config.dart';
import 'package:angular2/bootstrap_static.ng_deps.dart' as i0;
import 'package:mathedit/app.ng_deps.dart' as i1;
export 'main.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
