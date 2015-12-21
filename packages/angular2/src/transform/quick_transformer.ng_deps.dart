library angular2.src.transform.quick_transformer.ng_deps.dart;

import 'quick_transformer.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:barback/barback.dart';
import 'package:dart_style/dart_style.dart';
import 'common/formatter.dart' as formatter;
import 'common/options.dart';
import 'common/options_reader.dart';
import 'deferred_rewriter/transformer.dart';
import 'inliner_for_test/transformer.dart';
import 'reflection_remover/transformer.dart';
import 'common/formatter.ng_deps.dart' as i0;
import 'common/options.ng_deps.dart' as i1;
import 'common/options_reader.ng_deps.dart' as i2;
import 'deferred_rewriter/transformer.ng_deps.dart' as i3;
import 'inliner_for_test/transformer.ng_deps.dart' as i4;
import 'reflection_remover/transformer.ng_deps.dart' as i5;
export 'quick_transformer.dart';
export 'common/options.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
}
