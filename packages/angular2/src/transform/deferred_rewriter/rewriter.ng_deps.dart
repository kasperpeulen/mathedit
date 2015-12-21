library angular2.transform.deferred_rewriter.rewriter.ng_deps.dart;

import 'rewriter.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:analyzer/analyzer.dart';
import 'package:analyzer/src/generated/ast.dart';
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/names.dart';
import 'package:angular2/src/transform/common/url_resolver.dart';
import 'package:barback/barback.dart';
import 'package:quiver/iterables.dart' as it;
import 'package:angular2/src/transform/common/asset_reader.ng_deps.dart' as i0;
import 'package:angular2/src/transform/common/logging.ng_deps.dart' as i1;
import 'package:angular2/src/transform/common/url_resolver.ng_deps.dart' as i2;
export 'rewriter.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
