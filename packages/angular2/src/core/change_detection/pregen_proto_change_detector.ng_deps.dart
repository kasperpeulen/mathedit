library angular2.src.change_detection.pregen_proto_change_detector.ng_deps.dart;

import 'pregen_proto_change_detector.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/change_detection/interfaces.dart';
import 'package:angular2/src/facade/lang.dart' show looseIdentical;
import 'package:angular2/src/core/change_detection/interfaces.ng_deps.dart' as i0;
import 'package:angular2/src/core/change_detection/abstract_change_detector.ng_deps.dart' as i1;
import 'package:angular2/src/core/change_detection/change_detection.ng_deps.dart' as i2;
import 'package:angular2/src/core/change_detection/constants.ng_deps.dart' as i3;
import 'package:angular2/src/core/change_detection/directive_record.ng_deps.dart' as i4;
import 'package:angular2/src/core/change_detection/pipes.ng_deps.dart' as i5;
import 'package:angular2/src/core/change_detection/proto_record.ng_deps.dart' as i6;
import 'package:angular2/src/core/change_detection/change_detection_util.ng_deps.dart' as i7;
export 'pregen_proto_change_detector.dart';
export 'dart:core' show List;
export 'package:angular2/src/core/change_detection/abstract_change_detector.dart' show AbstractChangeDetector;
export 'package:angular2/src/core/change_detection/change_detection.dart' show ChangeDetectionStrategy;
export 'package:angular2/src/core/change_detection/constants.dart' show ChangeDetectorState;
export 'package:angular2/src/core/change_detection/directive_record.dart' show DirectiveIndex, DirectiveRecord;
export 'package:angular2/src/core/change_detection/interfaces.dart' show ChangeDetector, ChangeDetectorDefinition, ProtoChangeDetector;
export 'package:angular2/src/core/change_detection/pipes.dart' show Pipes;
export 'package:angular2/src/core/change_detection/proto_record.dart' show ProtoRecord;
export 'package:angular2/src/core/change_detection/change_detection_util.dart' show ChangeDetectionUtil;
export 'package:angular2/src/facade/lang.dart' show assertionsEnabled, looseIdentical;
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
i7.initReflector();
}
