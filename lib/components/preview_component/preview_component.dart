import 'package:angular2/angular2.dart';

@Component(
  selector: 'preview ',
  encapsulation: ViewEncapsulation.None,
  templateUrl: 'preview_component.html',
  styleUrls: const [
    'preview_component.css'
  ]
)
class PreviewComponent {
  @Input() String value;
}