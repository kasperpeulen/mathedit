library angular2.src.router.router_link_transform.ng_deps.dart;

import 'router_link_transform.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/compiler.dart' show TemplateAstVisitor, ElementAst, BoundDirectivePropertyAst, DirectiveAst, BoundElementPropertyAst;
import 'package:angular2/src/core/change_detection/parser/ast.dart' show AstTransformer, Quote, AST, EmptyExpr, LiteralArray, LiteralPrimitive, ASTWithSource;
import 'package:angular2/src/facade/exceptions.dart' show BaseException;
import 'package:angular2/core.dart' show Injectable;
import 'package:angular2/src/core/change_detection/parser/parser.dart' show Parser;
import 'package:angular2/compiler.ng_deps.dart' as i0;
import 'package:angular2/src/core/change_detection/parser/ast.ng_deps.dart' as i1;
import 'package:angular2/src/facade/exceptions.ng_deps.dart' as i2;
import 'package:angular2/core.ng_deps.dart' as i3;
import 'package:angular2/src/core/change_detection/parser/parser.ng_deps.dart' as i4;
export 'router_link_transform.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(RouterLinkTransform, new _ngRef.ReflectionInfo(
const [const Injectable()],
const [const [Parser]],
(Parser parser) => new RouterLinkTransform(parser),
const [TemplateAstVisitor])
)
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
i3.initReflector();
i4.initReflector();
}
