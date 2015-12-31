library asset_ng2_strap_lib_timepicker_timepicker.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/timepicker/timepicker.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_class.dart' as import3;
import 'package:angular2/src/common/forms/directives/ng_model.dart' as import4;
import 'package:angular2/src/common/forms/directives/default_value_accessor.dart' as import5;
import 'package:angular2/src/common/forms/directives/ng_control_status.dart' as import6;
import 'package:angular2/src/common/forms/directives/validators.dart' as import7;


      class _Timepicker_0 extends import0.AbstractChangeDetector<import1.Timepicker> {
        var operation_negate1, mapFnhidden2, literal3, DoCheck4, noIncrementHours5, mapFndisabled6, literal7, DoCheck8, noIncrementMinutes9, mapFndisabled10, self11, DoCheck12, operation_negate14, mapFnhidden15, DoCheck16, invalidHours17, mapFnhaserror18, literal19, DoCheck20, readonlyInput21, hours22, OnChanges23, ngClassInvalid24, ngClassTouched25, ngClassUntouched26, ngClassValid27, ngClassDirty28, ngClassPristine29, invalidMinutes30, mapFnhaserror31, self32, DoCheck33, self34, minutes35, OnChanges36, ngClassInvalid37, ngClassTouched38, ngClassUntouched39, ngClassValid40, ngClassDirty41, ngClassPristine42, self43, mapFnhidden44, DoCheck45, noToggleMeridian46, mapFndisabled47, literal48, DoCheck49, meridian50, interpolate51, mapFnhidden52, self53, DoCheck54, noDecrementHours55, mapFndisabled56, self57, DoCheck58, noDecrementMinutes59, mapFndisabled60, self61, DoCheck62, self63, mapFnhidden64, DoCheck65, directive_0_0, directive_1_0, directive_2_0, directive_3_0, directive_4_0, directive_5_0, directive_5_1, directive_5_2, directive_5_3, directive_6_0, directive_7_0, directive_7_1, directive_7_2, directive_7_3, directive_8_0, directive_9_0, directive_10_0, directive_11_0, directive_12_0, directive_13_0;

        _Timepicker_0(dispatcher)
          : super("Timepicker_0",
              dispatcher, 66,
              _Timepicker_0._gen_propertyBindingTargets,
              _Timepicker_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_showSpinners0,l_operation_negate1,c_operation_negate1,l_mapFnhidden2,l_literal3,l_DoCheck4,l_noIncrementHours5,c_noIncrementHours5,l_mapFndisabled6,l_literal7,l_DoCheck8,l_noIncrementMinutes9,c_noIncrementMinutes9,l_mapFndisabled10,l_self11,l_DoCheck12,l_showMeridian13,l_operation_negate14,c_operation_negate14,l_mapFnhidden15,l_DoCheck16,l_invalidHours17,c_invalidHours17,l_mapFnhaserror18,l_literal19,l_DoCheck20,l_readonlyInput21,l_hours22,l_OnChanges23,l_ngClassInvalid24,l_ngClassTouched25,l_ngClassUntouched26,l_ngClassValid27,l_ngClassDirty28,l_ngClassPristine29,l_invalidMinutes30,c_invalidMinutes30,l_mapFnhaserror31,l_self32,l_DoCheck33,l_self34,l_minutes35,l_OnChanges36,l_ngClassInvalid37,l_ngClassTouched38,l_ngClassUntouched39,l_ngClassValid40,l_ngClassDirty41,l_ngClassPristine42,l_self43,l_mapFnhidden44,l_DoCheck45,l_noToggleMeridian46,c_noToggleMeridian46,l_mapFndisabled47,l_literal48,l_DoCheck49,l_meridian50,c_meridian50,l_interpolate51,l_mapFnhidden52,l_self53,l_DoCheck54,l_noDecrementHours55,c_noDecrementHours55,l_mapFndisabled56,l_self57,l_DoCheck58,l_noDecrementMinutes59,c_noDecrementMinutes59,l_mapFndisabled60,l_self61,l_DoCheck62,l_self63,l_mapFnhidden64,l_DoCheck65;c_operation_negate1=c_noIncrementHours5=c_noIncrementMinutes9=c_operation_negate14=c_invalidHours17=c_invalidMinutes30=c_noToggleMeridian46=c_meridian50=c_noDecrementHours55=c_noDecrementMinutes59 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_showSpinners0 = l_context.showSpinners;
    
      
      
          
            l_operation_negate1 = import0.ChangeDetectionUtil.operation_negate(l_showSpinners0);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_negate1, this.operation_negate1)) {
        c_operation_negate1 = true;
        
        
        this.operation_negate1 = l_operation_negate1;
      }
    
      
      
          
      if (c_operation_negate1) {       l_mapFnhidden2 = import0.ChangeDetectionUtil.mapFn(["hidden"])(l_operation_negate1);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnhidden2, this.mapFnhidden2)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnhidden2, l_mapFnhidden2);
      }
    
      this.directive_0_0.rawClass = l_mapFnhidden2;
      
      isChanged = true;
    
        
        this.mapFnhidden2 = l_mapFnhidden2;
      }
     }
      
      
          this.propertyBindingIndex = 1;
            l_literal3 = "text-center";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal3, this.literal3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal3, l_literal3);
      }
    
      this.directive_0_0.initialClasses = l_literal3;
      
      isChanged = true;
    
        
        this.literal3 = l_literal3;
      }
    
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 3;
            l_noIncrementHours5 = l_context.noIncrementHours();
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_noIncrementHours5, this.noIncrementHours5)) {
        c_noIncrementHours5 = true;
        
        
        this.noIncrementHours5 = l_noIncrementHours5;
      }
    
      
      
          
      if (c_noIncrementHours5) {       l_mapFndisabled6 = import0.ChangeDetectionUtil.mapFn(["disabled"])(l_noIncrementHours5);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabled6, this.mapFndisabled6)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabled6, l_mapFndisabled6);
      }
    
      this.directive_1_0.rawClass = l_mapFndisabled6;
      
      isChanged = true;
    
        
        this.mapFndisabled6 = l_mapFndisabled6;
      }
     }
      
      
          this.propertyBindingIndex = 4;
            l_literal7 = "btn btn-link";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal7, this.literal7)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal7, l_literal7);
      }
    
      this.directive_1_0.initialClasses = l_literal7;
      
      isChanged = true;
    
        
        this.literal7 = l_literal7;
      }
    
      
      
          
      if (!throwOnChange) this.directive_1_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 6;
            l_noIncrementMinutes9 = l_context.noIncrementMinutes();
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_noIncrementMinutes9, this.noIncrementMinutes9)) {
        c_noIncrementMinutes9 = true;
        
        
        this.noIncrementMinutes9 = l_noIncrementMinutes9;
      }
    
      
      
          
      if (c_noIncrementMinutes9) {       l_mapFndisabled10 = import0.ChangeDetectionUtil.mapFn(["disabled"])(l_noIncrementMinutes9);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabled10, this.mapFndisabled10)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabled10, l_mapFndisabled10);
      }
    
      this.directive_2_0.rawClass = l_mapFndisabled10;
      
      isChanged = true;
    
        
        this.mapFndisabled10 = l_mapFndisabled10;
      }
     }
      
      
          this.propertyBindingIndex = 7;
            l_self11 = l_literal7;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self11, this.self11)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self11, l_self11);
      }
    
      this.directive_2_0.initialClasses = l_self11;
      
      isChanged = true;
    
        
        this.self11 = l_self11;
      }
    
      
      
          
      if (!throwOnChange) this.directive_2_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 9;
            l_showMeridian13 = l_context.showMeridian;
    
      
      
          
            l_operation_negate14 = import0.ChangeDetectionUtil.operation_negate(l_showMeridian13);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_negate14, this.operation_negate14)) {
        c_operation_negate14 = true;
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_negate14, l_operation_negate14);
      }
    
      this.notifyDispatcher(l_operation_negate14);
      
    
        
        this.operation_negate14 = l_operation_negate14;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 10;
      if (c_operation_negate14) {       l_mapFnhidden15 = import0.ChangeDetectionUtil.mapFn(["hidden"])(l_operation_negate14);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnhidden15, this.mapFnhidden15)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnhidden15, l_mapFnhidden15);
      }
    
      this.directive_3_0.rawClass = l_mapFnhidden15;
      
      isChanged = true;
    
        
        this.mapFnhidden15 = l_mapFnhidden15;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_3_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 12;
            l_invalidHours17 = l_context.invalidHours;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_invalidHours17, this.invalidHours17)) {
        c_invalidHours17 = true;
        
        
        this.invalidHours17 = l_invalidHours17;
      }
    
      
      
          
      if (c_invalidHours17) {       l_mapFnhaserror18 = import0.ChangeDetectionUtil.mapFn(["has-error"])(l_invalidHours17);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnhaserror18, this.mapFnhaserror18)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnhaserror18, l_mapFnhaserror18);
      }
    
      this.directive_4_0.rawClass = l_mapFnhaserror18;
      
      isChanged = true;
    
        
        this.mapFnhaserror18 = l_mapFnhaserror18;
      }
     }
      
      
          this.propertyBindingIndex = 13;
            l_literal19 = "form-group";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal19, this.literal19)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal19, l_literal19);
      }
    
      this.directive_4_0.initialClasses = l_literal19;
      
      isChanged = true;
    
        
        this.literal19 = l_literal19;
      }
    
      
      
          
      if (!throwOnChange) this.directive_4_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 15;
            l_readonlyInput21 = l_context.readonlyInput;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_readonlyInput21, this.readonlyInput21)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.readonlyInput21, l_readonlyInput21);
      }
    
      this.notifyDispatcher(l_readonlyInput21);
      
    
        
        this.readonlyInput21 = l_readonlyInput21;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 16;
            l_hours22 = l_context.hours;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_hours22, this.hours22)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.hours22, l_hours22);
      }
    
      this.directive_5_0.model = l_hours22;
      
      isChanged = true;
    
        changes = addChange(changes, this.hours22, l_hours22);
        this.hours22 = l_hours22;
      }
    
      
      
          
      if (!throwOnChange && changes != null) this.directive_5_0.ngOnChanges(changes);
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 18;
            l_ngClassInvalid24 = this.directive_5_2.ngClassInvalid;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassInvalid24, this.ngClassInvalid24)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassInvalid24, l_ngClassInvalid24);
      }
    
      this.notifyDispatcher(l_ngClassInvalid24);
      
    
        
        this.ngClassInvalid24 = l_ngClassInvalid24;
      }
    
      
      
          this.propertyBindingIndex = 19;
            l_ngClassTouched25 = this.directive_5_2.ngClassTouched;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassTouched25, this.ngClassTouched25)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassTouched25, l_ngClassTouched25);
      }
    
      this.notifyDispatcher(l_ngClassTouched25);
      
    
        
        this.ngClassTouched25 = l_ngClassTouched25;
      }
    
      
      
          this.propertyBindingIndex = 20;
            l_ngClassUntouched26 = this.directive_5_2.ngClassUntouched;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassUntouched26, this.ngClassUntouched26)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassUntouched26, l_ngClassUntouched26);
      }
    
      this.notifyDispatcher(l_ngClassUntouched26);
      
    
        
        this.ngClassUntouched26 = l_ngClassUntouched26;
      }
    
      
      
          this.propertyBindingIndex = 21;
            l_ngClassValid27 = this.directive_5_2.ngClassValid;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassValid27, this.ngClassValid27)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassValid27, l_ngClassValid27);
      }
    
      this.notifyDispatcher(l_ngClassValid27);
      
    
        
        this.ngClassValid27 = l_ngClassValid27;
      }
    
      
      
          this.propertyBindingIndex = 22;
            l_ngClassDirty28 = this.directive_5_2.ngClassDirty;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassDirty28, this.ngClassDirty28)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassDirty28, l_ngClassDirty28);
      }
    
      this.notifyDispatcher(l_ngClassDirty28);
      
    
        
        this.ngClassDirty28 = l_ngClassDirty28;
      }
    
      
      
          this.propertyBindingIndex = 23;
            l_ngClassPristine29 = this.directive_5_2.ngClassPristine;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassPristine29, this.ngClassPristine29)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassPristine29, l_ngClassPristine29);
      }
    
      this.notifyDispatcher(l_ngClassPristine29);
      
    
        
        this.ngClassPristine29 = l_ngClassPristine29;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 24;
            l_invalidMinutes30 = l_context.invalidMinutes;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_invalidMinutes30, this.invalidMinutes30)) {
        c_invalidMinutes30 = true;
        
        
        this.invalidMinutes30 = l_invalidMinutes30;
      }
    
      
      
          
      if (c_invalidMinutes30) {       l_mapFnhaserror31 = import0.ChangeDetectionUtil.mapFn(["has-error"])(l_invalidMinutes30);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnhaserror31, this.mapFnhaserror31)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnhaserror31, l_mapFnhaserror31);
      }
    
      this.directive_6_0.rawClass = l_mapFnhaserror31;
      
      isChanged = true;
    
        
        this.mapFnhaserror31 = l_mapFnhaserror31;
      }
     }
      
      
          this.propertyBindingIndex = 25;
            l_self32 = l_literal19;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self32, this.self32)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self32, l_self32);
      }
    
      this.directive_6_0.initialClasses = l_self32;
      
      isChanged = true;
    
        
        this.self32 = l_self32;
      }
    
      
      
          
      if (!throwOnChange) this.directive_6_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 27;
            l_self34 = l_readonlyInput21;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self34, this.self34)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self34, l_self34);
      }
    
      this.notifyDispatcher(l_self34);
      
    
        
        this.self34 = l_self34;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 28;
            l_minutes35 = l_context.minutes;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_minutes35, this.minutes35)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.minutes35, l_minutes35);
      }
    
      this.directive_7_0.model = l_minutes35;
      
      isChanged = true;
    
        changes = addChange(changes, this.minutes35, l_minutes35);
        this.minutes35 = l_minutes35;
      }
    
      
      
          
      if (!throwOnChange && changes != null) this.directive_7_0.ngOnChanges(changes);
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 30;
            l_ngClassInvalid37 = this.directive_7_2.ngClassInvalid;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassInvalid37, this.ngClassInvalid37)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassInvalid37, l_ngClassInvalid37);
      }
    
      this.notifyDispatcher(l_ngClassInvalid37);
      
    
        
        this.ngClassInvalid37 = l_ngClassInvalid37;
      }
    
      
      
          this.propertyBindingIndex = 31;
            l_ngClassTouched38 = this.directive_7_2.ngClassTouched;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassTouched38, this.ngClassTouched38)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassTouched38, l_ngClassTouched38);
      }
    
      this.notifyDispatcher(l_ngClassTouched38);
      
    
        
        this.ngClassTouched38 = l_ngClassTouched38;
      }
    
      
      
          this.propertyBindingIndex = 32;
            l_ngClassUntouched39 = this.directive_7_2.ngClassUntouched;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassUntouched39, this.ngClassUntouched39)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassUntouched39, l_ngClassUntouched39);
      }
    
      this.notifyDispatcher(l_ngClassUntouched39);
      
    
        
        this.ngClassUntouched39 = l_ngClassUntouched39;
      }
    
      
      
          this.propertyBindingIndex = 33;
            l_ngClassValid40 = this.directive_7_2.ngClassValid;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassValid40, this.ngClassValid40)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassValid40, l_ngClassValid40);
      }
    
      this.notifyDispatcher(l_ngClassValid40);
      
    
        
        this.ngClassValid40 = l_ngClassValid40;
      }
    
      
      
          this.propertyBindingIndex = 34;
            l_ngClassDirty41 = this.directive_7_2.ngClassDirty;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassDirty41, this.ngClassDirty41)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassDirty41, l_ngClassDirty41);
      }
    
      this.notifyDispatcher(l_ngClassDirty41);
      
    
        
        this.ngClassDirty41 = l_ngClassDirty41;
      }
    
      
      
          this.propertyBindingIndex = 35;
            l_ngClassPristine42 = this.directive_7_2.ngClassPristine;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassPristine42, this.ngClassPristine42)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassPristine42, l_ngClassPristine42);
      }
    
      this.notifyDispatcher(l_ngClassPristine42);
      
    
        
        this.ngClassPristine42 = l_ngClassPristine42;
      }
    
      
      
          this.propertyBindingIndex = 36;
            l_self43 = l_operation_negate14;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self43, this.self43)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self43, l_self43);
      }
    
      this.notifyDispatcher(l_self43);
      
    
        
        this.self43 = l_self43;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 37;
      if (c_operation_negate14) {       l_mapFnhidden44 = import0.ChangeDetectionUtil.mapFn(["hidden"])(l_operation_negate14);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnhidden44, this.mapFnhidden44)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnhidden44, l_mapFnhidden44);
      }
    
      this.directive_8_0.rawClass = l_mapFnhidden44;
      
      isChanged = true;
    
        
        this.mapFnhidden44 = l_mapFnhidden44;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_8_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 39;
            l_noToggleMeridian46 = l_context.noToggleMeridian();
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_noToggleMeridian46, this.noToggleMeridian46)) {
        c_noToggleMeridian46 = true;
        
        
        this.noToggleMeridian46 = l_noToggleMeridian46;
      }
    
      
      
          
      if (c_noToggleMeridian46) {       l_mapFndisabled47 = import0.ChangeDetectionUtil.mapFn(["disabled"])(l_noToggleMeridian46);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabled47, this.mapFndisabled47)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabled47, l_mapFndisabled47);
      }
    
      this.directive_9_0.rawClass = l_mapFndisabled47;
      
      isChanged = true;
    
        
        this.mapFndisabled47 = l_mapFndisabled47;
      }
     }
      
      
          this.propertyBindingIndex = 40;
            l_literal48 = "btn btn-default text-center";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal48, this.literal48)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal48, l_literal48);
      }
    
      this.directive_9_0.initialClasses = l_literal48;
      
      isChanged = true;
    
        
        this.literal48 = l_literal48;
      }
    
      
      
          
      if (!throwOnChange) this.directive_9_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 42;
            l_meridian50 = l_context.meridian;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_meridian50, this.meridian50)) {
        c_meridian50 = true;
        
        
        this.meridian50 = l_meridian50;
      }
    
      
      
          
      if (c_meridian50) {       l_interpolate51 = "${""}${import0.ChangeDetectionUtil.s(l_meridian50)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate51, this.interpolate51)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate51, l_interpolate51);
      }
    
      this.notifyDispatcher(l_interpolate51);
      
    
        
        this.interpolate51 = l_interpolate51;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 43;
      if (c_operation_negate1) {       l_mapFnhidden52 = import0.ChangeDetectionUtil.mapFn(["hidden"])(l_operation_negate1);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnhidden52, this.mapFnhidden52)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnhidden52, l_mapFnhidden52);
      }
    
      this.directive_10_0.rawClass = l_mapFnhidden52;
      
      isChanged = true;
    
        
        this.mapFnhidden52 = l_mapFnhidden52;
      }
     }
      
      
          this.propertyBindingIndex = 44;
            l_self53 = l_literal3;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self53, this.self53)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self53, l_self53);
      }
    
      this.directive_10_0.initialClasses = l_self53;
      
      isChanged = true;
    
        
        this.self53 = l_self53;
      }
    
      
      
          
      if (!throwOnChange) this.directive_10_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 46;
            l_noDecrementHours55 = l_context.noDecrementHours();
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_noDecrementHours55, this.noDecrementHours55)) {
        c_noDecrementHours55 = true;
        
        
        this.noDecrementHours55 = l_noDecrementHours55;
      }
    
      
      
          
      if (c_noDecrementHours55) {       l_mapFndisabled56 = import0.ChangeDetectionUtil.mapFn(["disabled"])(l_noDecrementHours55);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabled56, this.mapFndisabled56)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabled56, l_mapFndisabled56);
      }
    
      this.directive_11_0.rawClass = l_mapFndisabled56;
      
      isChanged = true;
    
        
        this.mapFndisabled56 = l_mapFndisabled56;
      }
     }
      
      
          this.propertyBindingIndex = 47;
            l_self57 = l_literal7;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self57, this.self57)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self57, l_self57);
      }
    
      this.directive_11_0.initialClasses = l_self57;
      
      isChanged = true;
    
        
        this.self57 = l_self57;
      }
    
      
      
          
      if (!throwOnChange) this.directive_11_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 49;
            l_noDecrementMinutes59 = l_context.noDecrementMinutes();
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_noDecrementMinutes59, this.noDecrementMinutes59)) {
        c_noDecrementMinutes59 = true;
        
        
        this.noDecrementMinutes59 = l_noDecrementMinutes59;
      }
    
      
      
          
      if (c_noDecrementMinutes59) {       l_mapFndisabled60 = import0.ChangeDetectionUtil.mapFn(["disabled"])(l_noDecrementMinutes59);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabled60, this.mapFndisabled60)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabled60, l_mapFndisabled60);
      }
    
      this.directive_12_0.rawClass = l_mapFndisabled60;
      
      isChanged = true;
    
        
        this.mapFndisabled60 = l_mapFndisabled60;
      }
     }
      
      
          this.propertyBindingIndex = 50;
            l_self61 = l_literal7;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self61, this.self61)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self61, l_self61);
      }
    
      this.directive_12_0.initialClasses = l_self61;
      
      isChanged = true;
    
        
        this.self61 = l_self61;
      }
    
      
      
          
      if (!throwOnChange) this.directive_12_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 52;
            l_self63 = l_operation_negate14;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self63, this.self63)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self63, l_self63);
      }
    
      this.notifyDispatcher(l_self63);
      
    
        
        this.self63 = l_self63;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 53;
      if (c_operation_negate14) {       l_mapFnhidden64 = import0.ChangeDetectionUtil.mapFn(["hidden"])(l_operation_negate14);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnhidden64, this.mapFnhidden64)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnhidden64, l_mapFnhidden64);
      }
    
      this.directive_13_0.rawClass = l_mapFnhidden64;
      
      isChanged = true;
    
        
        this.mapFnhidden64 = l_mapFnhidden64;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_13_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_incrementHours0_0,l_incrementMinutes0_1,l_event0_2,l_hours1_2,l_updateHours0_3,l_event0_4,l_hoursOnBlur1_4,l_event0_5,l_target1_5,l_value2_5,l_onChange3_5,l_onTouched0_6,l_event0_7,l_minutes1_7,l_updateMinutes0_8,l_event0_9,l_minutesOnBlur1_9,l_event0_10,l_target1_10,l_value2_10,l_onChange3_10,l_onTouched0_11,l_toggleMeridian0_12,l_decrementHours0_13,l_decrementMinutes0_14;
              if (eventName == "click" && elIndex == 1) {
    l_incrementHours0_0 = l_context.incrementHours();

if (l_incrementHours0_0 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 2) {
    l_incrementMinutes0_1 = l_context.incrementMinutes();

if (l_incrementMinutes0_1 == false) { preventDefault = true; }
    }
    if (eventName == "ngModelChange" && elIndex == 5) {
    l_event0_2 = locals.get(r'$event');
l_hours1_2 = l_context.hours = l_event0_2;

if (l_hours1_2 == false) { preventDefault = true; }
    }
    if (eventName == "change" && elIndex == 5) {
    l_updateHours0_3 = l_context.updateHours();

if (l_updateHours0_3 == false) { preventDefault = true; }
    }
    if (eventName == "blur" && elIndex == 5) {
    l_event0_4 = locals.get(r'$event');
l_hoursOnBlur1_4 = l_context.hoursOnBlur(l_event0_4);

if (l_hoursOnBlur1_4 == false) { preventDefault = true; }
    }
    if (eventName == "input" && elIndex == 5) {
    l_event0_5 = locals.get(r'$event');
l_target1_5 = l_event0_5.target;
l_value2_5 = l_target1_5.value;
l_onChange3_5 = this.directive_5_1.onChange(l_value2_5);

if (l_onChange3_5 == false) { preventDefault = true; }
    }
    if (eventName == "blur" && elIndex == 5) {
    l_onTouched0_6 = this.directive_5_1.onTouched();

if (l_onTouched0_6 == false) { preventDefault = true; }
    }
    if (eventName == "ngModelChange" && elIndex == 7) {
    l_event0_7 = locals.get(r'$event');
l_minutes1_7 = l_context.minutes = l_event0_7;

if (l_minutes1_7 == false) { preventDefault = true; }
    }
    if (eventName == "change" && elIndex == 7) {
    l_updateMinutes0_8 = l_context.updateMinutes();

if (l_updateMinutes0_8 == false) { preventDefault = true; }
    }
    if (eventName == "blur" && elIndex == 7) {
    l_event0_9 = locals.get(r'$event');
l_minutesOnBlur1_9 = l_context.minutesOnBlur(l_event0_9);

if (l_minutesOnBlur1_9 == false) { preventDefault = true; }
    }
    if (eventName == "input" && elIndex == 7) {
    l_event0_10 = locals.get(r'$event');
l_target1_10 = l_event0_10.target;
l_value2_10 = l_target1_10.value;
l_onChange3_10 = this.directive_7_1.onChange(l_value2_10);

if (l_onChange3_10 == false) { preventDefault = true; }
    }
    if (eventName == "blur" && elIndex == 7) {
    l_onTouched0_11 = this.directive_7_1.onTouched();

if (l_onTouched0_11 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 9) {
    l_toggleMeridian0_12 = l_context.toggleMeridian();

if (l_toggleMeridian0_12 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 11) {
    l_decrementHours0_13 = l_context.decrementHours();

if (l_decrementHours0_13 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 12) {
    l_decrementMinutes0_14 = l_context.decrementMinutes();

if (l_decrementMinutes0_14 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_1_0 = this.getDirectiveFor(directives, 1);
this.directive_2_0 = this.getDirectiveFor(directives, 2);
this.directive_3_0 = this.getDirectiveFor(directives, 3);
this.directive_4_0 = this.getDirectiveFor(directives, 4);
this.directive_5_0 = this.getDirectiveFor(directives, 5);
this.directive_5_1 = this.getDirectiveFor(directives, 6);
this.directive_5_2 = this.getDirectiveFor(directives, 7);
this.directive_5_3 = this.getDirectiveFor(directives, 8);
this.directive_6_0 = this.getDirectiveFor(directives, 9);
this.directive_7_0 = this.getDirectiveFor(directives, 10);
this.directive_7_1 = this.getDirectiveFor(directives, 11);
this.directive_7_2 = this.getDirectiveFor(directives, 12);
this.directive_7_3 = this.getDirectiveFor(directives, 13);
this.directive_8_0 = this.getDirectiveFor(directives, 14);
this.directive_9_0 = this.getDirectiveFor(directives, 15);
this.directive_10_0 = this.getDirectiveFor(directives, 16);
this.directive_11_0 = this.getDirectiveFor(directives, 17);
this.directive_12_0 = this.getDirectiveFor(directives, 18);
this.directive_13_0 = this.getDirectiveFor(directives, 19);  }

        void dehydrateDirectives(destroyPipes) {  this.operation_negate1 = this.mapFnhidden2 = this.literal3 = this.DoCheck4 = this.noIncrementHours5 = this.mapFndisabled6 = this.literal7 = this.DoCheck8 = this.noIncrementMinutes9 = this.mapFndisabled10 = this.self11 = this.DoCheck12 = this.operation_negate14 = this.mapFnhidden15 = this.DoCheck16 = this.invalidHours17 = this.mapFnhaserror18 = this.literal19 = this.DoCheck20 = this.readonlyInput21 = this.hours22 = this.OnChanges23 = this.ngClassInvalid24 = this.ngClassTouched25 = this.ngClassUntouched26 = this.ngClassValid27 = this.ngClassDirty28 = this.ngClassPristine29 = this.invalidMinutes30 = this.mapFnhaserror31 = this.self32 = this.DoCheck33 = this.self34 = this.minutes35 = this.OnChanges36 = this.ngClassInvalid37 = this.ngClassTouched38 = this.ngClassUntouched39 = this.ngClassValid40 = this.ngClassDirty41 = this.ngClassPristine42 = this.self43 = this.mapFnhidden44 = this.DoCheck45 = this.noToggleMeridian46 = this.mapFndisabled47 = this.literal48 = this.DoCheck49 = this.meridian50 = this.interpolate51 = this.mapFnhidden52 = this.self53 = this.DoCheck54 = this.noDecrementHours55 = this.mapFndisabled56 = this.self57 = this.DoCheck58 = this.noDecrementMinutes59 = this.mapFndisabled60 = this.self61 = this.DoCheck62 = this.self63 = this.mapFnhidden64 = this.DoCheck65 = this.directive_0_0 = this.directive_1_0 = this.directive_2_0 = this.directive_3_0 = this.directive_4_0 = this.directive_5_0 = this.directive_5_1 = this.directive_5_2 = this.directive_5_3 = this.directive_6_0 = this.directive_7_0 = this.directive_7_1 = this.directive_7_2 = this.directive_7_3 = this.directive_8_0 = this.directive_9_0 = this.directive_10_0 = this.directive_11_0 = this.directive_12_0 = this.directive_13_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 1, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 2, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 2, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("elementProperty", 3, "hidden", null, "!showMeridian in Timepicker@6:50"), import0.ChangeDetectionUtil.bindingTarget("directive", 3, "rawClass", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 4, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 4, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("elementProperty", 5, "readOnly", null, "readonlyInput in Timepicker@10:129"), import0.ChangeDetectionUtil.bindingTarget("directive", 5, "model", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("elementClass", 5, "ng-invalid", null, "ngClassInvalid in Timepicker@10:12"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 5, "ng-touched", null, "ngClassTouched in Timepicker@10:12"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 5, "ng-untouched", null, "ngClassUntouched in Timepicker@10:12"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 5, "ng-valid", null, "ngClassValid in Timepicker@10:12"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 5, "ng-dirty", null, "ngClassDirty in Timepicker@10:12"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 5, "ng-pristine", null, "ngClassPristine in Timepicker@10:12"), import0.ChangeDetectionUtil.bindingTarget("directive", 6, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 6, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("elementProperty", 7, "readOnly", null, "readonlyInput in Timepicker@14:133"), import0.ChangeDetectionUtil.bindingTarget("directive", 7, "model", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("elementClass", 7, "ng-invalid", null, "ngClassInvalid in Timepicker@14:12"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 7, "ng-touched", null, "ngClassTouched in Timepicker@14:12"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 7, "ng-untouched", null, "ngClassUntouched in Timepicker@14:12"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 7, "ng-valid", null, "ngClassValid in Timepicker@14:12"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 7, "ng-dirty", null, "ngClassDirty in Timepicker@14:12"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 7, "ng-pristine", null, "ngClassPristine in Timepicker@14:12"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 8, "hidden", null, "!showMeridian in Timepicker@16:50"), import0.ChangeDetectionUtil.bindingTarget("directive", 8, "rawClass", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 9, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 9, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{meridian}} in Timepicker@16:203"), import0.ChangeDetectionUtil.bindingTarget("directive", 10, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 10, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 11, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 11, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 12, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 12, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("elementProperty", 13, "hidden", null, "!showMeridian in Timepicker@22:50"), import0.ChangeDetectionUtil.bindingTarget("directive", 13, "rawClass", null, "AST"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(1, 0), import0.ChangeDetectionUtil.directiveIndex(2, 0), import0.ChangeDetectionUtil.directiveIndex(3, 0), import0.ChangeDetectionUtil.directiveIndex(4, 0), import0.ChangeDetectionUtil.directiveIndex(5, 0), import0.ChangeDetectionUtil.directiveIndex(5, 1), import0.ChangeDetectionUtil.directiveIndex(5, 2), import0.ChangeDetectionUtil.directiveIndex(5, 3), import0.ChangeDetectionUtil.directiveIndex(6, 0), import0.ChangeDetectionUtil.directiveIndex(7, 0), import0.ChangeDetectionUtil.directiveIndex(7, 1), import0.ChangeDetectionUtil.directiveIndex(7, 2), import0.ChangeDetectionUtil.directiveIndex(7, 3), import0.ChangeDetectionUtil.directiveIndex(8, 0), import0.ChangeDetectionUtil.directiveIndex(9, 0), import0.ChangeDetectionUtil.directiveIndex(10, 0), import0.ChangeDetectionUtil.directiveIndex(11, 0), import0.ChangeDetectionUtil.directiveIndex(12, 0), import0.ChangeDetectionUtil.directiveIndex(13, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Timepicker_0(a);
        }
      }
    

      class _HostTimepicker_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostTimepicker_0(dispatcher)
          : super("HostTimepicker_0",
              dispatcher, 1,
              _HostTimepicker_0._gen_propertyBindingTargets,
              _HostTimepicker_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_OnInit0;
          var isChanged = false;
          var changes = null;

                
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_0_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.OnInit0 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _HostTimepicker_0(a);
        }
      }
    
const TimepickerTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/timepicker/timepicker.dart|Timepicker',_Timepicker_0.newChangeDetector,const [const import2.TextCmd('    ', false, null),const import2.BeginElementCmd('table', const [], const [], const [], const [], false, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('tbody', const [], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('tr', const ['class','text-center'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('td', const [], const [], const [], const [], false, null),const import2.BeginElementCmd('a', const ['class','btn btn-link'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.BeginElementCmd('span', const ['class','glyphicon glyphicon-chevron-up'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('td', const [], const [], const [], const [], false, null),const import2.TextCmd(' ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('td', const [], const [], const [], const [], false, null),const import2.BeginElementCmd('a', const ['class','btn btn-link'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.BeginElementCmd('span', const ['class','glyphicon glyphicon-chevron-up'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('td', const [], const [], const [], const [import3.NgClass], true, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('tr', const [], const [], const [], const [], false, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('td', const ['class','form-group'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n            ', false, null),const import2.BeginElementCmd('input', const ['class','form-control text-center','maxlength','2','style','width:50px;','type','text'], const [null,'ngModelChange',null,'change',null,'blur',null,'input'], const [], const [import4.NgModel,import5.DefaultValueAccessor,import6.NgControlStatus,import7.MaxLengthValidator], true, null),const import2.EndElementCmd(),const import2.TextCmd('\n          ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('td', const [], const [], const [], const [], false, null),const import2.TextCmd(':', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('td', const ['class','form-group'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n            ', false, null),const import2.BeginElementCmd('input', const ['class','form-control text-center','maxlength','2','style','width:50px;','type','text'], const [null,'ngModelChange',null,'change',null,'blur',null,'input'], const [], const [import4.NgModel,import5.DefaultValueAccessor,import6.NgControlStatus,import7.MaxLengthValidator], true, null),const import2.EndElementCmd(),const import2.TextCmd('\n          ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('td', const [], const [], const [], const [import3.NgClass], true, null),const import2.BeginElementCmd('button', const ['class','btn btn-default text-center','type','button'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('tr', const ['class','text-center'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('td', const [], const [], const [], const [], false, null),const import2.BeginElementCmd('a', const ['class','btn btn-link'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.BeginElementCmd('span', const ['class','glyphicon glyphicon-chevron-down'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('td', const [], const [], const [], const [], false, null),const import2.TextCmd(' ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('td', const [], const [], const [], const [], false, null),const import2.BeginElementCmd('a', const ['class','btn btn-link'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.BeginElementCmd('span', const ['class','glyphicon glyphicon-chevron-down'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('td', const [], const [], const [], const [import3.NgClass], true, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const []);
TimepickerTemplateGetter() => TimepickerTemplate;
const HostTimepickerTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/timepicker/timepicker.dart|HostTimepicker',_HostTimepicker_0.newChangeDetector,const [const import2.BeginComponentCmd('timepicker', const ['ngModel',''], const [], const [], const [import1.Timepicker], import2.ViewEncapsulation.None, null, TimepickerTemplateGetter),const import2.EndComponentCmd()],const []));
HostTimepickerTemplateGetter() => HostTimepickerTemplate;
