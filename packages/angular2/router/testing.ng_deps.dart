library angular2.router.testing.ng_deps.dart;

import 'testing.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/mock/mock_location_strategy.ng_deps.dart' as i0;
import 'package:angular2/src/mock/location_mock.ng_deps.dart' as i1;
export 'testing.dart';
export 'package:angular2/src/mock/mock_location_strategy.dart';
export 'package:angular2/src/mock/location_mock.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
}
