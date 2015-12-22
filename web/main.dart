import 'package:angular2/bootstrap.dart';
import 'package:angular2/angular2.dart';
import 'package:mathedit/app.dart';
import 'package:mathjax/mathjax.dart';
import 'package:mathjax/config.dart';
import 'dart:async';
import 'package:mathedit/helpers/jsinterop.dart';

main() {
//  enableProdMode();
  bootstrap(AppComponent);
  var configOptions = new ConfigOptions(showProcessingMessages: false,
      messageStyle: "none",
      skipStartupTypeset: true,
      extensions: ["tex2jax.js"],
      jax: ["input/TeX", "output/HTML-CSS"],
      tex2jax: new TeX2Jax(inlineMath: [ [r"$", r"$"], [r"\(", r"\)"]],
          displayMath: [ [r'$$', r'$$'], [r'\[', r'\]']],
          processClass: "preview"),
      TeX: new TeX(extensions: ['noErrors.js', 'noUndefined.js']));
  setValue(configOptions, 'HTML-CSS', new HtmlCss(preferredFont: 'TeX', availableFonts: ['TeX']));

  MathJax.Hub.Config(configOptions);
  MathJax.Hub.Configured();
}

