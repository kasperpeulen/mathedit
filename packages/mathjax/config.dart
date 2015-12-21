library mathjax.config;

import 'package:js/js.dart';

@anonymous
@JS()
class ConfigOptions {
  /// A comma-separated list of input and output jax to initialize at startup.
  /// Their main code is loaded only when they are actually used, so it is not
  /// inefficient to include jax that may not actually be used on the page.
  /// These are found in the `MathJax/jax` directory.
  external TeX2Jax get tex2jax;

  /// A comma-separated list of extensions to load at startup. The default
  /// directory is MathJax/extensions. The tex2jax and mml2jax preprocessors can
  /// be listed here, as well as a FontWarnings extension that you can use to
  /// inform your user that mathematics fonts are available that they can
  /// download to improve their experience of your site.
  external List<String> get jax;
  external List<String> get extensions;
  external List<String> get config;
  external List<String> get styleSheets;
  external Map<String, String> get styles;
  external get preJax;
  external get postJax;
  external get preRemoveClass;
  external get showProcessingMessages;
  external get messageStyle;
  external get displayAlign;
  external get displayIndent;
  external get delayStartupUntil;
  external get skipStartupTypeset;
  external get elements;
  external get positionToHash;
  external get showMathMenu;
  external get showMathMenuMSIE;
  external get menuSettings;
  external get errorSettings;
  external get ignoreMMLattributes;
  external get TeX;
  external factory ConfigOptions(
      {tex2jax,
      jax,
      extensions,
      config,
      styleSheets,
      styles,
      preJax,
      postJax,
      preRemoveClass,
      showProcessingMessages,
      messageStyle,
      displayAlign,
      displayIndent,
      delayStartupUntil,
      skipStartupTypeset,
      elements,
      positionToHash,
      showMathMenu,
      showMathMenuMSIE,
      menuSettings,
      errorSettings,
      ignoreMMLattributes,
      TeX
      });
}

@anonymous
@JS()
class TeX2Jax {
  external List<List<String>> get inlineMath;
  external List<List<String>> get displayMath;
  external bool get balanceBraces;
  external bool get processEscapes;
  external bool get processRefs;
  external bool get processEnvironments;
  external String get preview;
  external List<String> get skipTags;
  external String get ignoreClass;
  external String get processClass;

  external factory TeX2Jax(
      {List<List<String>> inlineMath,
      List<List<String>> displayMath,
      bool balanceBraces,
      bool processEscapes,
      bool processRefs,
      bool processEnvironments,
      String preview,
      List<String> skipTags,
      String ignoreClass,
      String processClass});
}

@anonymous
@JS()
class TeX {
  external factory TeX({extensions});
}
