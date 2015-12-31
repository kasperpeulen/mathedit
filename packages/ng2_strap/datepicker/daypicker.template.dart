library asset_ng2_strap_lib_datepicker_daypicker.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/datepicker/daypicker.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_class.dart' as import3;
import 'package:angular2/src/common/directives/ng_for.dart' as import4;


      class _DayPicker_0 extends import0.AbstractChangeDetector<import1.DayPicker> {
        var operation_not_equals3, operation_negate5, operation_add8, literal9, mapFndisabled10, literal11, DoCheck12, monthTitle13, interpolate14, self15, self16, operation_equals18, mapFndisabled19, self20, DoCheck21, yearTitle22, interpolate23, self24, labels25, DoCheck26, rows27, DoCheck28, directive_3_0, directive_5_0, directive_8_0, directive_9_0;

        _DayPicker_0(dispatcher)
          : super("DayPicker_0",
              dispatcher, 29,
              _DayPicker_0._gen_propertyBindingTargets,
              _DayPicker_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_datePicker0,l_datepickerMode1,l_literal2,l_operation_not_equals3,l_showWeeks4,l_operation_negate5,l_uniqueId6,l_literal7,l_operation_add8,l_literal9,c_literal9,l_mapFndisabled10,l_literal11,l_DoCheck12,l_monthTitle13,c_monthTitle13,l_interpolate14,l_self15,l_self16,l_maxMode17,l_operation_equals18,c_operation_equals18,l_mapFndisabled19,l_self20,l_DoCheck21,l_yearTitle22,c_yearTitle22,l_interpolate23,l_self24,l_labels25,l_DoCheck26,l_rows27,l_DoCheck28;c_literal9=c_monthTitle13=c_operation_equals18=c_yearTitle22 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_datePicker0 = l_context.datePicker;
    
      
      
          
            l_datepickerMode1 = l_datePicker0.datepickerMode;
    
      
      
          
            l_literal2 = "day";
    
      
      
          
            l_operation_not_equals3 = import0.ChangeDetectionUtil.operation_not_equals(l_datepickerMode1, l_literal2);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_not_equals3, this.operation_not_equals3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_not_equals3, l_operation_not_equals3);
      }
    
      this.notifyDispatcher(l_operation_not_equals3);
      
    
        
        this.operation_not_equals3 = l_operation_not_equals3;
      }
    
      
      
          this.propertyBindingIndex = 1;
            l_showWeeks4 = l_datePicker0.showWeeks;
    
      
      
          
            l_operation_negate5 = import0.ChangeDetectionUtil.operation_negate(l_showWeeks4);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_negate5, this.operation_negate5)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_negate5, l_operation_negate5);
      }
    
      this.notifyDispatcher(l_operation_negate5);
      
    
        
        this.operation_negate5 = l_operation_negate5;
      }
    
      
      
          this.propertyBindingIndex = 2;
            l_uniqueId6 = l_datePicker0.uniqueId;
    
      
      
          
            l_literal7 = "-title";
    
      
      
          
            l_operation_add8 = import0.ChangeDetectionUtil.operation_add(l_uniqueId6, l_literal7);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_add8, this.operation_add8)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_add8, l_operation_add8);
      }
    
      this.notifyDispatcher(l_operation_add8);
      
    
        
        this.operation_add8 = l_operation_add8;
      }
    
      
      
          this.propertyBindingIndex = 3;
            l_literal9 = false;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal9, this.literal9)) {
        c_literal9 = true;
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal9, l_literal9);
      }
    
      this.notifyDispatcher(l_literal9);
      
    
        
        this.literal9 = l_literal9;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 4;
      if (c_literal9) {       l_mapFndisabled10 = import0.ChangeDetectionUtil.mapFn(["disabled"])(l_literal9);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabled10, this.mapFndisabled10)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabled10, l_mapFndisabled10);
      }
    
      this.directive_3_0.rawClass = l_mapFndisabled10;
      
      isChanged = true;
    
        
        this.mapFndisabled10 = l_mapFndisabled10;
      }
     }
      
      
          this.propertyBindingIndex = 5;
            l_literal11 = "btn btn-default btn-secondary btn-sm";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal11, this.literal11)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal11, l_literal11);
      }
    
      this.directive_3_0.initialClasses = l_literal11;
      
      isChanged = true;
    
        
        this.literal11 = l_literal11;
      }
    
      
      
          
      if (!throwOnChange) this.directive_3_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 7;
            l_monthTitle13 = l_context.monthTitle;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_monthTitle13, this.monthTitle13)) {
        c_monthTitle13 = true;
        
        
        this.monthTitle13 = l_monthTitle13;
      }
    
      
      
          
      if (c_monthTitle13) {       l_interpolate14 = "${""}${import0.ChangeDetectionUtil.s(l_monthTitle13)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate14, this.interpolate14)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate14, l_interpolate14);
      }
    
      this.notifyDispatcher(l_interpolate14);
      
    
        
        this.interpolate14 = l_interpolate14;
      }
     }
      
      
          this.propertyBindingIndex = 8;
            l_self15 = l_operation_negate5;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self15, this.self15)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self15, l_self15);
      }
    
      this.notifyDispatcher(l_self15);
      
    
        
        this.self15 = l_self15;
      }
    
      
      
          this.propertyBindingIndex = 9;
            l_self16 = l_operation_add8;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self16, this.self16)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self16, l_self16);
      }
    
      this.notifyDispatcher(l_self16);
      
    
        
        this.self16 = l_self16;
      }
    
      
      
          this.propertyBindingIndex = 10;
            l_maxMode17 = l_context.maxMode;
    
      
      
          
            l_operation_equals18 = import0.ChangeDetectionUtil.operation_equals(l_datepickerMode1, l_maxMode17);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_equals18, this.operation_equals18)) {
        c_operation_equals18 = true;
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_equals18, l_operation_equals18);
      }
    
      this.notifyDispatcher(l_operation_equals18);
      
    
        
        this.operation_equals18 = l_operation_equals18;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 11;
      if (c_operation_equals18) {       l_mapFndisabled19 = import0.ChangeDetectionUtil.mapFn(["disabled"])(l_operation_equals18);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabled19, this.mapFndisabled19)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabled19, l_mapFndisabled19);
      }
    
      this.directive_5_0.rawClass = l_mapFndisabled19;
      
      isChanged = true;
    
        
        this.mapFndisabled19 = l_mapFndisabled19;
      }
     }
      
      
          this.propertyBindingIndex = 12;
            l_self20 = l_literal11;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self20, this.self20)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self20, l_self20);
      }
    
      this.directive_5_0.initialClasses = l_self20;
      
      isChanged = true;
    
        
        this.self20 = l_self20;
      }
    
      
      
          
      if (!throwOnChange) this.directive_5_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 14;
            l_yearTitle22 = l_context.yearTitle;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_yearTitle22, this.yearTitle22)) {
        c_yearTitle22 = true;
        
        
        this.yearTitle22 = l_yearTitle22;
      }
    
      
      
          
      if (c_yearTitle22) {       l_interpolate23 = "${""}${import0.ChangeDetectionUtil.s(l_yearTitle22)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate23, this.interpolate23)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate23, l_interpolate23);
      }
    
      this.notifyDispatcher(l_interpolate23);
      
    
        
        this.interpolate23 = l_interpolate23;
      }
     }
      
      
          this.propertyBindingIndex = 15;
            l_self24 = l_operation_negate5;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self24, this.self24)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self24, l_self24);
      }
    
      this.notifyDispatcher(l_self24);
      
    
        
        this.self24 = l_self24;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 16;
            l_labels25 = l_context.labels;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_labels25, this.labels25)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.labels25, l_labels25);
      }
    
      this.directive_8_0.ngForOf = l_labels25;
      
      isChanged = true;
    
        
        this.labels25 = l_labels25;
      }
    
      
      
          
      if (!throwOnChange) this.directive_8_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 18;
            l_rows27 = l_context.rows;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_rows27, this.rows27)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.rows27, l_rows27);
      }
    
      this.directive_9_0.ngForOf = l_rows27;
      
      isChanged = true;
    
        
        this.rows27 = l_rows27;
      }
    
      
      
          
      if (!throwOnChange) this.directive_9_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_datePicker0_0,l_literal1_0,l_literal2_0,l_operation_subtract3_0,l_move4_0,l_datePicker0_1,l_toggleMode1_1,l_datePicker0_2,l_literal1_2,l_toggleMode2_2,l_datePicker0_3,l_literal1_3,l_move2_3;
              if (eventName == "click" && elIndex == 1) {
    l_datePicker0_0 = l_context.datePicker;
l_literal1_0 = 0;
l_literal2_0 = 1;
l_operation_subtract3_0 = import0.ChangeDetectionUtil.operation_subtract(l_literal1_0, l_literal2_0);
l_move4_0 = l_datePicker0_0.move(l_operation_subtract3_0);

if (l_move4_0 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 3) {
    l_datePicker0_1 = l_context.datePicker;
l_toggleMode1_1 = l_datePicker0_1.toggleMode();

if (l_toggleMode1_1 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 5) {
    l_datePicker0_2 = l_context.datePicker;
l_literal1_2 = 2;
l_toggleMode2_2 = l_datePicker0_2.toggleMode(l_literal1_2);

if (l_toggleMode2_2 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 6) {
    l_datePicker0_3 = l_context.datePicker;
l_literal1_3 = 1;
l_move2_3 = l_datePicker0_3.move(l_literal1_3);

if (l_move2_3 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_3_0 = this.getDirectiveFor(directives, 0);
this.directive_5_0 = this.getDirectiveFor(directives, 1);
this.directive_8_0 = this.getDirectiveFor(directives, 2);
this.directive_9_0 = this.getDirectiveFor(directives, 3);  }

        void dehydrateDirectives(destroyPipes) {  this.operation_not_equals3 = this.operation_negate5 = this.operation_add8 = this.literal9 = this.mapFndisabled10 = this.literal11 = this.DoCheck12 = this.monthTitle13 = this.interpolate14 = this.self15 = this.self16 = this.operation_equals18 = this.mapFndisabled19 = this.self20 = this.DoCheck21 = this.yearTitle22 = this.interpolate23 = this.self24 = this.labels25 = this.DoCheck26 = this.rows27 = this.DoCheck28 = this.directive_3_0 = this.directive_5_0 = this.directive_8_0 = this.directive_9_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "hidden", null, "datePicker.datepickerMode != 'day' in DayPicker@0:7"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 2, "hidden", null, "!datePicker.showWeeks in DayPicker@8:22"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 3, "id", null, "datePicker.uniqueId + '-title' in DayPicker@9:16"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 3, "disabled", null, "false in DayPicker@13:16"), import0.ChangeDetectionUtil.bindingTarget("directive", 3, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 3, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{monthTitle}} in DayPicker@15:18"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 4, "hidden", null, "!datePicker.showWeeks in DayPicker@18:22"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 5, "id", null, "datePicker.uniqueId + '-title' in DayPicker@19:16"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 5, "disabled", null, "datePicker.datepickerMode == maxMode in DayPicker@22:16"), import0.ChangeDetectionUtil.bindingTarget("directive", 5, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 5, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 1, null, null, "{{yearTitle}} in DayPicker@24:18"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 7, "hidden", null, "!datePicker.showWeeks in DayPicker@34:10"), import0.ChangeDetectionUtil.bindingTarget("directive", 8, "ngForOf", null, "labels in DayPicker@35:10"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 9, "ngForOf", null, "rows in DayPicker@39:8"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(3, 0), import0.ChangeDetectionUtil.directiveIndex(5, 0), import0.ChangeDetectionUtil.directiveIndex(8, 0), import0.ChangeDetectionUtil.directiveIndex(9, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _DayPicker_0(a);
        }
      }
    

      class _DayPicker_1 extends import0.AbstractChangeDetector<import1.DayPicker> {
        var keyedAccess2, interpolate3;

        _DayPicker_1(dispatcher)
          : super("DayPicker_1",
              dispatcher, 4,
              _DayPicker_1._gen_propertyBindingTargets,
              _DayPicker_1._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_labelz0,l_literal1,l_keyedAccess2,c_keyedAccess2,l_interpolate3;c_keyedAccess2 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_labelz0 = this.locals.get(r'labelz');
    
      
      
          
            l_literal1 = "abbr";
    
      
      
          
            l_keyedAccess2 = l_labelz0[l_literal1];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess2, this.keyedAccess2)) {
        c_keyedAccess2 = true;
        
        
        this.keyedAccess2 = l_keyedAccess2;
      }
    
      
      
          
      if (c_keyedAccess2) {       l_interpolate3 = "${""}${import0.ChangeDetectionUtil.s(l_keyedAccess2)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate3, this.interpolate3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate3, l_interpolate3);
      }
    
      this.notifyDispatcher(l_interpolate3);
      
    
        
        this.interpolate3 = l_interpolate3;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        

        void dehydrateDirectives(destroyPipes) {  this.keyedAccess2 = this.interpolate3 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{labelz['abbr']}} in DayPicker@35:95")];

        static final _gen_directiveIndices = [];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _DayPicker_1(a);
        }
      }
    

      class _DayPicker_2 extends import0.AbstractChangeDetector<import1.DayPicker> {
        var operation_negate2, keyedAccess5, interpolate6, rowz7, DoCheck8, directive_1_0;

        _DayPicker_2(dispatcher)
          : super("DayPicker_2",
              dispatcher, 9,
              _DayPicker_2._gen_propertyBindingTargets,
              _DayPicker_2._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_datePicker0,l_showWeeks1,l_operation_negate2,l_weekNumbers3,l_index4,l_keyedAccess5,c_keyedAccess5,l_interpolate6,l_rowz7,l_DoCheck8;c_keyedAccess5 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_datePicker0 = l_context.datePicker;
    
      
      
          
            l_showWeeks1 = l_datePicker0.showWeeks;
    
      
      
          
            l_operation_negate2 = import0.ChangeDetectionUtil.operation_negate(l_showWeeks1);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_negate2, this.operation_negate2)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_negate2, l_operation_negate2);
      }
    
      this.notifyDispatcher(l_operation_negate2);
      
    
        
        this.operation_negate2 = l_operation_negate2;
      }
    
      
      
          this.propertyBindingIndex = 1;
            l_weekNumbers3 = l_context.weekNumbers;
    
      
      
          
            l_index4 = this.locals.get(r'index');
    
      
      
          
            l_keyedAccess5 = l_weekNumbers3[l_index4];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess5, this.keyedAccess5)) {
        c_keyedAccess5 = true;
        
        
        this.keyedAccess5 = l_keyedAccess5;
      }
    
      
      
          
      if (c_keyedAccess5) {       l_interpolate6 = "${""}${import0.ChangeDetectionUtil.s(l_keyedAccess5)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate6, this.interpolate6)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate6, l_interpolate6);
      }
    
      this.notifyDispatcher(l_interpolate6);
      
    
        
        this.interpolate6 = l_interpolate6;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 2;
            l_rowz7 = this.locals.get(r'rowz');
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_rowz7, this.rowz7)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.rowz7, l_rowz7);
      }
    
      this.directive_1_0.ngForOf = l_rowz7;
      
      isChanged = true;
    
        
        this.rowz7 = l_rowz7;
      }
    
      
      
          
      if (!throwOnChange) this.directive_1_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_1_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.operation_negate2 = this.keyedAccess5 = this.interpolate6 = this.rowz7 = this.DoCheck8 = this.directive_1_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "hidden", null, "!datePicker.showWeeks in DayPicker@40:10"), import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{ weekNumbers[index] }} in DayPicker@40:70"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "ngForOf", null, "rowz in DayPicker@42:10"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(1, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _DayPicker_2(a);
        }
      }
    

      class _DayPicker_3 extends import0.AbstractChangeDetector<import1.DayPicker> {
        var keyedAccess2, keyedAccess4, keyedAccess6, isActive8, mapFnbtninfoactivedisabled9, literal10, DoCheck11, keyedAccess13, keyedAccess15, mapFntextmutedtextinfo16, DoCheck17, keyedAccess19, interpolate20, directive_1_0, directive_2_0;

        _DayPicker_3(dispatcher)
          : super("DayPicker_3",
              dispatcher, 21,
              _DayPicker_3._gen_propertyBindingTargets,
              _DayPicker_3._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_dtz0,l_literal1,l_keyedAccess2,l_literal3,l_keyedAccess4,c_keyedAccess4,l_literal5,l_keyedAccess6,c_keyedAccess6,l_datePicker7,l_isActive8,c_isActive8,l_mapFnbtninfoactivedisabled9,l_literal10,l_DoCheck11,l_literal12,l_keyedAccess13,c_keyedAccess13,l_literal14,l_keyedAccess15,c_keyedAccess15,l_mapFntextmutedtextinfo16,l_DoCheck17,l_literal18,l_keyedAccess19,c_keyedAccess19,l_interpolate20;c_keyedAccess4=c_keyedAccess6=c_isActive8=c_keyedAccess13=c_keyedAccess15=c_keyedAccess19 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_dtz0 = this.locals.get(r'dtz');
    
      
      
          
            l_literal1 = "uid";
    
      
      
          
            l_keyedAccess2 = l_dtz0[l_literal1];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess2, this.keyedAccess2)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.keyedAccess2, l_keyedAccess2);
      }
    
      this.notifyDispatcher(l_keyedAccess2);
      
    
        
        this.keyedAccess2 = l_keyedAccess2;
      }
    
      
      
          this.propertyBindingIndex = 1;
            l_literal3 = "disabled";
    
      
      
          
            l_keyedAccess4 = l_dtz0[l_literal3];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess4, this.keyedAccess4)) {
        c_keyedAccess4 = true;
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.keyedAccess4, l_keyedAccess4);
      }
    
      this.notifyDispatcher(l_keyedAccess4);
      
    
        
        this.keyedAccess4 = l_keyedAccess4;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 2;
            l_literal5 = "selected";
    
      
      
          
            l_keyedAccess6 = l_dtz0[l_literal5];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess6, this.keyedAccess6)) {
        c_keyedAccess6 = true;
        
        
        this.keyedAccess6 = l_keyedAccess6;
      }
    
      
      
          
            l_datePicker7 = l_context.datePicker;
    
      
      
          
            l_isActive8 = l_datePicker7.isActive(l_dtz0);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_isActive8, this.isActive8)) {
        c_isActive8 = true;
        
        
        this.isActive8 = l_isActive8;
      }
    
      
      
          
      if (c_keyedAccess6 || c_isActive8 || c_keyedAccess4) {       l_mapFnbtninfoactivedisabled9 = import0.ChangeDetectionUtil.mapFn(["btn-info", "active", "disabled"])(l_keyedAccess6, l_isActive8, l_keyedAccess4);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnbtninfoactivedisabled9, this.mapFnbtninfoactivedisabled9)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnbtninfoactivedisabled9, l_mapFnbtninfoactivedisabled9);
      }
    
      this.directive_1_0.rawClass = l_mapFnbtninfoactivedisabled9;
      
      isChanged = true;
    
        
        this.mapFnbtninfoactivedisabled9 = l_mapFnbtninfoactivedisabled9;
      }
     }
      
      
          this.propertyBindingIndex = 3;
            l_literal10 = "btn btn-default btn-sm";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal10, this.literal10)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal10, l_literal10);
      }
    
      this.directive_1_0.initialClasses = l_literal10;
      
      isChanged = true;
    
        
        this.literal10 = l_literal10;
      }
    
      
      
          
      if (!throwOnChange) this.directive_1_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 5;
            l_literal12 = "secondary";
    
      
      
          
            l_keyedAccess13 = l_dtz0[l_literal12];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess13, this.keyedAccess13)) {
        c_keyedAccess13 = true;
        
        
        this.keyedAccess13 = l_keyedAccess13;
      }
    
      
      
          
            l_literal14 = "current";
    
      
      
          
            l_keyedAccess15 = l_dtz0[l_literal14];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess15, this.keyedAccess15)) {
        c_keyedAccess15 = true;
        
        
        this.keyedAccess15 = l_keyedAccess15;
      }
    
      
      
          
      if (c_keyedAccess13 || c_keyedAccess15) {       l_mapFntextmutedtextinfo16 = import0.ChangeDetectionUtil.mapFn(["text-muted", "text-info"])(l_keyedAccess13, l_keyedAccess15);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFntextmutedtextinfo16, this.mapFntextmutedtextinfo16)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFntextmutedtextinfo16, l_mapFntextmutedtextinfo16);
      }
    
      this.directive_2_0.rawClass = l_mapFntextmutedtextinfo16;
      
      isChanged = true;
    
        
        this.mapFntextmutedtextinfo16 = l_mapFntextmutedtextinfo16;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_2_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 7;
            l_literal18 = "label";
    
      
      
          
            l_keyedAccess19 = l_dtz0[l_literal18];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess19, this.keyedAccess19)) {
        c_keyedAccess19 = true;
        
        
        this.keyedAccess19 = l_keyedAccess19;
      }
    
      
      
          
      if (c_keyedAccess19) {       l_interpolate20 = "${""}${import0.ChangeDetectionUtil.s(l_keyedAccess19)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate20, this.interpolate20)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate20, l_interpolate20);
      }
    
      this.notifyDispatcher(l_interpolate20);
      
    
        
        this.interpolate20 = l_interpolate20;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_datePicker0_0,l_dtz1_0,l_literal2_0,l_keyedAccess3_0,l_select4_0;
              if (eventName == "click" && elIndex == 1) {
    l_datePicker0_0 = l_context.datePicker;
l_dtz1_0 = locals.get(r'dtz');
l_literal2_0 = "date";
l_keyedAccess3_0 = l_dtz1_0[l_literal2_0];
l_select4_0 = l_datePicker0_0.select(l_keyedAccess3_0);

if (l_select4_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_1_0 = this.getDirectiveFor(directives, 0);
this.directive_2_0 = this.getDirectiveFor(directives, 1);  }

        void dehydrateDirectives(destroyPipes) {  this.keyedAccess2 = this.keyedAccess4 = this.keyedAccess6 = this.isActive8 = this.mapFnbtninfoactivedisabled9 = this.literal10 = this.DoCheck11 = this.keyedAccess13 = this.keyedAccess15 = this.mapFntextmutedtextinfo16 = this.DoCheck17 = this.keyedAccess19 = this.interpolate20 = this.directive_1_0 = this.directive_2_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "id", null, "dtz['uid'] in DayPicker@42:68"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 1, "disabled", null, "dtz['disabled'] in DayPicker@45:16"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "rawClass", null, "{'btn-info': dtz['selected'], active: datePicker.isActive(dtz), disabled: dtz['disabled']} in DayPicker@44:16"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "initialClasses", null, "btn btn-default btn-sm in "), null, import0.ChangeDetectionUtil.bindingTarget("directive", 2, "rawClass", null, "{'text-muted': dtz['secondary'], 'text-info': dtz['current']} in DayPicker@47:16"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{dtz['label']}} in DayPicker@47:90")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(1, 0), import0.ChangeDetectionUtil.directiveIndex(2, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _DayPicker_3(a);
        }
      }
    

      class _HostDayPicker_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostDayPicker_0(dispatcher)
          : super("HostDayPicker_0",
              dispatcher, 1,
              _HostDayPicker_0._gen_propertyBindingTargets,
              _HostDayPicker_0._gen_directiveIndices,
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
          return new _HostDayPicker_0(a);
        }
      }
    
const DayPickerTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/datepicker/daypicker.dart|DayPicker',_DayPicker_0.newChangeDetector,const [const import2.BeginElementCmd('table', const ['aria-activedescendant','activeDateId','aria-labelledby','uniqueId+\'-title\'','role','grid'], const [], const [], const [], true, null),const import2.TextCmd('\n  ', false, null),const import2.BeginElementCmd('thead', const [], const [], const [], const [], false, null),const import2.TextCmd('\n    ', false, null),const import2.BeginElementCmd('tr', const [], const [], const [], const [], false, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('th', const [], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default btn-secondary btn-sm pull-left','tabindex','-1','type','button'], const [null,'click'], const [], const [], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('i', const ['class','glyphicon glyphicon-chevron-left'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('th', const ['colspan','5'], const [], const [], const [], true, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default btn-secondary btn-sm','style','width:100%;','tabindex','-1','type','button'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('strong', const [], const [], const [], const [], false, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('th', const ['colspan','6'], const [], const [], const [], true, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default btn-secondary btn-sm','style','width:100%;','tabindex','-1','type','button'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('strong', const [], const [], const [], const [], false, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('th', const [], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default btn-secondary btn-sm pull-right','tabindex','-1','type','button'], const [null,'click'], const [], const [], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('i', const ['class','glyphicon glyphicon-chevron-right'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.BeginElementCmd('tr', const [], const [], const [], const [], false, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('th', const ['class','text-center'], const [], const [], const [], true, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EmbeddedTemplateCmd(const [], const ['labelz','\$implicit'], const [import4.NgFor], false, null, _DayPicker_1.newChangeDetector, const [const import2.BeginElementCmd('th', const ['class','text-center'], const [], const [], const [], false, null),const import2.BeginElementCmd('small', const ['aria-label','labelz[\'full\']'], const [], const [], const [], false, null),const import2.BeginElementCmd('b', const [], const [], const [], const [], false, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.EndElementCmd()]),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null),const import2.BeginElementCmd('tbody', const [], const [], const [], const [], false, null),const import2.TextCmd('\n    ', false, null),const import2.EmbeddedTemplateCmd(const [], const ['rowz','\$implicit','index','index'], const [import4.NgFor], false, null, _DayPicker_2.newChangeDetector, const [const import2.BeginElementCmd('tr', const [], const [], const [], const [], false, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('td', const ['class','text-center h6'], const [], const [], const [], true, null),const import2.BeginElementCmd('em', const [], const [], const [], const [], false, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.TextCmd('\n      ', false, null),const import2.EmbeddedTemplateCmd(const [], const ['dtz','\$implicit'], const [import4.NgFor], false, null, _DayPicker_3.newChangeDetector, const [const import2.BeginElementCmd('td', const ['class','text-center','role','gridcell'], const [], const [], const [], true, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default btn-sm','style','min-width:100%;','tabindex','-1','type','button'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('span', const [], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n  ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const []);
DayPickerTemplateGetter() => DayPickerTemplate;
const HostDayPickerTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/datepicker/daypicker.dart|HostDayPicker',_HostDayPicker_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-daypicker', const [], const [], const [], const [import1.DayPicker], import2.ViewEncapsulation.None, null, DayPickerTemplateGetter),const import2.EndComponentCmd()],const []));
HostDayPickerTemplateGetter() => HostDayPickerTemplate;
