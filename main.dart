import 'main.ng_deps.dart' as ngStaticInit;import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/bootstrap_static.dart';
import 'package:mathedit/app.dart';
import 'package:mathjax/mathjax.dart';
import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/jsinterop.dart';
import 'package:github/browser.dart';
import 'package:usage/usage_html.dart';
import 'package:mathedit/service/gist.service.dart';
import 'package:mathedit/helpers/local_storage.dart';

void main() {
  bootstrapStatic(AppComponent, [ROUTER_PROVIDERS, provide(LocationStrategy, useClass: HashLocationStrategy), provide(Authentication, useValue: getAuth()), provide(GitHub, useFactory: (Authentication auth) => createGitHubClient(auth: auth), deps: [Authentication]), provide(MyGistsService, useFactory: (GitHub gitHub) => new MyGistsService(gitHub), deps: [GitHub]), provide(Options, useValue: new Options(texMathDollars: true, texMathSingleBackslash: true)), provide(HtmlWriter, useFactory: (options) => new HtmlWriter(options), deps: [Options]), provide(CommonMarkParser, useFactory: (options) => new CommonMarkParser(options), deps: [Options]), provide(Analytics, useValue: new AnalyticsHtml('UA-40648110-6', 'MathEdit', '0.1.0'))], () { ngStaticInit.initReflector(); });
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

Authentication getAuth() {
  final username = store['username'];
  final password = store['password'];
  if (store['username'] != null) {
    return new Authentication.basic(username, password);
  } else {
    return new Authentication.anonymous();
  }
}