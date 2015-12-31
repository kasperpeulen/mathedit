library mathjax.hub;

import 'package:js/js.dart';
import 'config.dart';

/// The MathJax Hub, [MathJax.Hub], is the main control structure for MathJax.
///
/// It is where input and output [jax][1] are tied together, and it is what
/// handles processing of the MathJax `<script>` tags. Processing of the
/// mathematics on the page may require external files to be loaded (when the
/// mathematics includes less common functionality, for example, that is defined
/// in an extension file), and since file loading is asynchronous, a number of
/// the methods below may return before their actions are completed. For this
/// reason, they include callback functions that are called when the action
/// completes. These can be used to synchronize actions that require the mathematics
/// to be completed before those actions occur. See the [Using Callbacks][2]
/// documentation for more details.
///
/// [1]: https://mathjax.readthedocs.org/en/latest/glossary.html#term-jax
/// [2]: https://mathjax.readthedocs.org/en/latest/callbacks.html#using-callbacks
@JS('MathJax.Hub')
class HubClass {
  external HubClass._();

  /// This holds the configuration parameters for MathJax. Set these values using
  /// `MathJax.Hub.Config()` described below. The options and their default values
  /// are given in the [Core Options][1] reference page.
  ///
  /// [1] : http://docs.mathjax.org/en/latest/options/hub.html#configure-hub
  external ConfigOptions get config;

  /// The minimum time (in milliseconds) between updates of the “Processing Math”
  /// message.
  ///
  /// After this amount of time has passed, and after the next equation
  /// has finished being processed, MathJax will stop processing momentarily so
  /// that the update message can be displayed, and so that the browser can handle
  /// user interaction.
  ///
  /// Default value is 250.
  external int get processUpdateTime;

  /// The amount of time (in milliseconds) that MathJax pauses after issuing its
  /// processing message before starting the processing again (to give browsers
  /// time to handle user interaction).
  external int get processUpdateDelay;

  /// The hub processing signal (tied to the [MathJax.Hub.Register.MessageHook()] method).
  external get signal;

  /// MathJax’s main processing queue. Use [MathJax.Hub.Queue()] to push callbacks onto this queue.
  external QueueClass get queue;

  /// The name of the browser as determined by MathJax. It will be one of `Firefox`,
  /// `Safari`, `Chrome`, `Opera`, `MSIE`, `Konqueror`, or `unknown`. This is
  /// actually an object with additional properties and methods concerning the
  /// browser. See the [BrowserClass].
  external BrowserClass get Browser;

  /// An object storing the MIME types associated with the various registered
  /// input jax (these are the types of the `<script>` tags that store the math
  /// to be processed by each input jax).
  external get inputJax;

  /// An object storing the output jax associate with the various element jax
  /// MIME types for the registered output jax.
  external get outputJax;

  /// Sets the configuration options (stored in [MathJax.Hub.config]) to the values
  /// stored in the [options] object. See [Configuring MathJax][1] for details on how
  /// this is used and the options that you can set.
  ///
  /// [1]: https://mathjax.readthedocs.org/en/latest/options/index.html#configuration
  external void Config(ConfigOptions options);

  /// When `delayStartupUntil` is specified in the configuration file or in the
  /// script that loads MathJax.js, MathJax’s startup sequence is delayed until
  /// this routine is called. See Configuring MathJax for details on how this is
  /// used.
  external void Configured();

  /// See [RegisterClass].
  external RegisterClass get Register;

  /// Pushes the given callbacks onto the main MathJax command queue. This
  /// synchronizes the commands with MathJax so that they will be performed in
  /// the proper order even when some run asynchronously. See [Using Queues[1] for
  /// more details about how to use queues, and the MathJax queue in particular.
  /// You may supply as many callback specifications in one call to the Queue()
  /// method as you wish.
  ///
  /// [1]: https://mathjax.readthedocs.org/en/latest/queues.html#using-queues
  external Queue(Function f1, [Function f2]);

  /// Calls the preprocessors on the given element (or elements if it is an array
  /// of elements), and then typesets any math elements within the element. If
  /// no element is provided, the whole document is processed. The element is
  /// either the DOM id of the element, a reference to the DOM element itself,
  /// or an array of id’s or refereneces. The callback is called when the process
  /// is complete. See the Modifying Math section for details of how to use this
  /// method properly.
  external Function get Typeset;

  /// Calls the loaded preprocessors on the entire document, or on the given DOM
  /// element (or elements, if it is an array of elements). The element is either
  /// the DOM id of the element, a reference to the DOM element itself, or an
  /// array of id’s or references. The callback is called when the processing
  /// is complete.
  external Function get PreProcess;

  /// Scans either the entire document or a given DOM element (or array of elements)
  /// for MathJax <script> tags and processes the math those tags contain. The
  /// element is either the DOM id of the element to scan, a reference to the
  /// DOM element itself, or an array of id’s or references. The callback is
  /// called when the processing is complete.
  external Function get Update;

  /// Removes any typeset mathematics from the document or DOM element (or
  /// elements if it is an array of elements), and then processes the mathematics
  /// again, re-typesetting everything. This may be necessary, for example, if
  /// the CSS styles have changed and those changes would affect the mathematics.
  /// Reprocess calls both the input and output jax to completely rebuild the
  /// data for mathematics. The element is either the DOM id of the element to
  /// scan, a reference to the DOM element itself, or an array of id’s or references.
  /// The callback is called when the processing is complete.
  external Function get Reprocess;

  /// Removes any typeset mathematics from the document or DOM element (or elements
  /// if it is an array of elements), and then renders the mathematics again,
  /// re-typesetting everything from the current internal version (without
  /// calling the input jax again). The element is either the DOM id of the
  /// element to scan, a reference to the DOM element itself, or an array of
  /// id’s or references. The callback is called when the processing is complete.
  external Function get Rerender;

