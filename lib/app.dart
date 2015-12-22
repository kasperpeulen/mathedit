import 'package:angular2/angular2.dart';
import 'package:mathedit/components/editor_component/editor_component.dart';
import 'package:mathedit/components/preview_component/preview_component.dart';
import 'dart:async';
import 'package:mathjax/mathjax.dart';
import 'dart:html';
import 'dart:js';
import 'package:md_proc/md_proc.dart';

@Component(
    selector: 'app',
    templateUrl: 'app.html',
    directives: const [EditorComponent, PreviewComponent],
    encapsulation: ViewEncapsulation.None,
    styleUrls: const ['app.css'])
class AppComponent {
  final Element el;

  MathJaxPreview mathjaxPreview;

  AppComponent(ElementRef ref) : el = ref.nativeElement {
    DivElement preview = el.querySelector('#preview');
    DivElement buffer = el.querySelector('#buffer');
    mathjaxPreview =
        new MathJaxPreview(mathPreview: preview, bufferDiv: buffer, delay: 200);
  }

  onTextareaChange(String textareaValue) {
    textareaValue = textareaValue.replaceAll(r'\\', r'\\\\');
    var doc = CommonMarkParser.commonmark.parse(textareaValue);
    String res = HtmlWriter.defaults.write(doc);
    mathjaxPreview.update(res);
  }
}

class MathJaxPreview {
  /// The div element where the mathjax will be shown.
  DivElement mathPreview;

  /// The buffer mirror.
  DivElement bufferDiv;

  /// The textarea element where the user can input latex.
  TextAreaElement mathInput;

  /// delay after keystroke before updating
  final int delay;

  /// true when MathJax is processing
  bool _mjRunning = false;

  /// used to check if an update is needed
  String _oldText = '';

  /// keep track of the timer
  Timer _timer;

  MathJaxPreview({this.mathPreview, this.bufferDiv, this.delay});

  /// This gets called when a key is pressed in the textarea.
  /// We check if there is already a pending update and clear it if so.
  /// Then set up an update to occur after a small delay (so if more keys
  /// are pressed, the update won't occur until after there has been
  /// a pause in the typing).
  /// The callback function is set up below, after the Preview object is set up.
  void update(String value) {
    _timer?.cancel();
    _timer = new Timer(
        new Duration(milliseconds: delay), () => createPreview(value));
  }

  /// Creates the preview and runs MathJax on it.
  /// If MathJax is already trying to render the code, return
  /// If the text hasn't changed, return
  /// Otherwise, indicate that MathJax is running, and start the
  /// typesetting.  After it is done, call PreviewDone.
  void createPreview(String newText) {
    if (newText == _oldText || _mjRunning) return;
    _mjRunning = true;
    bufferDiv.innerHtml = _oldText = newText;
    MathJax.Hub.Queue(allowInterop(() => MathJax.Hub.Typeset(bufferDiv)),
        allowInterop(_previewDone));
  }

  /// Indicate that MathJax is no longer running,
  /// and swap the buffers to show the results.
  void _previewDone() {
    _mjRunning = false;
    _swapBuffers();
  }

  /// Switch the buffer and preview, and display the right one.
  /// (We use visibility:hidden rather than display:none since
  /// the results of running MathJax are more accurate that way.
  void _swapBuffers() {
    var oldBuffer = bufferDiv;
    bufferDiv = mathPreview;
    mathPreview = oldBuffer;

    bufferDiv.style
      ..visibility = 'hidden'
      ..position = 'absolute';
    mathPreview.style
      ..visibility = ''
      ..position = '';
  }
}
