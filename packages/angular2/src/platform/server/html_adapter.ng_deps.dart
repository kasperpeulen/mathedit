library angular2.dom.htmlAdapter.ng_deps.dart;

import 'html_adapter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'abstract_html_adapter.dart';
import 'package:angular2/platform/common_dom.dart';
import 'dart:io';
import 'abstract_html_adapter.ng_deps.dart' as i0;
import 'package:angular2/platform/common_dom.ng_deps.dart' as i1;
export 'html_adapter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
