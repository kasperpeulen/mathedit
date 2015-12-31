import 'dart:html';

import 'package:angular2/angular2.dart';
import 'package:event_bus/event_bus.dart';
import 'package:mathedit/directives/autogrow_directive.dart';
import 'package:mathedit/directives/focus_on_init.directive.dart';
import 'package:mathedit/service/editor.service.dart';

@Component(
    selector: 'editor',
    directives: const [AutogrowDirective, FocusOnInitDirective],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'editor.component.html',
    styleUrls: const ['editor.component.css'])
class EditorComponent {
  @Input() String textareaValue;

  final EditorService _editor;
  final EventBus _eventBus;

  EditorComponent(ElementRef ref, this._editor, this._eventBus) {
    _eventBus.on(TextareaChangedEvent).listen((TextareaChangedEvent e) {
      textareaValue = e.value;
    });
  }

  @HostListener('click', const [r'$event.currentTarget'])
  void onClick(Element target) {
    target.querySelector('textarea').focus();
  }

  void onInput(String textareaValue) {
    _editor.value = textareaValue;
  }
}
