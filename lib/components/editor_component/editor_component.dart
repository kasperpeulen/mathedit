import 'package:angular2/angular2.dart';
import 'package:mathedit/directives/autogrow_directive.dart';
import 'dart:html';

@Component(
    selector: 'editor',
    directives: const [AutogrowDirective],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'editor_component.html',
    styleUrls: const ['editor_component.css'],
    host: const {
      '(click)': 'hostClick()'
    }
    )
class EditorComponent implements OnInit {
  Storage get store => window.localStorage;

  String textareaValue;

  Element el;

  EditorComponent(ElementRef ref) {
    el = ref.nativeElement;
  }

  hostClick() {
    el.querySelector('textarea').focus();
  }

  ngOnInit() {
    el.querySelector('textarea').focus();

    if (store['mathedit.textarea'] != null) {
      textareaValue = store['mathedit.textarea'];
      value.add(textareaValue);
    }
  }

  @Output() EventEmitter<String> value = new EventEmitter();

  onInput(String textareaValue) {
    store['mathedit.textarea'] = textareaValue;
    value.add(textareaValue);
  }
}
