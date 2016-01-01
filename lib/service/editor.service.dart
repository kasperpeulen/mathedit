import 'dart:async';
import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:angular2/router.dart';
import 'package:event_bus/event_bus.dart';
import 'package:mathedit/service/gist.service.dart';
import 'package:usage/usage.dart';

@Injectable()
class EditorService {
  final EventBus _eventBus;
  final Storage _storage;
  final MyGistsService _gistsService;
  final Router _router;
  final Analytics _analytics;

  /// The textarea value
  String _value;

  EditorService(this._analytics, this._gistsService, this._eventBus,
      this._storage, this._router);

  String get value => _value;

  /// Fires a [TextareaChangedEvent]
  void set value(String value) {
    _value = value;
    _storage['mathedit.textarea'] = value;
    _eventBus.fire(new TextareaChangedEvent(value));
  }

  Future<String> getInitialTextValue() async {
    // only if there is no gist route, the localstorage should be used
    final storedTextareaValue = _storage['mathedit.textarea'];
    if (_gistsService.gistId == null) {
      if (storedTextareaValue != null)
        return storedTextareaValue;
      else {
        return '';
      }
    } else {
      try {
        final gist = await _gistsService.getGist(_gistsService.gistId);
        final gistValue = gist.files.first.content;
        document.title = 'MathEdit - ${gist.description}';
        return gistValue;
      } catch (e) {
        _analytics.sendException('Failed getting gist');
        _router.navigate(['Home']);
      }
    }
  }
}

class TextareaChangedEvent {
  final String value;

  TextareaChangedEvent(this.value);
}
