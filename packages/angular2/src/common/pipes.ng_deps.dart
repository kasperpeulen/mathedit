library angular2.src.common.pipes.ng_deps.dart;

import 'pipes.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'pipes/async_pipe.dart' show AsyncPipe;
import 'pipes/uppercase_pipe.dart' show UpperCasePipe;
import 'pipes/lowercase_pipe.dart' show LowerCasePipe;
import 'pipes/json_pipe.dart' show JsonPipe;
import 'pipes/slice_pipe.dart' show SlicePipe;
import 'pipes/date_pipe.dart' show DatePipe;
import 'pipes/number_pipe.dart' show DecimalPipe, PercentPipe, CurrencyPipe;
import 'pipes/async_pipe.ng_deps.dart' as i0;
import 'pipes/uppercase_pipe.ng_deps.dart' as i1;
import 'pipes/lowercase_pipe.ng_deps.dart' as i2;
import 'pipes/json_pipe.ng_deps.dart' as i3;
import 'pipes/slice_pipe.ng_deps.dart' as i4;
import 'pipes/date_pipe.ng_deps.dart' as i5;
import 'pipes/number_pipe.ng_deps.dart' as i6;
export 'pipes.dart';
export 'pipes/async_pipe.dart' show AsyncPipe;
export 'pipes/date_pipe.dart' show DatePipe;
export 'pipes/json_pipe.dart' show JsonPipe;
export 'pipes/slice_pipe.dart' show SlicePipe;
export 'pipes/lowercase_pipe.dart' show LowerCasePipe;
export 'pipes/number_pipe.dart' show NumberPipe, DecimalPipe, PercentPipe, CurrencyPipe;
export 'pipes/uppercase_pipe.dart' show UpperCasePipe;
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
