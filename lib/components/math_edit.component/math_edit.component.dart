import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:mathedit/components/editor.component/editor.component.dart';
import 'package:mathedit/components/preview.component/preview.component.dart';

import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/mathjax_preview.dart';
import 'package:github/browser.dart';
import 'dart:html';
import 'package:mathedit/service/gist.service.dart';

@Component(
    selector: 'math-edit',
    templateUrl: 'math_edit.component.html',
    directives: const [EditorComponent, PreviewComponent],
    encapsulation: ViewEncapsulation.None,
    styleUrls: const ['math_edit.component.css'])
class MathEditComponent implements OnInit {
  String gistValue;

  bool loaded = false;

  MathJaxPreview mathjaxPreview;
  final CommonMarkParser cmParser;
  final HtmlWriter htmlWriter;
  final RouteParams params;
  final MyGistsService gistService;

  final Router router;
  String textareaValue;

  @HostListener('keyup.control.k')
  onSave() async {
    Gist gist = await gistService.createSimpleGist(textareaValue);
    router.navigate([
      'Gist',
      {'gistid': gist.id}
    ]);
  }

  MathEditComponent(this.router, this.params, ElementRef ref, this.cmParser,
      this.htmlWriter, this.gistService) {
    final hostElement = ref.nativeElement;
    mathjaxPreview = new MathJaxPreview(hostElement.querySelector('#preview'),
        hostElement.querySelector('#buffer'));
  }

  ngOnInit() async {
    var gistId = params.get('gistid');
    if (gistId != null) {
      final gist = await gistService.getGist(gistId);
      gistValue = gist.files.first.content;
      document.title = 'MathEdit - ${gist.description}';
      onTextareaChange(gistValue);
      loaded = true;
    } else {
      loaded = true;
    }
  }

  onTextareaChange(String textareaValue) {
    this.textareaValue = textareaValue;
    final ast = cmParser.parse(textareaValue);
    final html = htmlWriter.write(ast);
    mathjaxPreview.update(html);
  }
}
