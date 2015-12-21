library angular2.src.transform.common.logging.ng_deps.dart;

import 'logging.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:barback/barback.dart';
import 'package:source_span/source_span.dart';
import 'zone.dart' as zone show log;
import 'zone.ng_deps.dart' as i0;
export 'logging.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
}
