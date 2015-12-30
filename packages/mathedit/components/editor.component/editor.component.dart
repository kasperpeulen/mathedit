import 'package:angular2/router.dart';
import 'package:angular2/angular2.dart';
import 'package:mathedit/directives/autogrow_directive.dart';
import 'dart:html';
import 'package:mathedit/helpers/local_storage.dart';

@Component(
    selector: 'editor',
    directives: const [AutogrowDirective],
    encapsulation: ViewEncapsulation.None,
    templateUrl: 'editor.component.html',
    styleUrls: const ['editor.component.css'])
class EditorComponent implements OnInit {
  /// Emits textarea value
  @Output() final EventEmitter<String> value = new EventEmitter();

  @Input() String textareaValue;

  final Element _hostElement;
  final RouteParams params;

  EditorComponent(this.params, ElementRef ref)
      : _hostElement = ref.nativeElement;

  @HostListener('click', const [r'$event.currentTarget'])
  onClick(Element target) {
    target.querySelector('textarea').focus();
  }

  ngOnInit() async {
    // focus the textarea in initial load
    _hostElement.querySelector('textarea').focus();

    // only if there is no gist route, the localstorage should be used
    final gistId = params.get('gistid');
    if (gistId == null) {
      if (store['mathedit.textarea'] != null) {
        textareaValue = store['mathedit.textarea'];
        value.add(textareaValue);
      }
    }
  }

  onInput(String textareaValue) {
    store['mathedit.textarea'] = textareaValue;
    value.add(textareaValue);
  }
}
