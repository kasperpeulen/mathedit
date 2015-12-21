library angular2.transform.directive_metadata_linker.linker.ng_deps.dart;

import 'ng_meta_linker.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'dart:convert';
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/logging.dart';
import 'package:angular2/src/transform/common/names.dart';
import 'package:angular2/src/transform/common/ng_meta.dart';
import 'package:angular2/src/transform/common/url_resolver.dart';
import 'package:barback/barback.dart';
import 'ng_deps_linker.dart';
import 'package:angular2/src/transform/common/asset_reader.ng_deps.dart' as i0;
import 'package:angular2/src/transform/common/logging.ng_deps.dart' as i1;
import 'package:angular2/src/transform/common/ng_meta.ng_deps.dart' as i2;
import 'package:angular2/src/transform/common/url_resolver.ng_deps.dart' as i3;
import 'ng_deps_linker.ng_deps.dart' as i4;
export 'ng_meta_linker.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
