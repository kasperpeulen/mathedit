library angular2.testing_internal.ng_deps.dart;

import 'testing_internal.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'src/testing/testing_internal.ng_deps.dart' as i0;
import 'src/testing/test_component_builder.ng_deps.dart' as i1;
import 'src/testing/test_injector.ng_deps.dart' as i2;
import 'src/testing/fake_async.ng_deps.dart' as i3;
import 'src/testing/utils.ng_deps.dart' as i4;
export 'testing_internal.dart';
export 'src/testing/testing_internal.dart';
export 'src/testing/test_component_builder.dart';
export 'src/testing/test_injector.dart';
export 'src/testing/fake_async.dart';
export 'src/testing/utils.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
