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
import 'dart:convert';
import 'package:mathedit/service/connection.service.dart';

bool get devMode => window.location.host.contains('localhost');

Future<Null> main() async {
  if (!devMode) {
    enableProdMode();
  }

  // ensure https in production
  if ((!devMode) && (window.location.protocol != "https:")) {
    window.location.protocol = "https";
    return;
  }

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

    // connection
    provide(ConnectionService, useClass: ConnectionService),

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
        useValue: new AnalyticsHtml('UA-40648110-6', 'MathEdit', '0.1.0')
          ..optIn = true)
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
      ], processClass: 'math'),
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

Future<Authentication> bootstrapAuth(Firebase firebase) {
  Completer<Authentication> completer = new Completer();
  StreamSubscription subscription;
  subscription = firebase.onAuth().listen((authJson) async {
    if (authJson != null && authJson['provider'] == 'github') {
      final accessToken = authJson['github']['accessToken'];
      final auth = new Authentication.withToken(accessToken);
      completer.complete(auth);
    } else {
      completer.complete(new Authentication.anonymous());
    }
    subscription.cancel();
  });
  return completer.future;
}

//@Injectable()
//class LocalStorage extends Storage {
//  factory LocalStorage() => window.localStorage;
//
//  Map<String, String> get files {
//    if (this['files'] != null) {
//      return JSON.decode(this['files']);
//    } else {
//      this['files'] = JSON.encode({'mathedit.md': ''});
//      return files;
//    }
//  }
//
//  void set files(Map<String, String> value) {
//    this['files'] = JSON.encode(value);
//  }
//}
