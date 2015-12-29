import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/bootstrap.dart';
import 'package:mathedit/app.dart';
import 'package:mathjax/mathjax.dart';
import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/jsinterop.dart';
import 'package:github/browser.dart';
import 'package:js/js.dart';
void main() {
  // commonmark options
  ga('send', 'pageview');
  final options =
      new Options(texMathDollars: true, texMathSingleBackslash: true);
  final parser = new CommonMarkParser(options);
  var htmlWriter = new HtmlWriter(options);

  initGitHub();

  bootstrap(AppComponent, [
    ROUTER_PROVIDERS,
    provide(GitHub, useValue: new GitHub()),
    provide(GistsService,
        useFactory: (GitHub gitHub) => new GistsService(gitHub),
        deps: [GitHub]),
    provide(LocationStrategy, useClass: HashLocationStrategy),
    provide(CommonMarkParser, useValue: parser),
    provide(HtmlWriter, useValue: htmlWriter)
  ]);

  bootstrapMathjax();
}

void bootstrapMathjax() {
  final configOptions = new ConfigOptions(
      showProcessingMessages: false,
      messageStyle: "none",
      skipStartupTypeset: true,
      extensions: ["tex2jax.js"],
      jax: ["input/TeX", "output/HTML-CSS"],
      tex2jax: new TeX2Jax(inlineMath: [
        [r"$", r"$"],
        [r"\(", r"\)"]
      ], displayMath: [
        [r'$$', r'$$'],
        [r'\[', r'\]']
      ], processClass: "preview"),
      TeX: new TeX(extensions: ['noErrors.js', 'noUndefined.js']));
  setValue(configOptions, 'HTML-CSS',
      new HtmlCss(preferredFont: 'TeX', availableFonts: ['TeX']));

  MathJax.Hub.Config(configOptions);
  MathJax.Hub.Configured();
}

@JS('ga')
external Function get ga;

@JS('ga')
class Ga {
  external int get l;
  external set l(int l);
}
