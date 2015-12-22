import 'package:angular2/angular2.dart';
import 'package:mathedit/directives/autogrow_directive.dart';
import 'dart:html';
import 'package:mathedit/helpers/local_storage.dart';

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

  @Output() final EventEmitter<String> value = new EventEmitter();

  String textareaValue;

  final Element hostElement;

  EditorComponent(ElementRef ref) : hostElement = ref.nativeElement;

  hostClick() {
    hostElement.querySelector('textarea').focus();
  }

  ngOnInit() {
    hostElement.querySelector('textarea').focus();

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
