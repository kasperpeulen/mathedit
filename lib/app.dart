import 'package:angular2/angular2.dart';
import 'package:mathedit/components/editor_component/editor_component.dart';
import 'package:mathedit/components/preview_component/preview_component.dart';
import 'dart:html';
import 'package:md_proc/md_proc.dart';
import 'package:mathedit/helpers/mathjax_preview.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    directives: const [EditorComponent, PreviewComponent],
    encapsulation: ViewEncapsulation.None,
    styleUrls: const ['app.css'])
class AppComponent {
  final Element el;

  final MathJaxPreview mathjaxPreview;

  factory AppComponent(ElementRef ref) {
    final el = ref.nativeElement;
    final DivElement preview = el.querySelector('#preview');
    final DivElement buffer = el.querySelector('#buffer');
    final mathjaxPreview =
        new MathJaxPreview(mathPreview: preview, bufferDiv: buffer, delay: 200);
    return new AppComponent._(el, mathjaxPreview);
  }

  AppComponent._(this.el, this.mathjaxPreview);

  onTextareaChange(String textareaValue) {
    // TODO remove this when https://github.com/dikmax/md_proc/issues/12 is fixed
    textareaValue = textareaValue.replaceAll(r'\\', r'\\\\');

    final doc = CommonMarkParser.commonmark.parse(textareaValue);
    final res = HtmlWriter.defaults.write(doc);
    mathjaxPreview.update(res);
  }
}

