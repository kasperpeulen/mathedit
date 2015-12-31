import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:mathedit/components/editor.component/editor.component.dart';
import 'package:mathedit/components/preview.component/preview.component.dart';

import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/mathjax_preview.dart';
import 'package:github/browser.dart';
import 'dart:html';
import 'package:mathedit/service/gist.service.dart';
import 'package:firebase/firebase.dart';
import 'package:mathedit/service/editor.service.dart';

@Component(
    selector: 'math-edit',
    templateUrl: 'math_edit.component.html',
    directives: const [EditorComponent, PreviewComponent],
    encapsulation: ViewEncapsulation.None,
    styleUrls: const ['math_edit.component.css'])
class MathEditComponent implements OnInit {
  String gistValue;

  bool loaded = false;

  MathJaxPreview _mathjaxPreview;
  final CommonMarkParser _cmParser;
  final HtmlWriter _htmlWriter;
  final RouteParams _params;
  final MyGistsService _gistService;
  final Firebase _firebase;
  final EditorService _editor;

  final Router router;
  String textareaValue;

  @HostListener('keydown.control.k', const ['\$event'])
  onSave(KeyboardEvent e) async {
    e.preventDefault();
    _gistService.saveGist(textareaValue);
    return;
  }

  @HostListener('keydown.control.l', const ['\$event'])
  onLogin(KeyboardEvent e) async {
    e.preventDefault();
    _firebase.authWithOAuthRedirect('github', scope: 'gist');
  }

  MathEditComponent(this.router, this._params, ElementRef ref, this._cmParser,
      this._htmlWriter, this._gistService, this._firebase, this._editor) {
    final hostElement = ref.nativeElement;
    _mathjaxPreview = new MathJaxPreview(hostElement.querySelector('#preview'),
        hostElement.querySelector('#buffer'));
    _gistService.gistId = _params.get('gistid');
  }

  ngOnInit() async {
    final gistId = _gistService.gistId;
    if (gistId != null) {
      try {
        final gist = await _gistService.getGist(gistId);
        gistValue = gist.files.first.content;
        document.title = 'MathEdit - ${gist.description}';

        onTextareaChange(gistValue);
      } catch (e) {
        print(e);
        router.navigate(['Home']);
      }
      loaded = true;
    } else {
      loaded = true;
    }
  }

  onTextareaChange(String textareaValue) {
    _editor.value = textareaValue;
    this.textareaValue = textareaValue;
    final ast = _cmParser.parse(textareaValue);
    final html = _htmlWriter.write(ast);
    _mathjaxPreview.update(html);
  }
}