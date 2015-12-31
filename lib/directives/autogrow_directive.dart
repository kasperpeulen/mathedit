import 'package:angular2/angular2.dart';
import 'dart:html';

@Directive(
    selector: 'textarea[autogrow]',
    host: const {'(input)': 'onInput(\$event.target)'})
class AutogrowDirective {
  void onInput(TextAreaElement textArea) {
    // shrink the textarea when needed
    textArea.style.height = 'auto';

    // set the height to scrollHeight plus some correction
    final correction = textArea.offsetHeight - textArea.clientHeight;
    textArea.style.height = '${textArea.scrollHeight - correction}px';
  }
}
