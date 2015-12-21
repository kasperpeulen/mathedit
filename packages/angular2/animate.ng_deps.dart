library angular2.animate.ng_deps.dart;

import 'animate.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'src/animate/animation.ng_deps.dart' as i0;
import 'src/animate/animation_builder.ng_deps.dart' as i1;
import 'src/animate/browser_details.ng_deps.dart' as i2;
import 'src/animate/css_animation_builder.ng_deps.dart' as i3;
export 'animate.dart';
export 'src/animate/animation.dart' show Animation;
export 'src/animate/animation_builder.dart' show AnimationBuilder;
export 'src/animate/browser_details.dart' show BrowserDetails;
export 'src/animate/css_animation_builder.dart' show CssAnimationBuilder;
export 'src/animate/css_animation_options.dart' show CssAnimationOptions;
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
}
