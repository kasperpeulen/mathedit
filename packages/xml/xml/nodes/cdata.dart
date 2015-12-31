part of xml;

/// XML CDATA node.
class XmlCDATA extends XmlData {

  /// Create a CDATA section with `text`.
  XmlCDATA(String text) : super(text);

  @override
  XmlNodeType get nodeType => XmlNodeType.CDATA;

  @override
  accept(XmlVisitor visitor) => visitor.visitCDATA(this);

}
