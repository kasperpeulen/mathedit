library mathjax.ajax;

import 'package:js/js.dart';

/// The MathJax.Ajax structure holds the data and functions for handling loading
/// of external modules. Modules are loaded only once, even if called for in
/// several places. The loading of files is asynchronous, and so the code that
/// requests an external module will continue to run even when that module has
/// not completed loading, so it is important to be aware of the timing issues
/// this may cause. Similarly, creating or loading stylesheets is an asynchronous
/// action. In particular, all actions that rely on the file or stylesheet having
/// been loaded must be delayed until after the file has been downloaded completely.
/// This is the reason for the large number of routines that take callback functions.
///
/// Any operation that could cause the loading of a file or stylesheet must be
/// synchronized with the rest of the code via such callbacks. Since processing
/// any mathematics might cause files to be loaded (e.g., little-used markup
/// might be implemented in an extension that is loaded only when that markup
/// is used), any code that dynamically typesets mathematics will need to be
/// structured to use callbacks to guarantee that the mathematics has been
/// completely processed before the code tries to use it. See the Synchronizing
/// with MathJax documentation for details on how to do this properly.
@JS('MathJax.Ajax')
class AjaxClass {
  external AjaxClass._();

  /// Number of milliseconds to wait for a file to load before it is considered
  /// to have failed to load.
  ///
  /// Default: 15 seconds
  external int get timeout;

  external Status get STATUS;

  external get loaded;

  external get loading;

  external get loadHooks;
}

@JS('MathJax.Ajax.STATUS')
class Status {
  external int get OK;
  external int get ERROR;
}
