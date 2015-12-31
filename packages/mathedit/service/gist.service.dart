import 'package:angular2/angular2.dart';
import 'package:github/browser.dart';
import 'dart:async';
import 'package:angular2/router.dart';
import 'package:usage/usage.dart';

@Injectable()
class MyGistsService extends GistsService {
  final Authentication _auth;
  final Router _router;

  /// This is set when there is a gist id in the router.
  String gistId;

  final Analytics _analytics;

  MyGistsService(GitHub github, this._auth, this._router, this._analytics)
      : super(github);

  Future<Gist> createSimpleGist(String content, {public: true}) async {
    final gist = await createGist({'mathedit.md': content},
        description: 'Math Snippet created with mathedit', public: public);
    _router.navigate([
      'Gist',
      {'gistid': gist.id}
    ]);
    return gist;
  }

  Future<Gist> saveGist(String content, {public: true}) async {
    _analytics.sendEvent('save', gistId);
    var needsNewGist = await (() async {
      if (_auth.isAnonymous) {
        return true;
      }
      if (gistId == null) {
          return true;
        }
      Gist gist = await getGist(gistId);
      if (gist.public != public) {
        return true;
      }
      return false;
    }());

    if (needsNewGist) {
      return createSimpleGist(content, public: public);
    } else {
      try {
        return await editGist(gistId, files: {'mathedit.md': content});
      } catch (e) {
        _analytics.sendException(e.toString());
        return await createSimpleGist(content);
      }
    }
  }


}
