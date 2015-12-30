library angular2.src.common.forms.directives.select_control_value_accessor;

import "package:angular2/core.dart"
    show Query, Directive, Renderer, Self, Provider, ElementRef, QueryList;
import "package:angular2/src/facade/async.dart" show ObservableWrapper;
import "control_value_accessor.dart"
    show NG_VALUE_ACCESSOR, ControlValueAccessor;

const SELECT_VALUE_ACCESSOR = const Provider(NG_VALUE_ACCESSOR,
    useExisting: SelectControlValueAccessor, multi: true);

/**
 * Marks `<option>` as dynamic, so Angular can be notified when options change.
 *
 * ### Example
 *
 * ```
 * <select ngControl="city">
 *   <option *ngFor="#c of cities" [value]="c"></option>
 * </select>
 * ```
 */
@Directive(selector: "option")
class NgSelectOption {}

/**
 * The accessor for writing a value and listening to changes on a select element.
 */
@Directive(
    selector: "select[ngControl],select[ngFormControl],select[ngModel]",
    host: const {
      "(change)": "onChange(\$event.target.value)",
      "(input)": "onChange(\$event.target.value)",
      "(blur)": "onTouched()"
    },
    bindings: const [SELECT_VALUE_ACCESSOR])
class SelectControlValueAccessor implements ControlValueAccessor {
  Renderer _renderer;
  ElementRef _elementRef;
  String value;
  var onChange = (_) {};
  var onTouched = () {};
  SelectControlValueAccessor(
      this._renderer,
      this._elementRef,
      @Query(NgSelectOption, descendants: true)
      QueryList<NgSelectOption> query) {
    this._updateValueWhenListOfOptionsChanges(query);
  }
  void writeValue(dynamic value) {
    this.value = value;
    this._renderer.setElementProperty(this._elementRef, "value", value);
  }

  void registerOnChange(dynamic /* () => any */ fn) {
    this.onChange = fn;
  }

  void registerOnTouched(dynamic /* () => any */ fn) {
    this.onTouched = fn;
  }

  _updateValueWhenListOfOptionsChanges(QueryList<NgSelectOption> query) {
    ObservableWrapper.subscribe(
        query.changes, (_) => this.writeValue(this.value));
  }
}
