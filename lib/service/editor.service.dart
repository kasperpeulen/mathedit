import 'package:angular2/angular2.dart';
import 'package:event_bus/event_bus.dart';
import 'dart:html';
import 'package:mathedit/service/gist.service.dart';
import 'package:angular2/router.dart';
import 'package:usage/usage.dart';
import 'dart:async';

@Injectable()
class EditorService {
  final EventBus _eventBus;
  final Storage _storage;
  final MyGistsService _gistsService;
  final Router _router;
  final Analytics _analytics;

  EditorService(this._analytics,
      this._gistsService, this._eventBus, this._storage, this._router);

  Future<Null> loadEditor() async {
    // only if there is no gist route, the localstorage should be used
    final gistId = _gistsService.gistId;
    if (gistId == null) {
      if (_storage['mathedit.textarea'] != null) {
        value = _storage['mathedit.textarea'];
      }
    } else {
      try {
        final gist = await _gistsService.getGist(gistId);
        var gistValue = gist.files.first.content;
        document.title = 'MathEdit - ${gist.description}';
        value = gistValue;
      } catch (e) {
        _analytics.sendException('Failed getting gist');
        _router.navigate(['Home']);
      }
    }
  }

  /// The textarea value
  String _value;

  String get value => _value;

  /// Fires a [TextareaChangedEvent]
  void set value(String value) {
    _value = value;
    _storage['mathedit.textarea'] = value;
    _eventBus.fire(new TextareaChangedEvent(value));
  }
}

class TextareaChangedEvent {
  final String value;
  TextareaChangedEvent(this.value);
}
