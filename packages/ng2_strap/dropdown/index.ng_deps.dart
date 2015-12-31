library ns_dropdown.ng_deps.dart;

import 'index.dart';
import 'package:angular2/src/core/reflection/reflection.dart' as _ngRef;
import 'package:angular2/angular2.dart';
import 'dropdown.interfaces.dart';
import 'package:node_shims/js.dart';
import 'dart:html';
import 'dart:async';
import 'package:ng2_strap/dropdown/dropdown.interfaces.dart';
import 'package:angular2/angular2.ng_deps.dart' as i0;
import 'dropdown.interfaces.ng_deps.dart' as i1;
import 'package:ng2_strap/dropdown/dropdown.interfaces.ng_deps.dart' as i2;
export 'index.dart';
var _visited = false;
void initReflector() {
if (_visited) return; _visited = true;
_ngRef.reflector
..registerType(Dropdown, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"[class.dropdown]" : "true", "[class.open]" : "isOpen"}, inputs: const ["isOpen", "autoClose", "keyboardNav", "dropdownAppendToBody"], outputs: const ["onToggle"], selector: "[dropdown]")],
const [const [ElementRef]],
(ElementRef el) => new Dropdown(el),
const [OnInit, OnDestroy])
)
..registerType(DropdownMenu, new _ngRef.ReflectionInfo(
const [const Directive(inputs: const ["templateUrl"], selector: "[dropdown-menu], .dropdown-menu")],
const [const [Dropdown, const Host()], const [ElementRef]],
(Dropdown dropdown, ElementRef el) => new DropdownMenu(dropdown, el),
const [DropdownMenuInterface, OnInit])
)
..registerType(DropdownToggle, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"(click)" : "toggleDropdown(\$event)", "[class.dropdown-toggle]" : "true", "[class.disabled]" : "disabled", "[attr.aria-haspopup]" : "true", "[attr.aria-expanded]" : "isOpen"}, inputs: const ["disabled"], selector: "[dropdown-toggle]")],
const [const [Dropdown, const Host()], const [ElementRef]],
(Dropdown dropdown, ElementRef el) => new DropdownToggle(dropdown, el),
const [DropdownToggleInterface, OnInit])
)
..registerType(KeyboardNav, new _ngRef.ReflectionInfo(
const [const Directive(host: const {"(keydown)" : "onKeydown(\$event)"}, selector: "[dropdown][keyboard-nav]")],
const [const [Dropdown], const [ElementRef]],
(Dropdown dd, ElementRef el) => new KeyboardNav(dd, el))
)
..registerGetters({'onToggle': (o) => o.onToggle})
..registerSetters({'isOpen': (o, v) => o.isOpen = v, 'autoClose': (o, v) => o.autoClose = v, 'keyboardNav': (o, v) => o.keyboardNav = v, 'dropdownAppendToBody': (o, v) => o.dropdownAppendToBody = v, 'templateUrl': (o, v) => o.templateUrl = v, 'disabled': (o, v) => o.disabled = v})
;
i0.initReflector();
i1.initReflector();
i2.initReflector();
}
