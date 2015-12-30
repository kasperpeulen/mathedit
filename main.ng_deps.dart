import 'main.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/bootstrap_static.dart';
import 'package:mathedit/app.dart';
import 'package:mathjax/mathjax.dart';
import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/jsinterop.dart';
import 'package:github/browser.dart';
import 'package:usage/usage_html.dart';
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'package:angular2/router.ng_deps.dart' as i1;
import 'package:angular2/bootstrap_static.ng_deps.dart' as i2;
import 'package:mathedit/app.ng_deps.dart' as i3;
import 'package:mathedit/helpers/jsinterop.ng_deps.dart' as i4;
export 'main.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
