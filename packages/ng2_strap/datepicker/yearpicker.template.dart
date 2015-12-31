library asset_ng2_strap_lib_datepicker_yearpicker.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/datepicker/yearpicker.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_class.dart' as import3;
import 'package:angular2/src/common/directives/ng_for.dart' as import4;


      class _YearPicker_0 extends import0.AbstractChangeDetector<import1.YearPicker> {
        var operation_not_equals3, operation_add6, operation_identical8, mapFndisabled9, literal10, DoCheck11, title12, interpolate13, rows14, DoCheck15, directive_2_0, directive_4_0;

        _YearPicker_0(dispatcher)
          : super("YearPicker_0",
              dispatcher, 16,
              _YearPicker_0._gen_propertyBindingTargets,
              _YearPicker_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_datePicker0,l_datepickerMode1,l_literal2,l_operation_not_equals3,l_uniqueId4,l_literal5,l_operation_add6,l_maxMode7,l_operation_identical8,c_operation_identical8,l_mapFndisabled9,l_literal10,l_DoCheck11,l_title12,c_title12,l_interpolate13,l_rows14,l_DoCheck15;c_operation_identical8=c_title12 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_datePicker0 = l_context.datePicker;
    
      
      
          
            l_datepickerMode1 = l_datePicker0.datepickerMode;
    
      
      
          
            l_literal2 = "year";
    
      
      
          
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
            l_maxMode7 = l_datePicker0.maxMode;
    
      
      
          
            l_operation_identical8 = import0.ChangeDetectionUtil.operation_identical(l_datepickerMode1, l_maxMode7);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_identical8, this.operation_identical8)) {
        c_operation_identical8 = true;
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_identical8, l_operation_identical8);
      }
    
      this.notifyDispatcher(l_operation_identical8);
      
    
        
        this.operation_identical8 = l_operation_identical8;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 3;
      if (c_operation_identical8) {       l_mapFndisabled9 = import0.ChangeDetectionUtil.mapFn(["disabled"])(l_operation_identical8);
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

        void dehydrateDirectives(destroyPipes) {  this.operation_not_equals3 = this.operation_add6 = this.operation_identical8 = this.mapFndisabled9 = this.literal10 = this.DoCheck11 = this.title12 = this.interpolate13 = this.rows14 = this.DoCheck15 = this.directive_2_0 = this.directive_4_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "hidden", null, "datePicker.datepickerMode!='year' in YearPicker@0:7"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 2, "id", null, "uniqueId + '-title' in YearPicker@10:16"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 2, "disabled", null, "datePicker.datepickerMode === datePicker.maxMode in YearPicker@13:16"), import0.ChangeDetectionUtil.bindingTarget("directive", 2, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 2, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{title}} in YearPicker@15:18"), import0.ChangeDetectionUtil.bindingTarget("directive", 4, "ngForOf", null, "rows in YearPicker@27:8"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(2, 0), import0.ChangeDetectionUtil.directiveIndex(4, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _YearPicker_0(a);
        }
      }
    

      class _YearPicker_1 extends import0.AbstractChangeDetector<import1.YearPicker> {
        var rowz0, DoCheck1, directive_0_0;

        _YearPicker_1(dispatcher)
          : super("YearPicker_1",
              dispatcher, 2,
              _YearPicker_1._gen_propertyBindingTargets,
              _YearPicker_1._gen_directiveIndices,
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

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "ngForOf", null, "rowz in YearPicker@28:10"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _YearPicker_1(a);
        }
      }
    

      class _YearPicker_2 extends import0.AbstractChangeDetector<import1.YearPicker> {
        var keyedAccess2, keyedAccess4, isActive6, mapFnbtninfoactivedisabled7, literal8, DoCheck9, keyedAccess11, mapFntextinfo12, DoCheck13, keyedAccess15, interpolate16, directive_0_0, directive_1_0;

        _YearPicker_2(dispatcher)
          : super("YearPicker_2",
              dispatcher, 17,
              _YearPicker_2._gen_propertyBindingTargets,
              _YearPicker_2._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_dtz0,l_literal1,l_keyedAccess2,c_keyedAccess2,l_literal3,l_keyedAccess4,c_keyedAccess4,l_datePicker5,l_isActive6,c_isActive6,l_mapFnbtninfoactivedisabled7,l_literal8,l_DoCheck9,l_literal10,l_keyedAccess11,c_keyedAccess11,l_mapFntextinfo12,l_DoCheck13,l_literal14,l_keyedAccess15,c_keyedAccess15,l_interpolate16;c_keyedAccess2=c_keyedAccess4=c_isActive6=c_keyedAccess11=c_keyedAccess15 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_dtz0 = this.locals.get(r'dtz');
    
      
      
          
            l_literal1 = "disabled";
    
      
      
          
            l_keyedAccess2 = l_dtz0[l_literal1];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess2, this.keyedAccess2)) {
        c_keyedAccess2 = true;
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.keyedAccess2, l_keyedAccess2);
      }
    
      this.notifyDispatcher(l_keyedAccess2);
      
    
        
        this.keyedAccess2 = l_keyedAccess2;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 1;
            l_literal3 = "selected";
    
      
      
          
            l_keyedAccess4 = l_dtz0[l_literal3];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess4, this.keyedAccess4)) {
        c_keyedAccess4 = true;
        
        
        this.keyedAccess4 = l_keyedAccess4;
      }
    
      
      
          
            l_datePicker5 = l_context.datePicker;
    
      
      
          
            l_isActive6 = l_datePicker5.isActive(l_dtz0);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_isActive6, this.isActive6)) {
        c_isActive6 = true;
        
        
        this.isActive6 = l_isActive6;
      }
    
      
      
          
      if (c_keyedAccess4 || c_isActive6 || c_keyedAccess2) {       l_mapFnbtninfoactivedisabled7 = import0.ChangeDetectionUtil.mapFn(["btn-info", "active", "disabled"])(l_keyedAccess4, l_isActive6, l_keyedAccess2);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnbtninfoactivedisabled7, this.mapFnbtninfoactivedisabled7)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnbtninfoactivedisabled7, l_mapFnbtninfoactivedisabled7);
      }
    
      this.directive_0_0.rawClass = l_mapFnbtninfoactivedisabled7;
      
      isChanged = true;
    
        
        this.mapFnbtninfoactivedisabled7 = l_mapFnbtninfoactivedisabled7;
      }
     }
      
      
          this.propertyBindingIndex = 2;
            l_literal8 = "btn btn-default";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal8, this.literal8)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal8, l_literal8);
      }
    
      this.directive_0_0.initialClasses = l_literal8;
      
      isChanged = true;
    
        
        this.literal8 = l_literal8;
      }
    
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 4;
            l_literal10 = "current";
    
      
      
          
            l_keyedAccess11 = l_dtz0[l_literal10];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess11, this.keyedAccess11)) {
        c_keyedAccess11 = true;
        
        
        this.keyedAccess11 = l_keyedAccess11;
      }
    
      
      
          
      if (c_keyedAccess11) {       l_mapFntextinfo12 = import0.ChangeDetectionUtil.mapFn(["text-info"])(l_keyedAccess11);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFntextinfo12, this.mapFntextinfo12)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFntextinfo12, l_mapFntextinfo12);
      }
    
      this.directive_1_0.rawClass = l_mapFntextinfo12;
      
      isChanged = true;
    
        
        this.mapFntextinfo12 = l_mapFntextinfo12;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_1_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 6;
            l_literal14 = "label";
    
      
      
          
            l_keyedAccess15 = l_dtz0[l_literal14];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess15, this.keyedAccess15)) {
        c_keyedAccess15 = true;
        
        
        this.keyedAccess15 = l_keyedAccess15;
      }
    
      
      
          
      if (c_keyedAccess15) {       l_interpolate16 = "${""}${import0.ChangeDetectionUtil.s(l_keyedAccess15)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate16, this.interpolate16)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate16, l_interpolate16);
      }
    
      this.notifyDispatcher(l_interpolate16);
      
    
        
        this.interpolate16 = l_interpolate16;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_datePicker0_0,l_dtz1_0,l_literal2_0,l_keyedAccess3_0,l_select4_0;
              if (eventName == "click" && elIndex == 0) {
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
this.directive_1_0 = this.getDirectiveFor(directives, 1);  }

        void dehydrateDirectives(destroyPipes) {  this.keyedAccess2 = this.keyedAccess4 = this.isActive6 = this.mapFnbtninfoactivedisabled7 = this.literal8 = this.DoCheck9 = this.keyedAccess11 = this.mapFntextinfo12 = this.DoCheck13 = this.keyedAccess15 = this.interpolate16 = this.directive_0_0 = this.directive_1_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "disabled", null, "dtz['disabled'] in YearPicker@32:16"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "{'btn-info': dtz['selected'], active: datePicker.isActive(dtz), disabled: dtz['disabled']} in YearPicker@31:16"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "btn btn-default in "), null, import0.ChangeDetectionUtil.bindingTarget("directive", 1, "rawClass", null, "{'text-info': dtz['current']} in YearPicker@34:16"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{dtz['label']}} in YearPicker@34:58")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(1, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _YearPicker_2(a);
        }
      }
    

      class _HostYearPicker_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostYearPicker_0(dispatcher)
          : super("HostYearPicker_0",
              dispatcher, 1,
              _HostYearPicker_0._gen_propertyBindingTargets,
              _HostYearPicker_0._gen_directiveIndices,
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
          return new _HostYearPicker_0(a);
        }
      }
    
const YearPickerTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/datepicker/yearpicker.dart|YearPicker',_YearPicker_0.newChangeDetector,const [const import2.BeginElementCmd('table', const ['role','grid'], const [], const [], const [], true, null),const import2.TextCmd('\n  ', false, null),const import2.BeginElementCmd('thead', const [], const [], const [], const [], false, null),const import2.TextCmd('\n    ', false, null),const import2.BeginElementCmd('tr', const [], const [], const [], const [], false, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('th', const [], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default btn-sm pull-left','tabindex','-1','type','button'], const [null,'click'], const [], const [], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('i', const ['class','glyphicon glyphicon-chevron-left'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('th', const ['colspan','3'], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default btn-sm','role','heading','style','width:100%;','tabindex','-1','type','button'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('strong', const [], const [], const [], const [], false, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('th', const [], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default btn-sm pull-right','tabindex','-1','type','button'], const [null,'click'], const [], const [], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('i', const ['class','glyphicon glyphicon-chevron-right'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null),const import2.BeginElementCmd('tbody', const [], const [], const [], const [], false, null),const import2.TextCmd('\n    ', false, null),const import2.EmbeddedTemplateCmd(const [], const ['rowz','\$implicit'], const [import4.NgFor], false, null, _YearPicker_1.newChangeDetector, const [const import2.BeginElementCmd('tr', const [], const [], const [], const [], false, null),const import2.TextCmd('\n      ', false, null),const import2.EmbeddedTemplateCmd(const [], const ['dtz','\$implicit'], const [import4.NgFor], false, null, _YearPicker_2.newChangeDetector, const [const import2.BeginElementCmd('td', const ['class','text-center','role','gridcell'], const [], const [], const [], false, null),const import2.TextCmd('\n\n        ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-default','style','min-width:100%;','tabindex','-1','type','button'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('span', const [], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n\n      ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n  ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const []);
YearPickerTemplateGetter() => YearPickerTemplate;
const HostYearPickerTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/datepicker/yearpicker.dart|HostYearPicker',_HostYearPicker_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-yearpicker', const [], const [], const [], const [import1.YearPicker], import2.ViewEncapsulation.None, null, YearPickerTemplateGetter),const import2.EndComponentCmd()],const []));
HostYearPickerTemplateGetter() => HostYearPickerTemplate;
