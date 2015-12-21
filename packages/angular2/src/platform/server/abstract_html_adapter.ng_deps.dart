library angular2.dom.abstractHtmlAdapter.ng_deps.dart;

import 'abstract_html_adapter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:html/parser.dart' as parser;
import 'package:html/dom.dart';
import 'package:angular2/platform/common_dom.dart';
import 'package:angular2/src/compiler/xhr.dart';
import 'package:angular2/src/facade/lang.dart' show isBlank, isPresent;
import 'package:angular2/platform/common_dom.ng_deps.dart' as i0;
import 'package:angular2/src/compiler/xhr.ng_deps.dart' as i1;
export 'abstract_html_adapter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
