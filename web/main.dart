import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:angular2/bootstrap.dart';
import 'package:mathedit/app.dart';
import 'package:mathjax/mathjax.dart';
import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/jsinterop.dart';
import 'package:github/browser.dart';
import 'package:firebase/firebase.dart';
import 'package:usage/usage_html.dart';
import 'package:mathedit/service/gist.service.dart';
import 'dart:async';
import 'package:event_bus/event_bus.dart';
import 'package:mathedit/service/editor.service.dart';
import 'dart:html';
import 'package:mathedit/service/user.service.dart';

main() async {
  final firebase = new Firebase('http://mathedit.firebaseio.com/');

  bootstrap(AppComponent, [
    // router
    ROUTER_PROVIDERS,
    provide(LocationStrategy, useClass: HashLocationStrategy),

    // firebase
    provide(Firebase, useValue: firebase),

    // github
    provide(Authentication, useValue: await bootstrapAuth(firebase)),
    provide(GitHub,
        useFactory: (Authentication auth) => createGitHubClient(auth: auth),
        deps: [Authentication]),
    provide(MyGistsService, useClass: MyGistsService),

    // storage
    provide(Storage, useValue: window.localStorage),

    // users
    provide(UserService, useClass: UserService),

    // events
    provide(EventBus, useValue: new EventBus()),

    // editor
    provide(EditorService, useClass: EditorService),

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
        useValue: new AnalyticsHtml('UA-40648110-6', 'MathEdit', '0.1.0')..optIn = true)
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
      TeX: new TeX(extensions: [
        "AMSmath.js",
        "AMSsymbols.js",
        "noErrors.js",
        "noUndefined.js"
      ]));
  setValue(configOptions, 'HTML-CSS',
      new HtmlCss(preferredFont: 'TeX', availableFonts: ['TeX']));

  MathJax.Hub.Config(configOptions);
  MathJax.Hub.Configured();
}

Future<Authentication> bootstrapAuth(firebase) {
  Completer<Authentication> completer = new Completer();
  firebase.onAuth().listen((authJson) async {
    if (authJson != null && authJson['provider'] == 'github') {
      final accessToken = authJson['github']['accessToken'];
      final auth = new Authentication.withToken(accessToken);
      completer.complete(auth);
    } else {
      completer.complete(new Authentication.anonymous());
    }
  });
  return completer.future;
}
