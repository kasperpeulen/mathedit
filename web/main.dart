import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/bootstrap.dart';
import 'package:mathedit/app.dart';
import 'package:mathjax/mathjax.dart';
import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/jsinterop.dart';
import 'package:github/browser.dart';
import 'package:usage/usage_html.dart';
import 'package:mathedit/service/gist.service.dart';

void main() {
  bootstrap(AppComponent, [
    // router
    ROUTER_PROVIDERS,
    provide(LocationStrategy, useClass: HashLocationStrategy),

    // github
    provide(GitHub, useValue: createGitHubClient()),
    provide(MyGistsService,
        useFactory: (GitHub gitHub) => new MyGistsService(gitHub),
        deps: [GitHub]),

    // common mark
    provide(Options,
        useValue:
            new Options(texMathDollars: true, texMathSingleBackslash: true)),
    provide(HtmlWriter,
        useFactory: (options) => new HtmlWriter(options), deps: [Options]),
    provide(CommonMarkParser,
        useFactory: (options) => new CommonMarkParser(options),
        deps: [Options]),

    // analytics
    provide(Analytics,
        useValue: new AnalyticsHtml('UA-40648110-6', 'MathEdit', '0.1.0'))
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
