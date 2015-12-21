import 'package:angular2/angular2.dart';
import 'package:mathedit/directives/autogrow_directive.dart';

@Component(
  selector: 'editor',
  directives: const [AutogrowDirective],
  encapsulation: ViewEncapsulation.None,
  templateUrl: 'editor_component.html',
  styleUrls: const [
    'editor_component.css'
  ]
)
class EditorComponent {
  @Output() EventEmitter<String> value = new EventEmitter();

  onInput(String textareaValue) {
    value.add(textareaValue);
  }
}