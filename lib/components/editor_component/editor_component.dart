import 'package:angular2/angular2.dart';
import 'package:mathedit/directives/autogrow_directive.dart';
import 'dart:html';
import 'package:mathedit/helpers/local_storage.dart';

@Component(
    selector: 'editor',
    directives: const [AutogrowDirective],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'editor_component.html',
    styleUrls: const ['editor_component.css'])
class EditorComponent implements OnInit {
  /// Emits textarea value
  @Output() final EventEmitter<String> value = new EventEmitter();

  String textareaValue;

  final Element _hostElement;

  EditorComponent(ElementRef ref) : _hostElement = ref.nativeElement;

  @HostListener('click', const [r'$event.currentTarget'])
  onClick(Element target) {
    target.querySelector('textarea').focus();
  }

  ngOnInit() {
    _hostElement.querySelector('textarea').focus();

    if (store['mathedit.textarea'] != null) {
      textareaValue = store['mathedit.textarea'];
      value.add(textareaValue);
    }
  }

  onInput(String textareaValue) {
    store['mathedit.textarea'] = textareaValue;
    value.add(textareaValue);
  }
}
