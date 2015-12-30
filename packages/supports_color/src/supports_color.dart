
library supports_color.impl;

import 'dart:io';

/// Detect whether the current terminal supports color.
bool get supportsColor {
  if(_supportsColor == null) {
    _supportsColor = supportsColorTestable(
        hasTerminal: stdout.hasTerminal, 
        isWindows: Platform.isWindows, 
        env: Platform.environment);
  }
  return _supportsColor;
}
bool _supportsColor;

bool supportsColorTestable({
    bool hasTerminal: true, 
    bool isWindows: false, 
    Map<String, String> env: const {}}) {
  
  var term = env['TERM'];
  bool supportsTerm() => term != null && term != 'dumb' && _termPattern.hasMatch(term);
  
  if (isWindows) {
    
    // Cygwin mintty terminal.
    // Ignore hasTerminal since it will always be false since mintty uses pipes.
    if (supportsTerm()) return true;
    
    if (!hasTerminal) return false;
    
    // TODO: `return true` once http://dartbug.com/21337 is fixed.
    return false;
  }

  return hasTerminal && (env.containsKey('COLORTERM') || supportsTerm());
}
final _termPattern = new RegExp(r'^screen|^xterm|^vt100|color|ansi|linux', caseSensitive: false);
