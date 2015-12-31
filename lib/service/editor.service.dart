import 'package:angular2/angular2.dart';
import 'package:md_proc/md_proc.dart';
@Injectable()
class EditorService {
  String _value;

  final CommonMarkParser _cmParser;
  final HtmlWriter _htmlWriter;

  EditorService(this._cmParser, this._htmlWriter);

  String get value => _value;

  void set value(String value) {
    _value = value;
    final ast = _cmParser.parse(value);
    final html = _htmlWriter.write(ast);
    _value = value;
  }

}