library angular2.testing.ng_deps.dart;

import 'testing.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'src/testing/test_component_builder.ng_deps.dart' as i0;
import 'src/testing/test_injector.ng_deps.dart' as i1;
import 'src/testing/fake_async.ng_deps.dart' as i2;
import 'package:angular2/src/mock/view_resolver_mock.ng_deps.dart' as i3;
import 'package:angular2/src/compiler/xhr_mock.ng_deps.dart' as i4;
import 'package:angular2/src/mock/ng_zone_mock.ng_deps.dart' as i5;
import 'package:angular2/src/mock/mock_application_ref.ng_deps.dart' as i6;
import 'package:angular2/src/mock/directive_resolver_mock.ng_deps.dart' as i7;
export 'testing.dart';
export 'src/testing/testing.dart';
export 'src/testing/test_component_builder.dart' show ComponentFixture, TestComponentBuilder;
export 'src/testing/test_injector.dart';
export 'src/testing/fake_async.dart';
export 'package:angular2/src/mock/view_resolver_mock.dart' show MockViewResolver;
export 'package:angular2/src/compiler/xhr_mock.dart' show MockXHR;
export 'package:angular2/src/mock/ng_zone_mock.dart' show MockNgZone;
export 'package:angular2/src/mock/mock_application_ref.dart' show MockApplicationRef;
export 'package:angular2/src/mock/directive_resolver_mock.dart' show MockDirectiveResolver;
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
