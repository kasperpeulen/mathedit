library angular2.src.common.pipes.common_pipes.ng_deps.dart;

import 'common_pipes.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'async_pipe.dart' show AsyncPipe;
import 'uppercase_pipe.dart' show UpperCasePipe;
import 'lowercase_pipe.dart' show LowerCasePipe;
import 'json_pipe.dart' show JsonPipe;
import 'slice_pipe.dart' show SlicePipe;
import 'date_pipe.dart' show DatePipe;
import 'number_pipe.dart' show DecimalPipe, PercentPipe, CurrencyPipe;
import 'async_pipe.ng_deps.dart' as i0;
import 'uppercase_pipe.ng_deps.dart' as i1;
import 'lowercase_pipe.ng_deps.dart' as i2;
import 'json_pipe.ng_deps.dart' as i3;
import 'slice_pipe.ng_deps.dart' as i4;
import 'date_pipe.ng_deps.dart' as i5;
import 'number_pipe.ng_deps.dart' as i6;
export 'common_pipes.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
i5.initReflector();
i6.initReflector();
}
