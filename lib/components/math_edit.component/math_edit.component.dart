import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:mathedit/components/editor.component/editor.component.dart';
import 'package:mathedit/components/preview.component/preview.component.dart';

import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/mathjax_preview.dart';
import 'package:github/browser.dart';
import 'dart:html';

@Component(
    selector: 'math-edit',
    templateUrl: 'math_edit.component.html',
    directives: const [EditorComponent, PreviewComponent],
    encapsulation: ViewEncapsulation.None,
    styleUrls: const ['math_edit.component.css'])
class MathEditComponent implements OnInit {
  String gistValue;

  MathJaxPreview mathjaxPreview;
  final CommonMarkParser cmParser;
  final HtmlWriter htmlWriter;
  final RouteParams params;
  final GistsService gistService;

  MathEditComponent(this.params, ElementRef ref, this.cmParser, this.htmlWriter,
      this.gistService) {
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
    }
  }

  onTextareaChange(String textareaValue) {
    final ast = cmParser.parse(textareaValue);
    final html = htmlWriter.write(ast);
    mathjaxPreview.update(html);
  }
}
