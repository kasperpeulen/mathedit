library asset_ng2_strap_lib_datepicker_index.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/datepicker/index.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_class.dart' as import3;
import 'package:angular2/src/common/directives/ng_if.dart' as import4;
import 'package:angular2/src/common/forms/directives/ng_model.dart' as import5;
import 'package:angular2/src/common/forms/directives/ng_control_status.dart' as import6;
import 'package:ng2_strap/datepicker/datepicker-inner.dart' as import7;
import 'package:ng2_strap/datepicker/datepicker-inner.template.dart' as import8;
import 'package:ng2_strap/datepicker/daypicker.dart' as import9;
import 'package:ng2_strap/datepicker/daypicker.template.dart' as import10;
import 'package:ng2_strap/datepicker/monthpicker.dart' as import11;
import 'package:ng2_strap/datepicker/monthpicker.template.dart' as import12;
import 'package:ng2_strap/datepicker/yearpicker.dart' as import13;
import 'package:ng2_strap/datepicker/yearpicker.template.dart' as import14;


      class _PopupContainer_0 extends import0.AbstractChangeDetector<import1.PopupContainer> {
        var top0, left1, display2, mapFntopleftdisplay3, classMap4, literal5, DoCheck6, popupComp7, showButtonBar8, directive_0_0, directive_1_0, directive_2_0;

        _PopupContainer_0(dispatcher)
          : super("PopupContainer_0",
              dispatcher, 9,
              _PopupContainer_0._gen_propertyBindingTargets,
              _PopupContainer_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_top0,c_top0,l_left1,c_left1,l_display2,c_display2,l_mapFntopleftdisplay3,l_classMap4,l_literal5,l_DoCheck6,l_popupComp7,l_showButtonBar8;c_top0=c_left1=c_display2 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_top0 = l_context.top;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_top0, this.top0)) {
        c_top0 = true;
        
        
        this.top0 = l_top0;
      }
    
      
      
          
            l_left1 = l_context.left;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_left1, this.left1)) {
        c_left1 = true;
        
        
        this.left1 = l_left1;
      }
    
      
      
          
            l_display2 = l_context.display;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_display2, this.display2)) {
        c_display2 = true;
        
        
        this.display2 = l_display2;
      }
    
      
      
          
      if (c_top0 || c_left1 || c_display2) {       l_mapFntopleftdisplay3 = import0.ChangeDetectionUtil.mapFn(["top", "left", "display"])(l_top0, l_left1, l_display2);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFntopleftdisplay3, this.mapFntopleftdisplay3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFntopleftdisplay3, l_mapFntopleftdisplay3);
      }
    
      this.notifyDispatcher(l_mapFntopleftdisplay3);
      
    
        
        this.mapFntopleftdisplay3 = l_mapFntopleftdisplay3;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 1;
            l_classMap4 = l_context.classMap;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_classMap4, this.classMap4)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.classMap4, l_classMap4);
      }
    
      this.directive_0_0.rawClass = l_classMap4;
      
      isChanged = true;
    
        
        this.classMap4 = l_classMap4;
      }
    
      
      
          this.propertyBindingIndex = 2;
            l_literal5 = "dropdown-menu";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal5, this.literal5)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal5, l_literal5);
      }
    
      this.directive_0_0.initialClasses = l_literal5;
      
      isChanged = true;
    
        
        this.literal5 = l_literal5;
      }
    
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 4;
            l_popupComp7 = l_context.popupComp;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_popupComp7, this.popupComp7)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.popupComp7, l_popupComp7);
      }
    
      this.directive_1_0.ngIf = l_popupComp7;
      
      isChanged = true;
    
        
        this.popupComp7 = l_popupComp7;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 5;
            l_showButtonBar8 = l_context.showButtonBar;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_showButtonBar8, this.showButtonBar8)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.showButtonBar8, l_showButtonBar8);
      }
    
      this.directive_2_0.ngIf = l_showButtonBar8;
      
      isChanged = true;
    
        
        this.showButtonBar8 = l_showButtonBar8;
      }
    
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_1_0 = this.getDirectiveFor(directives, 1);
this.directive_2_0 = this.getDirectiveFor(directives, 2);  }

        void dehydrateDirectives(destroyPipes) {  this.top0 = this.left1 = this.display2 = this.mapFntopleftdisplay3 = this.classMap4 = this.literal5 = this.DoCheck6 = this.popupComp7 = this.showButtonBar8 = this.directive_0_0 = this.directive_1_0 = this.directive_2_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "ng-style", null, "{top: top, left: left, display: display} in PopupContainer@2:8"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 1, "ngIf", null, "popupComp in PopupContainer@5:54"), import0.ChangeDetectionUtil.bindingTarget("directive", 2, "ngIf", null, "showButtonBar in PopupContainer@7:12")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(1, 0), import0.ChangeDetectionUtil.directiveIndex(2, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _PopupContainer_0(a);
        }
      }
    

      class _PopupContainer_1 extends import0.AbstractChangeDetector<import1.PopupContainer> {
        var literal0, model3, OnChanges4, ngClassInvalid5, ngClassTouched6, ngClassUntouched7, ngClassValid8, ngClassDirty9, ngClassPristine10, directive_0_0, directive_0_1;

        _PopupContainer_1(dispatcher)
          : super("PopupContainer_1",
              dispatcher, 11,
              _PopupContainer_1._gen_propertyBindingTargets,
              _PopupContainer_1._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_literal0,l_popupComp1,l_cd2,l_model3,l_OnChanges4,l_ngClassInvalid5,l_ngClassTouched6,l_ngClassUntouched7,l_ngClassValid8,l_ngClassDirty9,l_ngClassPristine10;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_literal0 = true;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal0, this.literal0)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal0, l_literal0);
      }
    
      this.notifyDispatcher(l_literal0);
      
    
        
        this.literal0 = l_literal0;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 1;
            l_popupComp1 = l_context.popupComp;
    
      
      
          
            l_cd2 = l_popupComp1.cd;
    
      
      
          
            l_model3 = l_cd2.model;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_model3, this.model3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.model3, l_model3);
      }
    
      this.directive_0_0.model = l_model3;
      
      isChanged = true;
    
        changes = addChange(changes, this.model3, l_model3);
        this.model3 = l_model3;
      }
    
      
      
          
      if (!throwOnChange && changes != null) this.directive_0_0.ngOnChanges(changes);
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 3;
            l_ngClassInvalid5 = this.directive_0_1.ngClassInvalid;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassInvalid5, this.ngClassInvalid5)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassInvalid5, l_ngClassInvalid5);
      }
    
      this.notifyDispatcher(l_ngClassInvalid5);
      
    
        
        this.ngClassInvalid5 = l_ngClassInvalid5;
      }
    
      
      
          this.propertyBindingIndex = 4;
            l_ngClassTouched6 = this.directive_0_1.ngClassTouched;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassTouched6, this.ngClassTouched6)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassTouched6, l_ngClassTouched6);
      }
    
      this.notifyDispatcher(l_ngClassTouched6);
      
    
        
        this.ngClassTouched6 = l_ngClassTouched6;
      }
    
      
      
          this.propertyBindingIndex = 5;
            l_ngClassUntouched7 = this.directive_0_1.ngClassUntouched;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassUntouched7, this.ngClassUntouched7)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassUntouched7, l_ngClassUntouched7);
      }
    
      this.notifyDispatcher(l_ngClassUntouched7);
      
    
        
        this.ngClassUntouched7 = l_ngClassUntouched7;
      }
    
      
      
          this.propertyBindingIndex = 6;
            l_ngClassValid8 = this.directive_0_1.ngClassValid;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassValid8, this.ngClassValid8)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassValid8, l_ngClassValid8);
      }
    
      this.notifyDispatcher(l_ngClassValid8);
      
    
        
        this.ngClassValid8 = l_ngClassValid8;
      }
    
      
      
          this.propertyBindingIndex = 7;
            l_ngClassDirty9 = this.directive_0_1.ngClassDirty;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassDirty9, this.ngClassDirty9)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassDirty9, l_ngClassDirty9);
      }
    
      this.notifyDispatcher(l_ngClassDirty9);
      
    
        
        this.ngClassDirty9 = l_ngClassDirty9;
      }
    
      
      
          this.propertyBindingIndex = 8;
            l_ngClassPristine10 = this.directive_0_1.ngClassPristine;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassPristine10, this.ngClassPristine10)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassPristine10, l_ngClassPristine10);
      }
    
      this.notifyDispatcher(l_ngClassPristine10);
      
    
        
        this.ngClassPristine10 = l_ngClassPristine10;
      }
    
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_event0_0,l_onUpdate1_0,l_popupComp0_1,l_cd1_1,l_event2_1,l_model3_1;
              if (eventName == "cupdate" && elIndex == 0) {
    l_event0_0 = locals.get(r'$event');
l_onUpdate1_0 = l_context.onUpdate(l_event0_0);

if (l_onUpdate1_0 == false) { preventDefault = true; }
    }
    if (eventName == "ngModelChange" && elIndex == 0) {
    l_popupComp0_1 = l_context.popupComp;
l_cd1_1 = l_popupComp0_1.cd;
l_event2_1 = locals.get(r'$event');
l_model3_1 = l_cd1_1.model = l_event2_1;

if (l_model3_1 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_0_1 = this.getDirectiveFor(directives, 1);  }

        void dehydrateDirectives(destroyPipes) {  this.literal0 = this.model3 = this.OnChanges4 = this.ngClassInvalid5 = this.ngClassTouched6 = this.ngClassUntouched7 = this.ngClassValid8 = this.ngClassDirty9 = this.ngClassPristine10 = this.directive_0_0 = this.directive_0_1 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "show-weeks", null, "true in PopupContainer@5:105"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "model", null, "popupComp.cd.model in PopupContainer@5:72"), null, import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "ng-invalid", null, "ngClassInvalid in PopupContainer@5:13"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "ng-touched", null, "ngClassTouched in PopupContainer@5:13"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "ng-untouched", null, "ngClassUntouched in PopupContainer@5:13"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "ng-valid", null, "ngClassValid in PopupContainer@5:13"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "ng-dirty", null, "ngClassDirty in PopupContainer@5:13"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "ng-pristine", null, "ngClassPristine in PopupContainer@5:13")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(0, 1)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _PopupContainer_1(a);
        }
      }
    

      class _PopupContainer_2 extends import0.AbstractChangeDetector<import1.PopupContainer> {
        var currentText0, interpolate1, clearText2, interpolate3, closeText4, interpolate5;

        _PopupContainer_2(dispatcher)
          : super("PopupContainer_2",
              dispatcher, 6,
              _PopupContainer_2._gen_propertyBindingTargets,
              _PopupContainer_2._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_currentText0,c_currentText0,l_interpolate1,l_clearText2,c_clearText2,l_interpolate3,l_closeText4,c_closeText4,l_interpolate5;c_currentText0=c_clearText2=c_closeText4 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_currentText0 = l_context.currentText;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_currentText0, this.currentText0)) {
        c_currentText0 = true;
        
        
        this.currentText0 = l_currentText0;
      }
    
      
      
          
      if (c_currentText0) {       l_interpolate1 = "${""}${import0.ChangeDetectionUtil.s(l_currentText0)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate1, this.interpolate1)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate1, l_interpolate1);
      }
    
      this.notifyDispatcher(l_interpolate1);
      
    
        
        this.interpolate1 = l_interpolate1;
      }
     }
      
      
          this.propertyBindingIndex = 1;
            l_clearText2 = l_context.clearText;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_clearText2, this.clearText2)) {
        c_clearText2 = true;
        
        
        this.clearText2 = l_clearText2;
      }
    
      
      
          
      if (c_clearText2) {       l_interpolate3 = "${""}${import0.ChangeDetectionUtil.s(l_clearText2)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate3, this.interpolate3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate3, l_interpolate3);
      }
    
      this.notifyDispatcher(l_interpolate3);
      
    
        
        this.interpolate3 = l_interpolate3;
      }
     }
      
      
          this.propertyBindingIndex = 2;
            l_closeText4 = l_context.closeText;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_closeText4, this.closeText4)) {
        c_closeText4 = true;
        
        
        this.closeText4 = l_closeText4;
      }
    
      
      
          
      if (c_closeText4) {       l_interpolate5 = "${""}${import0.ChangeDetectionUtil.s(l_closeText4)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate5, this.interpolate5)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate5, l_interpolate5);
      }
    
      this.notifyDispatcher(l_interpolate5);
      
    
        
        this.interpolate5 = l_interpolate5;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_literal0_0,l_select1_0,l_literal0_1,l_select1_1,l_close0_2;
              if (eventName == "click" && elIndex == 0) {
    l_literal0_0 = "today";
l_select1_0 = l_context.select(l_literal0_0);

if (l_select1_0 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 1) {
    l_literal0_1 = null;
l_select1_1 = l_context.select(l_literal0_1);

if (l_select1_1 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 2) {
    l_close0_2 = l_context.close();

if (l_close0_2 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        

        void dehydrateDirectives(destroyPipes) {  this.currentText0 = this.interpolate1 = this.clearText2 = this.interpolate3 = this.closeText4 = this.interpolate5 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{ currentText }} in PopupContainer@9:127"), import0.ChangeDetectionUtil.bindingTarget("textNode", 1, null, null, "{{ clearText }} in PopupContainer@10:92"), import0.ChangeDetectionUtil.bindingTarget("textNode", 2, null, null, "{{ closeText }} in PopupContainer@12:94")];

        static final _gen_directiveIndices = [];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _PopupContainer_2(a);
        }
      }
    

      class _HostPopupContainer_0 extends import0.AbstractChangeDetector<dynamic> {
        var directive_0_0;

        _HostPopupContainer_0(dispatcher)
          : super("HostPopupContainer_0",
              dispatcher, 0,
              _HostPopupContainer_0._gen_propertyBindingTargets,
              _HostPopupContainer_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context;
          var isChanged = false;
          var changes = null;

          
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _HostPopupContainer_0(a);
        }
      }
    

      class _DatePicker_0 extends import0.AbstractChangeDetector<import1.DatePicker> {
        var datepickerMode0, minMode1, maxMode2, showWeeks3, activeDate4, initDate5, minDate6, maxDate7, formatDay8, formatMonth9, formatYear10, formatDayHeader11, formatDayTitle12, formatMonthTitle13, startingDay14, yearRange15, shortcutPropagation16, customClass17, dateDisabled18, templateUrl19, OnInit20, OnInit21, OnInit22, OnInit23, directive_0_0, directive_1_0, directive_2_0, directive_3_0;

        _DatePicker_0(dispatcher)
          : super("DatePicker_0",
              dispatcher, 24,
              _DatePicker_0._gen_propertyBindingTargets,
              _DatePicker_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_datepickerMode0,l_minMode1,l_maxMode2,l_showWeeks3,l_activeDate4,l_initDate5,l_minDate6,l_maxDate7,l_formatDay8,l_formatMonth9,l_formatYear10,l_formatDayHeader11,l_formatDayTitle12,l_formatMonthTitle13,l_startingDay14,l_yearRange15,l_shortcutPropagation16,l_customClass17,l_dateDisabled18,l_templateUrl19,l_OnInit20,l_OnInit21,l_OnInit22,l_OnInit23;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_datepickerMode0 = l_context.datepickerMode;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_datepickerMode0, this.datepickerMode0)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.datepickerMode0, l_datepickerMode0);
      }
    
      this.notifyDispatcher(l_datepickerMode0);
      
    
        
        this.datepickerMode0 = l_datepickerMode0;
      }
    
      
      
          this.propertyBindingIndex = 1;
            l_minMode1 = l_context.minMode;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_minMode1, this.minMode1)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.minMode1, l_minMode1);
      }
    
      this.notifyDispatcher(l_minMode1);
      
    
        
        this.minMode1 = l_minMode1;
      }
    
      
      
          this.propertyBindingIndex = 2;
            l_maxMode2 = l_context.maxMode;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_maxMode2, this.maxMode2)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.maxMode2, l_maxMode2);
      }
    
      this.notifyDispatcher(l_maxMode2);
      
    
        
        this.maxMode2 = l_maxMode2;
      }
    
      
      
          this.propertyBindingIndex = 3;
            l_showWeeks3 = l_context.showWeeks;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_showWeeks3, this.showWeeks3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.showWeeks3, l_showWeeks3);
      }
    
      this.notifyDispatcher(l_showWeeks3);
      
    
        
        this.showWeeks3 = l_showWeeks3;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 4;
            l_activeDate4 = l_context.activeDate;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_activeDate4, this.activeDate4)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.activeDate4, l_activeDate4);
      }
    
      this.directive_0_0.activeDate = l_activeDate4;
      
      isChanged = true;
    
        
        this.activeDate4 = l_activeDate4;
      }
    
      
      
          this.propertyBindingIndex = 5;
            l_initDate5 = l_context.initDate;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_initDate5, this.initDate5)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.initDate5, l_initDate5);
      }
    
      this.directive_0_0.initDate = l_initDate5;
      
      isChanged = true;
    
        
        this.initDate5 = l_initDate5;
      }
    
      
      
          this.propertyBindingIndex = 6;
            l_minDate6 = l_context.minDate;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_minDate6, this.minDate6)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.minDate6, l_minDate6);
      }
    
      this.directive_0_0.minDate = l_minDate6;
      
      isChanged = true;
    
        
        this.minDate6 = l_minDate6;
      }
    
      
      
          this.propertyBindingIndex = 7;
            l_maxDate7 = l_context.maxDate;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_maxDate7, this.maxDate7)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.maxDate7, l_maxDate7);
      }
    
      this.directive_0_0.maxDate = l_maxDate7;
      
      isChanged = true;
    
        
        this.maxDate7 = l_maxDate7;
      }
    
      
      
          this.propertyBindingIndex = 8;
            l_formatDay8 = l_context.formatDay;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_formatDay8, this.formatDay8)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.formatDay8, l_formatDay8);
      }
    
      this.directive_0_0.formatDay = l_formatDay8;
      
      isChanged = true;
    
        
        this.formatDay8 = l_formatDay8;
      }
    
      
      
          this.propertyBindingIndex = 9;
            l_formatMonth9 = l_context.formatMonth;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_formatMonth9, this.formatMonth9)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.formatMonth9, l_formatMonth9);
      }
    
      this.directive_0_0.formatMonth = l_formatMonth9;
      
      isChanged = true;
    
        
        this.formatMonth9 = l_formatMonth9;
      }
    
      
      
          this.propertyBindingIndex = 10;
            l_formatYear10 = l_context.formatYear;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_formatYear10, this.formatYear10)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.formatYear10, l_formatYear10);
      }
    
      this.directive_0_0.formatYear = l_formatYear10;
      
      isChanged = true;
    
        
        this.formatYear10 = l_formatYear10;
      }
    
      
      
          this.propertyBindingIndex = 11;
            l_formatDayHeader11 = l_context.formatDayHeader;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_formatDayHeader11, this.formatDayHeader11)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.formatDayHeader11, l_formatDayHeader11);
      }
    
      this.directive_0_0.formatDayHeader = l_formatDayHeader11;
      
      isChanged = true;
    
        
        this.formatDayHeader11 = l_formatDayHeader11;
      }
    
      
      
          this.propertyBindingIndex = 12;
            l_formatDayTitle12 = l_context.formatDayTitle;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_formatDayTitle12, this.formatDayTitle12)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.formatDayTitle12, l_formatDayTitle12);
      }
    
      this.directive_0_0.formatDayTitle = l_formatDayTitle12;
      
      isChanged = true;
    
        
        this.formatDayTitle12 = l_formatDayTitle12;
      }
    
      
      
          this.propertyBindingIndex = 13;
            l_formatMonthTitle13 = l_context.formatMonthTitle;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_formatMonthTitle13, this.formatMonthTitle13)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.formatMonthTitle13, l_formatMonthTitle13);
      }
    
      this.directive_0_0.formatMonthTitle = l_formatMonthTitle13;
      
      isChanged = true;
    
        
        this.formatMonthTitle13 = l_formatMonthTitle13;
      }
    
      
      
          this.propertyBindingIndex = 14;
            l_startingDay14 = l_context.startingDay;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_startingDay14, this.startingDay14)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.startingDay14, l_startingDay14);
      }
    
      this.directive_0_0.startingDay = l_startingDay14;
      
      isChanged = true;
    
        
        this.startingDay14 = l_startingDay14;
      }
    
      
      
          this.propertyBindingIndex = 15;
            l_yearRange15 = l_context.yearRange;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_yearRange15, this.yearRange15)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.yearRange15, l_yearRange15);
      }
    
      this.directive_0_0.yearRange = l_yearRange15;
      
      isChanged = true;
    
        
        this.yearRange15 = l_yearRange15;
      }
    
      
      
          this.propertyBindingIndex = 16;
            l_shortcutPropagation16 = l_context.shortcutPropagation;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_shortcutPropagation16, this.shortcutPropagation16)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.shortcutPropagation16, l_shortcutPropagation16);
      }
    
      this.directive_0_0.shortcutPropagation = l_shortcutPropagation16;
      
      isChanged = true;
    
        
        this.shortcutPropagation16 = l_shortcutPropagation16;
      }
    
      
      
          this.propertyBindingIndex = 17;
            l_customClass17 = l_context.customClass;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_customClass17, this.customClass17)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.customClass17, l_customClass17);
      }
    
      this.directive_0_0.customClass = l_customClass17;
      
      isChanged = true;
    
        
        this.customClass17 = l_customClass17;
      }
    
      
      
          this.propertyBindingIndex = 18;
            l_dateDisabled18 = l_context.dateDisabled;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_dateDisabled18, this.dateDisabled18)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.dateDisabled18, l_dateDisabled18);
      }
    
      this.directive_0_0.dateDisabled = l_dateDisabled18;
      
      isChanged = true;
    
        
        this.dateDisabled18 = l_dateDisabled18;
      }
    
      
      
          this.propertyBindingIndex = 19;
            l_templateUrl19 = l_context.templateUrl;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_templateUrl19, this.templateUrl19)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.templateUrl19, l_templateUrl19);
      }
    
      this.directive_0_0.templateUrl = l_templateUrl19;
      
      isChanged = true;
    
        
        this.templateUrl19 = l_templateUrl19;
      }
    
      
      
          
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_0_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
          
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_1_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
          
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_2_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
          
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_3_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_event0_0,l_onUpdate1_0;
              if (eventName == "update" && elIndex == 0) {
    l_event0_0 = locals.get(r'$event');
l_onUpdate1_0 = l_context.onUpdate(l_event0_0);

if (l_onUpdate1_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_1_0 = this.getDirectiveFor(directives, 1);
this.directive_2_0 = this.getDirectiveFor(directives, 2);
this.directive_3_0 = this.getDirectiveFor(directives, 3);  }

        void dehydrateDirectives(destroyPipes) {  this.datepickerMode0 = this.minMode1 = this.maxMode2 = this.showWeeks3 = this.activeDate4 = this.initDate5 = this.minDate6 = this.maxDate7 = this.formatDay8 = this.formatMonth9 = this.formatYear10 = this.formatDayHeader11 = this.formatDayTitle12 = this.formatMonthTitle13 = this.startingDay14 = this.yearRange15 = this.shortcutPropagation16 = this.customClass17 = this.dateDisabled18 = this.templateUrl19 = this.OnInit20 = this.OnInit21 = this.OnInit22 = this.OnInit23 = this.directive_0_0 = this.directive_1_0 = this.directive_2_0 = this.directive_3_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "datepicker-mode", null, "datepickerMode in DatePicker@2:22"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "minDode", null, "minMode in DatePicker@6:22"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "maxDode", null, "maxMode in DatePicker@7:22"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "showDeeks", null, "showWeeks in DatePicker@8:22"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "activeDate", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initDate", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "minDate", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "maxDate", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "formatDay", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "formatMonth", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "formatYear", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "formatDayHeader", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "formatDayTitle", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "formatMonthTitle", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "startingDay", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "yearRange", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "shortcutPropagation", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "customClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "dateDisabled", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "templateUrl", null, "AST"), null, null, null, null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(1, 0), import0.ChangeDetectionUtil.directiveIndex(2, 0), import0.ChangeDetectionUtil.directiveIndex(3, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _DatePicker_0(a);
        }
      }
    

      class _HostDatePicker_0 extends import0.AbstractChangeDetector<dynamic> {
        var directive_0_0;

        _HostDatePicker_0(dispatcher)
          : super("HostDatePicker_0",
              dispatcher, 0,
              _HostDatePicker_0._gen_propertyBindingTargets,
              _HostDatePicker_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context;
          var isChanged = false;
          var changes = null;

          
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _HostDatePicker_0(a);
        }
      }
    
const PopupContainerTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/datepicker/index.dart|PopupContainer',_PopupContainer_0.newChangeDetector,const [const import2.TextCmd('    ', false, null),const import2.BeginElementCmd('ul', const ['class','dropdown-menu','style','display: block'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('li', const [], const [], const [], const [], false, null),const import2.TextCmd('\n             ', false, null),const import2.EmbeddedTemplateCmd(const [], const [], const [import4.NgIf], false, null, _PopupContainer_1.newChangeDetector, const [const import2.BeginElementCmd('datepicker', const [], const [null,'cupdate',null,'ngModelChange'], const [], const [import5.NgModel,import6.NgControlStatus], true, null),const import2.EndElementCmd()]),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EmbeddedTemplateCmd(const [], const [], const [import4.NgIf], false, null, _PopupContainer_2.newChangeDetector, const [const import2.BeginElementCmd('li', const ['style','padding:10px 9px 2px'], const [], const [], const [], false, null),const import2.TextCmd('\n            ', false, null),const import2.BeginElementCmd('span', const ['class','btn-group pull-left'], const [], const [], const [], false, null),const import2.TextCmd('\n                 ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-sm btn-info','ng-disabled','isDisabled(\'today\')','type','button'], const [null,'click'], const [], const [], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n                 ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-sm btn-danger','type','button'], const [null,'click'], const [], const [], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n            ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n            ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-sm btn-success pull-right','type','button'], const [null,'click'], const [], const [], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd()],const []);
PopupContainerTemplateGetter() => PopupContainerTemplate;
const HostPopupContainerTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/datepicker/index.dart|HostPopupContainer',_HostPopupContainer_0.newChangeDetector,const [const import2.BeginComponentCmd('popup-container', const [], const [], const [], const [import1.PopupContainer], import2.ViewEncapsulation.None, null, PopupContainerTemplateGetter),const import2.EndComponentCmd()],const []));
HostPopupContainerTemplateGetter() => HostPopupContainerTemplate;
const DatePickerTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/datepicker/index.dart|DatePicker',_DatePicker_0.newChangeDetector,const [const import2.TextCmd('    ', false, null),const import2.BeginComponentCmd('n2s-datepicker-inner', const [], const [null,'update'], const [], const [import7.DatePickerInner], import2.ViewEncapsulation.None, null, import8.DatePickerInnerTemplateGetter),const import2.TextCmd('\n      ', false, 0),const import2.BeginComponentCmd('n2s-daypicker', const ['tabindex','0'], const [], const [], const [import9.DayPicker], import2.ViewEncapsulation.None, 0, import10.DayPickerTemplateGetter),const import2.EndComponentCmd(),const import2.TextCmd('\n      ', false, 0),const import2.BeginComponentCmd('n2s-monthpicker', const ['tabindex','0'], const [], const [], const [import11.MonthPicker], import2.ViewEncapsulation.None, 0, import12.MonthPickerTemplateGetter),const import2.EndComponentCmd(),const import2.TextCmd('\n      ', false, 0),const import2.BeginComponentCmd('n2s-yearpicker', const ['tabindex','0'], const [], const [], const [import13.YearPicker], import2.ViewEncapsulation.None, 0, import14.YearPickerTemplateGetter),const import2.EndComponentCmd(),const import2.TextCmd('\n    ', false, 0),const import2.EndComponentCmd(),const import2.TextCmd('\n    ', false, null)],const []);
DatePickerTemplateGetter() => DatePickerTemplate;
const HostDatePickerTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/datepicker/index.dart|HostDatePicker',_HostDatePicker_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-datepicker', const [], const [], const [], const [import1.DatePicker], import2.ViewEncapsulation.None, null, DatePickerTemplateGetter),const import2.EndComponentCmd()],const []));
HostDatePickerTemplateGetter() => HostDatePickerTemplate;
