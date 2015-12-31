library asset_ng2_strap_lib_datepicker_monthpicker.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/datepicker/monthpicker.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_class.dart' as import3;
import 'package:angular2/src/common/directives/ng_for.dart' as import4;


      class _MonthPicker_0 extends import0.AbstractChangeDetector<import1.MonthPicker> {
        var operation_not_equals3, operation_add6, operation_equals8, mapFndisabled9, literal10, DoCheck11, title12, interpolate13, rows14, DoCheck15, directive_2_0, directive_4_0;

        _MonthPicker_0(dispatcher)
          : super("MonthPicker_0",
              dispatcher, 16,
              _MonthPicker_0._gen_propertyBindingTargets,
              _MonthPicker_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_datePicker0,l_datepickerMode1,l_literal2,l_operation_not_equals3,l_uniqueId4,l_literal5,l_operation_add6,l_maxMode7,l_operation_equals8,c_operation_equals8,l_mapFndisabled9,l_literal10,l_DoCheck11,l_title12,c_title12,l_interpolate13,l_rows14,l_DoCheck15;c_operation_equals8=c_title12 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_datePicker0 = l_context.datePicker;
    
      
      
          
            l_datepickerMode1 = l_datePicker0.datepickerMode;
    
      
      
          
            l_literal2 = "month";
    
      
      
          
            l_operation_not_equals3 = import0.ChangeDetectionUtil.operation_not_equals(l_datepickerMode1, l_literal2);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_not_equals3, this.operation_not_equals3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_not_equals3, l_operation_not_equals3);
      }
    
      this.notifyDispatcher(l_operation_not_equals3);
      
    
        
        this.operation_not_equals3 = l_operation_not_equals3;
      }
    
      
      
          this.propertyBindingIndex = 1;
            l_uniqueId4 = l_context.uniqueId;
    
      
      
          
            l_literal5 = "-title";
    
      
      
          
            l_operation_add6 = import0.ChangeDetectionUtil.operation_add(l_uniqueId4, l_literal5);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_add6, this.operation_add6)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_add6, l_operation_add6);
      }
    
      this.notifyDispatcher(l_operation_add6);
      
    
        
        this.operation_add6 = l_operation_add6;
      }
    
      
      
          this.propertyBindingIndex = 2;
            l_maxMode7 = l_context.maxMode;
    
      
      
          
            l_operation_equals8 = import0.ChangeDetectionUtil.operation_equals(l_datepickerMode1, l_maxMode7);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_equals8, this.operation_equals8)) {
        c_operation_equals8 = true;
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_equals8, l_operation_equals8);
      }
    
      this.notifyDispatcher(l_operation_equals8);
      
    
        
        this.operation_equals8 = l_operation_equals8;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 3;
      if (c_operation_equals8) {       l_mapFndisabled9 = import0.ChangeDetectionUtil.mapFn(["disabled"])(l_operation_equals8);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabled9, this.mapFndisabled9)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabled9, l_mapFndisabled9);
      }
    
      this.directive_2_0.rawClass = l_mapFndisabled9;
      
      isChanged = true;
    
        
        this.mapFndisabled9 = l_mapFndisabled9;
      }
     }
      
      
          this.propertyBindingIndex = 4;
            l_literal10 = "btn btn-default btn-sm";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal10, this.literal10)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal10, l_literal10);
      }
    
      this.directive_2_0.initialClasses = l_literal10;
      
      isChanged = true;
    
        
        this.literal10 = l_literal10;
      }
    
      
      
          
      if (!throwOnChange) this.directive_2_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 6;
            l_title12 = l_context.title;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_title12, this.title12)) {
        c_title12 = true;
        
        
        this.title12 = l_title12;
      }
    
      
      
          
      if (c_title12) {       l_interpolate13 = "${""}${import0.ChangeDetectionUtil.s(l_title12)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate13, this.interpolate13)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate13, l_interpolate13);
      }
    
      this.notifyDispatcher(l_interpolate13);
      
    
        
        this.interpolate13 = l_interpolate13;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 7;
            l_rows14 = l_context.rows;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_rows14, this.rows14)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.rows14, l_rows14);
      }
    
      this.directive_4_0.ngForOf = l_rows14;
      
      isChanged = true;
    
        
        this.rows14 = l_rows14;
      }
    
      
      
          
      if (!throwOnChange) this.directive_4_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_datePicker0_0,l_literal1_0,l_literal2_0,l_operation_subtract3_0,l_move4_0,l_datePicker0_1,l_toggleMode1_1,l_datePicker0_2,l_literal1_2,l_move2_2;
              if (eventName == "click" && elIndex == 1) {
    l_datePicker0_0 = l_context.datePicker;
l_literal1_0 = 0;
l_literal2_0 = 1;
l_operation_subtract3_0 = import0.ChangeDetectionUtil.operation_subtract(l_literal1_0, l_literal2_0);
l_move4_0 = l_datePicker0_0.move(l_operation_subtract3_0);

if (l_move4_0 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 2) {
    l_datePicker0_1 = l_context.datePicker;
l_toggleMode1_1 = l_datePicker0_1.toggleMode();

if (l_toggleMode1_1 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 3) {
    l_datePicker0_2 = l_context.datePicker;
l_literal1_2 = 1;
l_move2_2 = l_datePicker0_2.move(l_literal1_2);

if (l_move2_2 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_2_0 = this.getDirectiveFor(directives, 0);
this.directive_4_0 = this.getDirectiveFor(directives, 1);  }

        void dehydrateDirectives(destroyPipes) {  this.operation_not_equals3 = this.operation_add6 = this.operation_equals8 = this.mapFndisabled9 = this.literal10 = this.DoCheck11 = this.title12 = this.interpolate13 = this.rows14 = this.DoCheck15 = this.directive_2_0 = this.directive_4_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "hidden", null, "datePicker.datepickerMode!='month' in MonthPicker@0:7"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 2, "id", null, "uniqueId + '-title' in MonthPicker@9:16"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 2, "disabled", null, "datePicker.datepickerMode == maxMode in MonthPicker@12:16"), import0.ChangeDetectionUtil.bindingTarget("directive", 2, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 2, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{title}} in MonthPicker@14:18"), import0.ChangeDetectionUtil.bindingTarget("directive", 4, "ngForOf", null, "rows in MonthPicker@26:8"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(2, 0), import0.ChangeDetectionUtil.directiveIndex(4, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _MonthPicker_0(a);
        }
      }
    

      class _MonthPicker_1 extends import0.AbstractChangeDetector<import1.MonthPicker> {
        var rowz0, DoCheck1, directive_0_0;

        _MonthPicker_1(dispatcher)
          : super("MonthPicker_1",
              dispatcher, 2,
              _MonthPicker_1._gen_propertyBindingTargets,
              _MonthPicker_1._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_rowz0,l_DoCheck1;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_rowz0 = this.locals.get(r'rowz');
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_rowz0, this.rowz0)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.rowz0, l_rowz0);
      }
    
      this.directive_0_0.ngForOf = l_rowz0;
      
      isChanged = true;
    
        
        this.rowz0 = l_rowz0;
      }
    
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.rowz0 = this.DoCheck1 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "ngForOf", null, "rowz in MonthPicker@27:10"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _MonthPicker_1(a);
        }
      }
    

      class _MonthPicker_2 extends import0.AbstractChangeDetector<import1.MonthPicker> {
        var keyedAccess2, interpolate3, keyedAccess5, literal6, DoCheck7, keyedAccess9, keyedAccess11, isActive13, mapFnbtninfoactivedisabled14, literal15, DoCheck16, keyedAccess18, mapFntextinfo19, DoCheck20, keyedAccess22, interpolate23, directive_0_0, directive_1_0, directive_2_0;

        _MonthPicker_2(dispatcher)
          : super("MonthPicker_2",
              dispatcher, 24,
              _MonthPicker_2._gen_propertyBindingTargets,
              _MonthPicker_2._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_dtz0,l_literal1,l_keyedAccess2,c_keyedAccess2,l_interpolate3,l_literal4,l_keyedAccess5,l_literal6,l_DoCheck7,l_literal8,l_keyedAccess9,c_keyedAccess9,l_literal10,l_keyedAccess11,c_keyedAccess11,l_datePicker12,l_isActive13,c_isActive13,l_mapFnbtninfoactivedisabled14,l_literal15,l_DoCheck16,l_literal17,l_keyedAccess18,c_keyedAccess18,l_mapFntextinfo19,l_DoCheck20,l_literal21,l_keyedAccess22,c_keyedAccess22,l_interpolate23;c_keyedAccess2=c_keyedAccess9=c_keyedAccess11=c_isActive13=c_keyedAccess18=c_keyedAccess22 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_dtz0 = this.locals.get(r'dtz');
    
      
      
          
            l_literal1 = "uid";
    
      
      
          
            l_keyedAccess2 = l_dtz0[l_literal1];
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
    
      
          this.propertyBindingIndex = 1;
            l_literal4 = "customClass";
    
      
      
          
            l_keyedAccess5 = l_dtz0[l_literal4];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess5, this.keyedAccess5)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.keyedAccess5, l_keyedAccess5);
      }
    
      this.directive_0_0.rawClass = l_keyedAccess5;
      
      isChanged = true;
    
        
        this.keyedAccess5 = l_keyedAccess5;
      }
    
      
      
          this.propertyBindingIndex = 2;
            l_literal6 = "text-center";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal6, this.literal6)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal6, l_literal6);
      }
    
      this.directive_0_0.initialClasses = l_literal6;
      
      isChanged = true;
    
        
        this.literal6 = l_literal6;
      }
    
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 4;
            l_literal8 = "disabled";
    
      
      
          
            l_keyedAccess9 = l_dtz0[l_literal8];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess9, this.keyedAccess9)) {
        c_keyedAccess9 = true;
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.keyedAccess9, l_keyedAccess9);
      }
    
      this.notifyDispatcher(l_keyedAccess9);
      
    
        
        this.keyedAccess9 = l_keyedAccess9;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 5;
            l_literal10 = "selected";
    
      
      
          
            l_keyedAccess11 = l_dtz0[l_literal10];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess11, this.keyedAccess11)) {
        c_keyedAccess11 = true;
        
        
        this.keyedAccess11 = l_keyedAccess11;
      }
    
      
      
          
            l_datePicker12 = l_context.datePicker;
    
      
      
          
            l_isActive13 = l_datePicker12.isActive(l_dtz0);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_isActive13, this.isActive13)) {
        c_isActive13 = true;
        
        
        this.isActive13 = l_isActive13;
      }
    
      
      
          
      if (c_keyedAccess11 || c_isActive13 || c_keyedAccess9) {       l_mapFnbtninfoactivedisabled14 = import0.ChangeDetectionUtil.mapFn(["btn-info", "active", "disabled"])(l_keyedAccess11, l_isActive13, l_keyedAccess9);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnbtninfoactivedisabled14, this.mapFnbtninfoactivedisabled14)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnbtninfoactivedisabled14, l_mapFnbtninfoactivedisabled14);
      }
    
      this.directive_1_0.rawClass = l_mapFnbtninfoactivedisabled14;
      
      isChanged = true;
    
        
        this.mapFnbtninfoactivedisabled14 = l_mapFnbtninfoactivedisabled14;
      }
     }
      
      
          this.propertyBindingIndex = 6;
            l_literal15 = "btn btn-default";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal15, this.literal15)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal15, l_literal15);
      }
    
      this.directive_1_0.initialClasses = l_literal15;
      
      isChanged = true;
    
        
        this.literal15 = l_literal15;
      }
    
      
      
          
      if (!throwOnChange) this.directive_1_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 8;
            l_literal17 = "current";
    
      
      
          
            l_keyedAccess18 = l_dtz0[l_literal17];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess18, this.keyedAccess18)) {
        c_keyedAccess18 = true;
        
        
        this.keyedAccess18 = l_keyedAccess18;
      }
    
      
      
          
      if (c_keyedAccess18) {       l_mapFntextinfo19 = import0.ChangeDetectionUtil.mapFn(["text-info"])(l_keyedAccess18);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFntextinfo19, this.mapFntextinfo19)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFntextinfo19, l_mapFntextinfo19);
      }
    
      this.directive_2_0.rawClass = l_mapFntextinfo19;
      
      isChanged = true;
    
        
        this.mapFntextinfo19 = l_mapFntextinfo19;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_2_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 10;
            l_literal21 = "label";
    
      
      
          
            l_keyedAccess22 = l_dtz0[l_literal21];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess22, this.keyedAccess22)) {
        c_keyedAccess22 = true;
        
        
        this.keyedAccess22 = l_keyedAccess22;
      }
    
      
      
          
      if (c_keyedAccess22) {       l_interpolate23 = "${""}${import0.ChangeDetectionUtil.s(l_keyedAccess22)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate23, this.interpolate23)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate23, l_interpolate23);
      }
    
      this.notifyDispatcher(l_interpolate23);
      
    
        
        this.interpolate23 = l_interpolate23;
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
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_1_0 = this.getDirectiveFor(directives, 1);
this.directive_2_0 = this.getDirectiveFor(directives, 2);  }

        void dehydrateDirectives(destroyPipes) {  this.keyedAccess2 = this.interpolate3 = this.keyedAccess5 = this.literal6 = this.DoCheck7 = this.keyedAccess9 = this.keyedAccess11 = this.isActive13 = this.mapFnbtninfoactivedisabled14 = this.literal15 = this.DoCheck16 = this.keyedAccess18 = this.mapFntextinfo19 = this.DoCheck20 = this.keyedAccess22 = this.interpolate23 = this.directive_0_0 = this.directive_1_0 = this.directive_2_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "id", null, "{{dtz['uid']}} in MonthPicker@27:68"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "dtz['customClass'] in MonthPicker@27:88"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "text-center in "), null, import0.ChangeDetectionUtil.bindingTarget("elementProperty", 1, "disabled", null, "dtz['disabled'] in MonthPicker@31:16"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "rawClass", null, "{'btn-info': dtz['selected'], active: datePicker.isActive(dtz), disabled: dtz['disabled']} in MonthPicker@30:16"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "initialClasses", null, "btn btn-default in "), null, import0.ChangeDetectionUtil.bindingTarget("directive", 2, "rawClass", null, "{'text-info': dtz['current']} in MonthPicker@32:77"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{dtz['label']}} in MonthPicker@32:119")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(1, 0), import0.ChangeDetectionUtil.directiveIndex(2, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _MonthPicker_2(a);
        }
      }
    

      class _HostMonthPicker_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostMonthPicker_0(dispatcher)
          : super("HostMonthPicker_0",
              dispatcher, 1,
              _HostMonthPicker_0._gen_propertyBindingTargets,
              _HostMonthPicker_0._gen_directiveIndices,
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
          return new _HostMonthPicker_0(a);
        }
      }
    
const MonthPickerTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/datepicker/monthpicker.dart|MonthPicker',_MonthPicker_0.newChangeDetector,const [const import2.BeginElementCmd('table', const ['role','grid'], const [], const [], const [], true, null),const import2.TextCmd('\n  ', false, null),const import2.BeginElementCmd('thead', const [], const [], const [], const [], false, null),const import2.TextCmd('\n    ', false, null),const import2.BeginElementCmd('tr', const [], const [], const [], const [], false, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('th', const [], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default btn-sm pull-left','tabindex','-1','type','button'], const [null,'click'], const [], const [], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('i', const ['class','glyphicon glyphicon-chevron-left'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('th', const [], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default btn-sm','style','width:100%;','tabindex','-1','type','button'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('strong', const [], const [], const [], const [], false, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('th', const [], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default btn-sm pull-right','tabindex','-1','type','button'], const [null,'click'], const [], const [], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('i', const ['class','glyphicon glyphicon-chevron-right'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null),const import2.BeginElementCmd('tbody', const [], const [], const [], const [], false, null),const import2.TextCmd('\n    ', false, null),const import2.EmbeddedTemplateCmd(const [], const ['rowz','\$implicit'], const [import4.NgFor], false, null, _MonthPicker_1.newChangeDetector, const [const import2.BeginElementCmd('tr', const [], const [], const [], const [], false, null),const import2.TextCmd('\n      ', false, null),const import2.EmbeddedTemplateCmd(const [], const ['dtz','\$implicit'], const [import4.NgFor], false, null, _MonthPicker_2.newChangeDetector, const [const import2.BeginElementCmd('td', const ['class','text-center','role','gridcell'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default','style','min-width:100%;','tabindex','-1','type','button'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.BeginElementCmd('span', const [], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.TextCmd('\n\n\n      ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n  ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const []);
MonthPickerTemplateGetter() => MonthPickerTemplate;
const HostMonthPickerTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/datepicker/monthpicker.dart|HostMonthPicker',_HostMonthPicker_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-monthpicker', const [], const [], const [], const [import1.MonthPicker], import2.ViewEncapsulation.None, null, MonthPickerTemplateGetter),const import2.EndComponentCmd()],const []));
HostMonthPickerTemplateGetter() => HostMonthPickerTemplate;
