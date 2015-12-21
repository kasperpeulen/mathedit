library angular2.transform.reflection_remover.transformer.ng_deps.dart;

import 'transformer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'dart:async';
import 'package:barback/barback.dart';
import 'package:angular2/src/transform/common/asset_reader.dart';
import 'package:angular2/src/transform/common/mirror_mode.dart';
import 'package:angular2/src/transform/common/names.dart';
import 'package:angular2/src/transform/common/options.dart';
import 'package:angular2/src/transform/common/zone.dart' as zone;
import 'remove_reflection_capabilities.dart';
import 'package:angular2/src/transform/common/asset_reader.ng_deps.dart' as i0;
import 'package:angular2/src/transform/common/options.ng_deps.dart' as i1;
import 'package:angular2/src/transform/common/zone.ng_deps.dart' as i2;
import 'remove_reflection_capabilities.ng_deps.dart' as i3;
export 'transformer.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
