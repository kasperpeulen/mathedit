library mathjax;

import 'package:js/js.dart';
import 'hub.dart';
import 'ajax.dart';

/// MathJax has a single global variable, MathJax, in which all its data, and
/// the data for loaded components, are stored. The MathJax variable is a nested
/// structure, with its top-level properties being objects themselves.
@JS('MathJax') external MathJaxClass get MathJax;

@JS('MathJax')

/// This class can't be initiated. The [MathJax] object is the only instance.
class MathJaxClass {
  // class can't be initiated
  external MathJaxClass._();

  /// The version number of the MathJax library as a whole.
  external String get version;

  /// The version number of the MathJax.js file specifically.
  external String get fileversion;

  /// This is set to `true` when MathJax is set up and ready to perform typesetting
  /// actions (and is `null` otherwise).
  external bool get isReady;

  /// Contains the MathJax hub code and variables, including the startup code,
  /// the onload handler, the browser data, and so forth.
  external HubClass get Hub;

  /// Contains the code for loading external modules and creating stylesheets.
  /// Most of the code that causes MathJax to operate asynchronously is handled
  /// here.
  external AjaxClass get Ajax;

  /// Contains the code to handle the intermittent message window that
  /// periodically appears in the lower left-hand corner of the window.
  external get Message;

  /// Contains support code for creating HTML elements dynamically from
  /// descriptions stored in JavaScript objects.
  external get HTML;

  /// Contains the code for managing MathJax callbacks, queues and signals.
  external Function get CallBack;

  /// Initially empty, this is where extensions can load their code. For example,
  /// the tex2jax preprocessor creates MathJax.Extension.tex2jax for its code and variables.
  external get Extension;

  /// Initially null, this is where the MathJax contextual menu is stored, when
  /// extensions/MathMenu.js is loaded.
  external get Menu;

  /// Contains the code for the MathJax object-oriented programming model.
  external get Object;

  /// The base class for all input jax objects. Subclasses for specific input
  /// jax are created as sub-objects of `MathJax.InputJax`. For example, the TeX
  /// input jax loads itself as `MathJax.InputJax.TeX`.
  external get InputJax;

  /// The base class for all output jax objects. Subclasses for specific output
  /// jax are created as sub-objects of MathJax.OutputJax. For example, the
  /// HTML-CSS output jax loads itself as MathJax.OutputJax["HTML-CSS"].
  external get OutputJax;

  /// The base class for all element jax objects. Subclasses for specific element
  /// jax are created as sub-objects of MathJax.ElementJax. For example, the mml
  /// element jax loads itself as MathJax.ElementJax.mml.
  external get ElementJax;
}

@JS('MathJax.CallBack')
class CallBackClass {
  external void set autoReset(bool value);
  external bool get autoReset;
}

@JS('MathJax.Message')
class MessageClass {
  external MessageClass._();
}
