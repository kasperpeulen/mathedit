import 'package:barback/barback.dart';
import 'dart:async';
import 'package:html/parser.dart';

class MathJaxUrlTransformer extends Transformer {
  final String localUrl = 'packages/mathjax/js/MathJax.js';
  final String cdnUrl = 'https://cdn.mathjax.org/mathjax/latest/MathJax.js';
  final String allowedExtensions = '.html';

  final BarbackSettings settings;

  MathJaxUrlTransformer.asPlugin(this.settings);

  bool isPrimary(AssetId id) {
    return (settings.mode == BarbackMode.RELEASE &&
        ['.html', '.htm'].contains(id.extension) &&
        id.path.startsWith('web'));
  }

  Future apply(final Transform transform) async {
    final htmlSource = await transform.primaryInput.readAsString();
    final htmlDocument = parse(htmlSource);
    final mathjaxScript = htmlDocument.querySelector('script[src^="$localUrl"]');

    if (mathjaxScript != null) {
      final srcWithCdn = mathjaxScript.attributes['src'].replaceAll(localUrl, cdnUrl);
      mathjaxScript.attributes['src'] = srcWithCdn;
    }

    final assetId = transform.primaryInput.id;
    transform.addOutput(new Asset.fromString(assetId, htmlDocument.outerHtml));

  }
}