  /// Returns a list of all the element jax in the document or a specific DOM
  /// element. The element is either the DOM id of the element, or a reference
  /// to the DOM element itself.
  external Function get getAllJax;

  /// Returns a list of all the element jax of a given MIME-type in the document
  /// or a specific DOM element. The element is either the DOM id of the element
  /// to search, or a reference to the DOM element itself.
  external Function get getJaxByType;

  /// Returns a list of all the element jax associated with input <script> tags
  /// with the given MIME-type within the given DOM element or the whole document.
  /// The element is either the DOM id of the element to search, or a reference
  /// to the DOM element itself.
  external Function get getJaxByInputType;

  /// Returns the element jax associated with a given DOM element. If the element
  /// does not have an associated element jax, null is returned. The element is
  /// either the DOM id of the element, or a reference to the DOM element itself.
  external Function get getJaxFor;

  /// Returns 0 if the element is not a `<script>` that can be processed by MathJax
  /// or the result of an output jax, returns `-1` if the element is an unprocessed
  /// `<script>` tag that could be handled by MathJax, and returns `1` if the element
  /// is a processed `<script>` tag or an element that is the result of an output jax.
  external int isJax(element);

  /// Sets the output jax for the given element jax type (or jax/mml if none is
  /// specified) to be the one given by renderer, which must be the name of a
  /// renderer, such as NativeMML or HTML-CSS. Note that this does not cause the
  /// math on the page to be rerendered; it just sets the renderer for output in
  /// the future (call :meth:Rerender() above to replace the current renderings
  /// by new ones).
  external Function get setRenderer;

  /// Inserts data from the src object into the dst object. The key:value pairs
  /// in src are (recursively) copied into dst, so that if value is itself an
  /// object, its content is copied into the corresponding object in dst. That
  /// is, objects within src are merged into the corresponding objects in dst
  /// (they don’t replace them).
  external Function get Insert;

  /// This is called when an internal error occurs during the processing of a
  /// math element (i.e., an error in the MathJax code itself). The script is a
  /// reference to the <script> tag where the error occurred, and error is the
  /// Error object for the error. The default action is to insert an HTML
  /// snippet at the location of the script, but this routine can be overriden
  /// during MathJax configuration in order to perform some other action.
  /// MathJax.Hub.lastError holds the error value of the last error on the page.
  external Function get formatError;
}

@JS('MathJax.Hub.Register')
class RegisterClass {
  /// Used by preprocessors to register themselves with MathJax so that they will
  /// be called during the [MathJax.Hub.PreProcess()] action.
  external PreProcessor(callback);

  /// Registers a listener for a particular message being sent to the hub
  /// processing signal (where PreProcessing, Processing, and New Math messages
  /// are sent). When the message equals the [type], the [callback] will be called
  /// with the message as its parameter.
  ///
  /// The following is an example for using the MessageHook to list internal
  /// errors within MathJax which would otherwise be silent:
  ///
  ///     MathJax.Hub.Register.MessageHook("TeX Jax - parse error",function (message) {
  ///     // do something with the error.  message[1] will contain the data about the error.
  ///     });
  ///
  ///     MathJax.Hub.Register.MessageHook("Math Processing Error",function (message) {
  ///     //  do something with the error.  message[2] is the Error object that records the problem.
  ///     });
  external MessageHook(type, callback);

  /// Registers a listener for a particular message being sent to the startup
  /// signal (where initialization and component startup messages are sent).
  /// When the message equals the type, the callback will be called with the
  /// message as its parameter. See the [Using Signals][1] documentation for more
  /// details.
  ///
  /// [1]: https://mathjax.readthedocs.org/en/latest/signals.html#using-signals
  external StartupHook(type, callback);

  /// Registers a callback to be called when a particular file is completely
  /// loaded and processed. (The callback is called when the file makes its
  /// MathJax.Ajax.loadComplete() call.) The file should be the complete file
  /// name, e.g., "\[MathJax\]/config/default.js".
  external LoadHook(file, callback);
}

@JS('MathJax.Hub.Browser')
class BrowserClass {
  /// The browser version number, e.g., "4.0".
  external String get version;

  /// Whether the browser is running on a Windows computer.
  external bool get isMac;

  /// Whether the browser is running on a Macintosh computer.
  external bool get isPC;

  /// This is true when MathJax is running a mobile version of a WebKit or
  /// Gecko-based browser.
  external bool get isMobile;

  external bool get isFirefox;
  external bool get isSafari;
  external bool get isChrome;
  external bool get isOpera;
  external bool get isMSIE;
  external bool get isKonqueror;

  /// This tests whether the browser version is at least that given in the
  /// version string. Note that you can not simply do a numeric comparison, as
  /// version 4.10 should be considered later than 4.9, for example. Similarly,
  /// 4.10 is different from 4.1, for instance.
  external bool versionAtLeast(String version);

  /// This lets you perform browser-specific functions. Here, choices is an
  /// object whose properties are the names of the browsers and whose values are
  /// the functions to be performed. Each function is passed one parameter, which
  /// is the MathJax.Hub.Browser object. You do not need to include every browser
  /// as one of your choices — only those for which you need to do special
  /// processing. For example:
  ///
  ///     MathJax.Hub.Browser.Select({
  ///       MSIE: function (browser) {
  ///         if (browser.versionAtLeast("8.0")) {... do version 8 stuff ... }
  ///         ... do general MSIE stuff ...
  ///       },
  ///
  ///       Firefox: function (browser) {
  ///         if (browser.isMac) {... do Mac stuff ... }
  ///         ... do general Firefox stuff
  ///       }
  ///     });
  external Select(choices);
}

@JS('MathJax.Queue')
class QueueClass {}
