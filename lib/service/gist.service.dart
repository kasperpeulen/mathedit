import 'package:angular2/angular2.dart';
import 'package:github/browser.dart';
import 'dart:async';
import 'package:angular2/router.dart';

@Injectable()
class MyGistsService extends GistsService {
  final Authentication _auth;
  final Router _router;

  /// This is set when there is a gist id in the router.
  String gistId;

  MyGistsService(GitHub github,this._auth, this._router)
      : super(github);

  Future<Gist> createSimpleGist(String content) {
    return createGist({'mathedit.md': content},
        description: 'Math Snippet created with mathedit', public: true);
  }

  saveGist(String content) async {
    if (_auth.isAnonymous || gistId == null) {
      Gist gist = await createSimpleGist(content);
      _router.navigate([
        'Gist',
        {'gistid': gist.id}
      ]);
    } else {
      try {
        await editGist(gistId, files: {'mathedit.md': content});
      } catch (e) {
        print(e);
        Gist gist = await createSimpleGist(content);
        _router.navigate([
          'Gist',
          {'gistid': gist.id}
        ]);
      }
    }
  }
}
