import 'package:angular2/angular2.dart';
import 'package:mathedit/components/editor_component/editor_component.dart';
import 'package:mathedit/components/preview_component/preview_component.dart';
import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/mathjax_preview.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    directives: const [EditorComponent, PreviewComponent],
    encapsulation: ViewEncapsulation.None,
    styleUrls: const ['app.css'])
class AppComponent {
  MathJaxPreview mathjaxPreview;

  final CommonMarkParser parser;
  final HtmlWriter htmlWriter;

  AppComponent(ElementRef ref, this.parser, this.htmlWriter) {
    final hostElement = ref.nativeElement;
    mathjaxPreview = new MathJaxPreview(
        hostElement.querySelector('#preview'),
        hostElement.querySelector('#buffer'));
  }

  onTextareaChange(String textareaValue) {
    final ast = parser.parse(textareaValue);
    final html = htmlWriter.write(ast);
    mathjaxPreview.update(html);
  }
}
