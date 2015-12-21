library angular2.src.mock.animation_builder_mock.ng_deps.dart;

import 'animation_builder_mock.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/src/core/di.dart' show Injectable;
import 'package:angular2/src/animate/animation_builder.dart' show AnimationBuilder;
import 'package:angular2/src/animate/css_animation_builder.dart' show CssAnimationBuilder;
import 'package:angular2/src/animate/css_animation_options.dart' show CssAnimationOptions;
import 'package:angular2/src/animate/animation.dart' show Animation;
import 'package:angular2/src/animate/browser_details.dart' show BrowserDetails;
import 'package:angular2/src/core/di.ng_deps.dart' as i0;
import 'package:angular2/src/animate/animation_builder.ng_deps.dart' as i1;
import 'package:angular2/src/animate/css_animation_builder.ng_deps.dart' as i2;
import 'package:angular2/src/animate/animation.ng_deps.dart' as i3;
import 'package:angular2/src/animate/browser_details.ng_deps.dart' as i4;
export 'animation_builder_mock.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(MockAnimationBuilder, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [],
() => new MockAnimationBuilder())
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
