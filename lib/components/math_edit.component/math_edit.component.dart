import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:mathedit/components/editor.component/editor.component.dart';
import 'package:mathedit/components/preview.component/preview.component.dart';

import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/mathjax_preview.dart';
import 'dart:html';
import 'package:mathedit/service/gist.service.dart';
import 'package:mathedit/service/editor.service.dart';
import 'package:event_bus/event_bus.dart';
import 'package:mathedit/service/user.service.dart';
import 'package:usage/usage.dart';

@Component(
    selector: 'math-edit',
    templateUrl: 'math_edit.component.html',
    directives: const [EditorComponent, PreviewComponent],
    encapsulation: ViewEncapsulation.None,
    styleUrls: const ['math_edit.component.css'])
class MathEditComponent implements OnInit {
  // sets textareavalue
  String gistValue;

  // if the component can be displayed
  bool loaded = false;

  MathJaxPreview _mathjaxPreview;
  final CommonMarkParser _cmParser;
  final HtmlWriter _htmlWriter;
  final RouteParams _params;
  final MyGistsService _gistService;
  final EditorService _editor;
  final EventBus _eventBus;
  final UserService _userService;
  final Analytics _analytics;

  final ElementRef ref;

  MathEditComponent(
      this._params,
      this.ref,
      this._cmParser,
      this._htmlWriter,
      this._gistService,
      this._editor,
      this._eventBus,
      this._userService,
      this._analytics) {
    _gistService.gistId = _params.get('gistid');

    _analytics.sendScreenView(_gistService.gistId ?? '/');

    _eventBus.on(TextareaChangedEvent).listen((TextareaChangedEvent e) {
      onTextareaChange(e.value);
    });
  }

  @HostListener('keydown.control.k', const ['\$event'])
  onSave(KeyboardEvent e) async {
    e.preventDefault();
    _gistService.saveGist(_editor.value);
    return;
  }

  @HostListener('keydown.control.l', const ['\$event'])
  onLogin(KeyboardEvent e) async {
    e.preventDefault();
    await _userService.login();
  }

  ngOnInit() async {
    final hostElement = ref.nativeElement;
    _mathjaxPreview = new MathJaxPreview(hostElement.querySelector('#preview'),
        hostElement.querySelector('#buffer'));

    try {
      await _editor.loadEditor();
    } catch (e) {
      _analytics.sendException('Failed loading editor');
    }
    loaded = true;
  }

  onTextareaChange(String textareaValue) {
    final ast = _cmParser.parse(textareaValue);
    final html = _htmlWriter.write(ast);
    _mathjaxPreview.update(html);
  }
}
