import 'package:angular2/angular2.dart';
import 'package:github/browser.dart';
import 'dart:async';

@Injectable()
class MyGistsService extends GistsService {
  MyGistsService(GitHub github) : super(github);

  Future<Gist> createSimpleGist(String content) {
    return createGist({'mathedit.md': content},
        description: 'Math Snippet created with mathedit', public: true);
  }
}
