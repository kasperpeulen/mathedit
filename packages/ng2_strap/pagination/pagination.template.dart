library asset_ng2_strap_lib_pagination_pagination.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/pagination/pagination.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_class.dart' as import3;
import 'package:angular2/src/common/directives/ng_for.dart' as import4;


      class _Pagination_0 extends import0.AbstractChangeDetector<import1.Pagination> {
        var classMap0, literal1, DoCheck2, operation_negate4, cond8, mapFndisabledhidden9, literal10, DoCheck11, firstText12, interpolate13, operation_negate15, cond18, mapFndisabledhidden19, literal20, DoCheck21, previousText22, interpolate23, pages24, DoCheck25, self26, cond30, mapFndisabledhidden31, literal32, DoCheck33, nextText34, interpolate35, self36, cond39, mapFndisabledhidden40, literal41, DoCheck42, lastText43, interpolate44, directive_0_0, directive_1_0, directive_3_0, directive_5_0, directive_6_0, directive_8_0;

        _Pagination_0(dispatcher)
          : super("Pagination_0",
              dispatcher, 45,
              _Pagination_0._gen_propertyBindingTargets,
              _Pagination_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_classMap0,l_literal1,l_DoCheck2,l_boundaryLinks3,l_operation_negate4,c_operation_negate4,l_noPrevious5,l_SkipRecordsIf6,l_disabled7,l_cond8,c_cond8,l_mapFndisabledhidden9,l_literal10,l_DoCheck11,l_firstText12,c_firstText12,l_interpolate13,l_directionLinks14,l_operation_negate15,c_operation_negate15,l_SkipRecordsIf16,l_disabled17,l_cond18,c_cond18,l_mapFndisabledhidden19,l_literal20,l_DoCheck21,l_previousText22,c_previousText22,l_interpolate23,l_pages24,l_DoCheck25,l_self26,l_noNext27,l_SkipRecordsIf28,l_disabled29,l_cond30,c_cond30,l_mapFndisabledhidden31,l_literal32,l_DoCheck33,l_nextText34,c_nextText34,l_interpolate35,l_self36,l_SkipRecordsIf37,l_disabled38,l_cond39,c_cond39,l_mapFndisabledhidden40,l_literal41,l_DoCheck42,l_lastText43,c_lastText43,l_interpolate44;c_operation_negate4=c_cond8=c_firstText12=c_operation_negate15=c_cond18=c_previousText22=c_cond30=c_nextText34=c_cond39=c_lastText43 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_classMap0 = l_context.classMap;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_classMap0, this.classMap0)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.classMap0, l_classMap0);
      }
    
      this.directive_0_0.rawClass = l_classMap0;
      
      isChanged = true;
    
        
        this.classMap0 = l_classMap0;
      }
    
      
      
          this.propertyBindingIndex = 1;
            l_literal1 = "pagination";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal1, this.literal1)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal1, l_literal1);
      }
    
      this.directive_0_0.initialClasses = l_literal1;
      
      isChanged = true;
    
        
        this.literal1 = l_literal1;
      }
    
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 3;
            l_boundaryLinks3 = l_context.boundaryLinks;
    
      
      
          
            l_operation_negate4 = import0.ChangeDetectionUtil.operation_negate(l_boundaryLinks3);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_negate4, this.operation_negate4)) {
        c_operation_negate4 = true;
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_negate4, l_operation_negate4);
      }
    
      this.notifyDispatcher(l_operation_negate4);
      
    
        
        this.operation_negate4 = l_operation_negate4;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 4;
            l_noPrevious5 = l_context.noPrevious();
    
      
      
          
      if (!l_noPrevious5) {
      
      
          
            l_disabled7 = l_context.disabled;
    
      
      }
          
            l_cond8 = import0.ChangeDetectionUtil.cond(l_noPrevious5, l_noPrevious5, l_disabled7);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_cond8, this.cond8)) {
        c_cond8 = true;
        
        
        this.cond8 = l_cond8;
      }
    
      
      
          
      if (c_cond8 || c_operation_negate4) {       l_mapFndisabledhidden9 = import0.ChangeDetectionUtil.mapFn(["disabled", "hidden"])(l_cond8, l_operation_negate4);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabledhidden9, this.mapFndisabledhidden9)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabledhidden9, l_mapFndisabledhidden9);
      }
    
      this.directive_1_0.rawClass = l_mapFndisabledhidden9;
      
      isChanged = true;
    
        
        this.mapFndisabledhidden9 = l_mapFndisabledhidden9;
      }
     }
      
      
          this.propertyBindingIndex = 5;
            l_literal10 = "pagination-first";
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
    
      
          this.propertyBindingIndex = 7;
            l_firstText12 = l_context.firstText;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_firstText12, this.firstText12)) {
        c_firstText12 = true;
        
        
        this.firstText12 = l_firstText12;
      }
    
      
      
          
      if (c_firstText12) {       l_interpolate13 = "${""}${import0.ChangeDetectionUtil.s(l_firstText12)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate13, this.interpolate13)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate13, l_interpolate13);
      }
    
      this.notifyDispatcher(l_interpolate13);
      
    
        
        this.interpolate13 = l_interpolate13;
      }
     }
      
      
          this.propertyBindingIndex = 8;
            l_directionLinks14 = l_context.directionLinks;
    
      
      
          
            l_operation_negate15 = import0.ChangeDetectionUtil.operation_negate(l_directionLinks14);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_negate15, this.operation_negate15)) {
        c_operation_negate15 = true;
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_negate15, l_operation_negate15);
      }
    
      this.notifyDispatcher(l_operation_negate15);
      
    
        
        this.operation_negate15 = l_operation_negate15;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 9;
      if (!l_noPrevious5) {
      
      
          
            l_disabled17 = l_context.disabled;
    
      
      }
          
            l_cond18 = import0.ChangeDetectionUtil.cond(l_noPrevious5, l_noPrevious5, l_disabled17);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_cond18, this.cond18)) {
        c_cond18 = true;
        
        
        this.cond18 = l_cond18;
      }
    
      
      
          
      if (c_cond18 || c_operation_negate15) {       l_mapFndisabledhidden19 = import0.ChangeDetectionUtil.mapFn(["disabled", "hidden"])(l_cond18, l_operation_negate15);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabledhidden19, this.mapFndisabledhidden19)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabledhidden19, l_mapFndisabledhidden19);
      }
    
      this.directive_3_0.rawClass = l_mapFndisabledhidden19;
      
      isChanged = true;
    
        
        this.mapFndisabledhidden19 = l_mapFndisabledhidden19;
      }
     }
      
      
          this.propertyBindingIndex = 10;
            l_literal20 = "pagination-prev";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal20, this.literal20)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal20, l_literal20);
      }
    
      this.directive_3_0.initialClasses = l_literal20;
      
      isChanged = true;
    
        
        this.literal20 = l_literal20;
      }
    
      
      
          
      if (!throwOnChange) this.directive_3_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 12;
            l_previousText22 = l_context.previousText;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_previousText22, this.previousText22)) {
        c_previousText22 = true;
        
        
        this.previousText22 = l_previousText22;
      }
    
      
      
          
      if (c_previousText22) {       l_interpolate23 = "${""}${import0.ChangeDetectionUtil.s(l_previousText22)}${""}";
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
    
      
          this.propertyBindingIndex = 13;
            l_pages24 = l_context.pages;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_pages24, this.pages24)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.pages24, l_pages24);
      }
    
      this.directive_5_0.ngForOf = l_pages24;
      
      isChanged = true;
    
        
        this.pages24 = l_pages24;
      }
    
      
      
          
      if (!throwOnChange) this.directive_5_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 15;
            l_self26 = l_operation_negate15;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self26, this.self26)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self26, l_self26);
      }
    
      this.notifyDispatcher(l_self26);
      
    
        
        this.self26 = l_self26;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 16;
            l_noNext27 = l_context.noNext();
    
      
      
          
      if (!l_noNext27) {
      
      
          
            l_disabled29 = l_context.disabled;
    
      
      }
          
            l_cond30 = import0.ChangeDetectionUtil.cond(l_noNext27, l_noNext27, l_disabled29);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_cond30, this.cond30)) {
        c_cond30 = true;
        
        
        this.cond30 = l_cond30;
      }
    
      
      
          
      if (c_cond30 || c_operation_negate15) {       l_mapFndisabledhidden31 = import0.ChangeDetectionUtil.mapFn(["disabled", "hidden"])(l_cond30, l_operation_negate15);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabledhidden31, this.mapFndisabledhidden31)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabledhidden31, l_mapFndisabledhidden31);
      }
    
      this.directive_6_0.rawClass = l_mapFndisabledhidden31;
      
      isChanged = true;
    
        
        this.mapFndisabledhidden31 = l_mapFndisabledhidden31;
      }
     }
      
      
          this.propertyBindingIndex = 17;
            l_literal32 = "pagination-next";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal32, this.literal32)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal32, l_literal32);
      }
    
      this.directive_6_0.initialClasses = l_literal32;
      
      isChanged = true;
    
        
        this.literal32 = l_literal32;
      }
    
      
      
          
      if (!throwOnChange) this.directive_6_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 19;
            l_nextText34 = l_context.nextText;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_nextText34, this.nextText34)) {
        c_nextText34 = true;
        
        
        this.nextText34 = l_nextText34;
      }
    
      
      
          
      if (c_nextText34) {       l_interpolate35 = "${""}${import0.ChangeDetectionUtil.s(l_nextText34)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate35, this.interpolate35)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate35, l_interpolate35);
      }
    
      this.notifyDispatcher(l_interpolate35);
      
    
        
        this.interpolate35 = l_interpolate35;
      }
     }
      
      
          this.propertyBindingIndex = 20;
            l_self36 = l_operation_negate4;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self36, this.self36)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self36, l_self36);
      }
    
      this.notifyDispatcher(l_self36);
      
    
        
        this.self36 = l_self36;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 21;
      if (!l_noNext27) {
      
      
          
            l_disabled38 = l_context.disabled;
    
      
      }
          
            l_cond39 = import0.ChangeDetectionUtil.cond(l_noNext27, l_noNext27, l_disabled38);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_cond39, this.cond39)) {
        c_cond39 = true;
        
        
        this.cond39 = l_cond39;
      }
    
      
      
          
      if (c_cond39 || c_operation_negate4) {       l_mapFndisabledhidden40 = import0.ChangeDetectionUtil.mapFn(["disabled", "hidden"])(l_cond39, l_operation_negate4);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabledhidden40, this.mapFndisabledhidden40)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabledhidden40, l_mapFndisabledhidden40);
      }
    
      this.directive_8_0.rawClass = l_mapFndisabledhidden40;
      
      isChanged = true;
    
        
        this.mapFndisabledhidden40 = l_mapFndisabledhidden40;
      }
     }
      
      
          this.propertyBindingIndex = 22;
            l_literal41 = "pagination-last";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal41, this.literal41)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal41, l_literal41);
      }
    
      this.directive_8_0.initialClasses = l_literal41;
      
      isChanged = true;
    
        
        this.literal41 = l_literal41;
      }
    
      
      
          
      if (!throwOnChange) this.directive_8_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 24;
            l_lastText43 = l_context.lastText;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_lastText43, this.lastText43)) {
        c_lastText43 = true;
        
        
        this.lastText43 = l_lastText43;
      }
    
      
      
          
      if (c_lastText43) {       l_interpolate44 = "${""}${import0.ChangeDetectionUtil.s(l_lastText43)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate44, this.interpolate44)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate44, l_interpolate44);
      }
    
      this.notifyDispatcher(l_interpolate44);
      
    
        
        this.interpolate44 = l_interpolate44;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_literal0_0,l_event1_0,l_selectPage2_0,l_page0_1,l_literal1_1,l_operation_subtract2_1,l_event3_1,l_selectPage4_1,l_page0_2,l_literal1_2,l_operation_add2_2,l_event3_2,l_selectPage4_2,l_totalPages0_3,l_event1_3,l_selectPage2_3;
              if (eventName == "click" && elIndex == 2) {
    l_literal0_0 = 1;
l_event1_0 = locals.get(r'$event');
l_selectPage2_0 = l_context.selectPage(l_literal0_0, l_event1_0);

if (l_selectPage2_0 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 4) {
    l_page0_1 = l_context.page;
l_literal1_1 = 1;
l_operation_subtract2_1 = import0.ChangeDetectionUtil.operation_subtract(l_page0_1, l_literal1_1);
l_event3_1 = locals.get(r'$event');
l_selectPage4_1 = l_context.selectPage(l_operation_subtract2_1, l_event3_1);

if (l_selectPage4_1 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 7) {
    l_page0_2 = l_context.page;
l_literal1_2 = 1;
l_operation_add2_2 = import0.ChangeDetectionUtil.operation_add(l_page0_2, l_literal1_2);
l_event3_2 = locals.get(r'$event');
l_selectPage4_2 = l_context.selectPage(l_operation_add2_2, l_event3_2);

if (l_selectPage4_2 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 9) {
    l_totalPages0_3 = l_context.totalPages;
l_event1_3 = locals.get(r'$event');
l_selectPage2_3 = l_context.selectPage(l_totalPages0_3, l_event1_3);

if (l_selectPage2_3 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_1_0 = this.getDirectiveFor(directives, 1);
this.directive_3_0 = this.getDirectiveFor(directives, 2);
this.directive_5_0 = this.getDirectiveFor(directives, 3);
this.directive_6_0 = this.getDirectiveFor(directives, 4);
this.directive_8_0 = this.getDirectiveFor(directives, 5);  }

        void dehydrateDirectives(destroyPipes) {  this.classMap0 = this.literal1 = this.DoCheck2 = this.operation_negate4 = this.cond8 = this.mapFndisabledhidden9 = this.literal10 = this.DoCheck11 = this.firstText12 = this.interpolate13 = this.operation_negate15 = this.cond18 = this.mapFndisabledhidden19 = this.literal20 = this.DoCheck21 = this.previousText22 = this.interpolate23 = this.pages24 = this.DoCheck25 = this.self26 = this.cond30 = this.mapFndisabledhidden31 = this.literal32 = this.DoCheck33 = this.nextText34 = this.interpolate35 = this.self36 = this.cond39 = this.mapFndisabledhidden40 = this.literal41 = this.DoCheck42 = this.lastText43 = this.interpolate44 = this.directive_0_0 = this.directive_1_0 = this.directive_3_0 = this.directive_5_0 = this.directive_6_0 = this.directive_8_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("elementProperty", 1, "hidden", null, "!boundaryLinks in Pagination@3:8"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{firstText}} in Pagination@4:46"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 3, "hidden", null, "!directionLinks in Pagination@9:8"), import0.ChangeDetectionUtil.bindingTarget("directive", 3, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 3, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 1, null, null, "{{previousText}} in Pagination@10:53"), import0.ChangeDetectionUtil.bindingTarget("directive", 5, "ngForOf", null, "pages in Pagination@13:8"), null, import0.ChangeDetectionUtil.bindingTarget("elementProperty", 6, "hidden", null, "!directionLinks in Pagination@19:8"), import0.ChangeDetectionUtil.bindingTarget("directive", 6, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 6, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 2, null, null, "{{nextText}} in Pagination@20:53"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 8, "hidden", null, "!boundaryLinks in Pagination@24:8"), import0.ChangeDetectionUtil.bindingTarget("directive", 8, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 8, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 3, null, null, "{{lastText}} in Pagination@25:55")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(1, 0), import0.ChangeDetectionUtil.directiveIndex(3, 0), import0.ChangeDetectionUtil.directiveIndex(5, 0), import0.ChangeDetectionUtil.directiveIndex(6, 0), import0.ChangeDetectionUtil.directiveIndex(8, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Pagination_0(a);
        }
      }
    

      class _Pagination_1 extends import0.AbstractChangeDetector<import1.Pagination> {
        var keyedAccess2, cond6, mapFnactivedisabled7, literal8, DoCheck9, keyedAccess11, interpolate12, directive_0_0;

        _Pagination_1(dispatcher)
          : super("Pagination_1",
              dispatcher, 13,
              _Pagination_1._gen_propertyBindingTargets,
              _Pagination_1._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_page0,l_literal1,l_keyedAccess2,c_keyedAccess2,l_disabled3,l_SkipRecordsIfNot4,l_operation_negate5,l_cond6,c_cond6,l_mapFnactivedisabled7,l_literal8,l_DoCheck9,l_literal10,l_keyedAccess11,c_keyedAccess11,l_interpolate12;c_keyedAccess2=c_cond6=c_keyedAccess11 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_page0 = this.locals.get(r'page');
    
      
      
          
            l_literal1 = "active";
    
      
      
          
            l_keyedAccess2 = l_page0[l_literal1];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess2, this.keyedAccess2)) {
        c_keyedAccess2 = true;
        
        
        this.keyedAccess2 = l_keyedAccess2;
      }
    
      
      
          
            l_disabled3 = l_context.disabled;
    
      
      
          
      if (l_disabled3) {
      
      
          
            l_operation_negate5 = import0.ChangeDetectionUtil.operation_negate(l_keyedAccess2);
    
      
      }
          
            l_cond6 = import0.ChangeDetectionUtil.cond(l_disabled3, l_operation_negate5, l_disabled3);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_cond6, this.cond6)) {
        c_cond6 = true;
        
        
        this.cond6 = l_cond6;
      }
    
      
      
          
      if (c_keyedAccess2 || c_cond6) {       l_mapFnactivedisabled7 = import0.ChangeDetectionUtil.mapFn(["active", "disabled"])(l_keyedAccess2, l_cond6);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnactivedisabled7, this.mapFnactivedisabled7)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnactivedisabled7, l_mapFnactivedisabled7);
      }
    
      this.directive_0_0.rawClass = l_mapFnactivedisabled7;
      
      isChanged = true;
    
        
        this.mapFnactivedisabled7 = l_mapFnactivedisabled7;
      }
     }
      
      
          this.propertyBindingIndex = 1;
            l_literal8 = "pagination-page";
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
    
      
          this.propertyBindingIndex = 3;
            l_literal10 = "text";
    
      
      
          
            l_keyedAccess11 = l_page0[l_literal10];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess11, this.keyedAccess11)) {
        c_keyedAccess11 = true;
        
        
        this.keyedAccess11 = l_keyedAccess11;
      }
    
      
      
          
      if (c_keyedAccess11) {       l_interpolate12 = "${""}${import0.ChangeDetectionUtil.s(l_keyedAccess11)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate12, this.interpolate12)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate12, l_interpolate12);
      }
    
      this.notifyDispatcher(l_interpolate12);
      
    
        
        this.interpolate12 = l_interpolate12;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_page0_0,l_literal1_0,l_keyedAccess2_0,l_event3_0,l_selectPage4_0;
              if (eventName == "click" && elIndex == 1) {
    l_page0_0 = locals.get(r'page');
l_literal1_0 = "number";
l_keyedAccess2_0 = l_page0_0[l_literal1_0];
l_event3_0 = locals.get(r'$event');
l_selectPage4_0 = l_context.selectPage(l_keyedAccess2_0, l_event3_0);

if (l_selectPage4_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.keyedAccess2 = this.cond6 = this.mapFnactivedisabled7 = this.literal8 = this.DoCheck9 = this.keyedAccess11 = this.interpolate12 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "{active: page['active'], disabled: disabled && !page['active']} in Pagination@13:32"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "pagination-page in "), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{page['text']}} in Pagination@14:59")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Pagination_1(a);
        }
      }
    

      class _HostPagination_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostPagination_0(dispatcher)
          : super("HostPagination_0",
              dispatcher, 1,
              _HostPagination_0._gen_propertyBindingTargets,
              _HostPagination_0._gen_directiveIndices,
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
          return new _HostPagination_0(a);
        }
      }
    

      class _Pager_0 extends import0.AbstractChangeDetector<import1.Pager> {
        var noPrevious0, align1, mapFndisabledpreviouspullleft2, DoCheck3, previousText4, interpolate5, noNext6, mapFndisablednextpullright7, DoCheck8, nextText9, interpolate10, directive_0_0, directive_2_0;

        _Pager_0(dispatcher)
          : super("Pager_0",
              dispatcher, 11,
              _Pager_0._gen_propertyBindingTargets,
              _Pager_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_noPrevious0,c_noPrevious0,l_align1,c_align1,l_mapFndisabledpreviouspullleft2,l_DoCheck3,l_previousText4,c_previousText4,l_interpolate5,l_noNext6,c_noNext6,l_mapFndisablednextpullright7,l_DoCheck8,l_nextText9,c_nextText9,l_interpolate10;c_noPrevious0=c_align1=c_previousText4=c_noNext6=c_nextText9 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_noPrevious0 = l_context.noPrevious();
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_noPrevious0, this.noPrevious0)) {
        c_noPrevious0 = true;
        
        
        this.noPrevious0 = l_noPrevious0;
      }
    
      
      
          
            l_align1 = l_context.align;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_align1, this.align1)) {
        c_align1 = true;
        
        
        this.align1 = l_align1;
      }
    
      
      
          
      if (c_noPrevious0 || c_align1 || c_align1) {       l_mapFndisabledpreviouspullleft2 = import0.ChangeDetectionUtil.mapFn(["disabled", "previous", "pull-left"])(l_noPrevious0, l_align1, l_align1);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisabledpreviouspullleft2, this.mapFndisabledpreviouspullleft2)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisabledpreviouspullleft2, l_mapFndisabledpreviouspullleft2);
      }
    
      this.directive_0_0.rawClass = l_mapFndisabledpreviouspullleft2;
      
      isChanged = true;
    
        
        this.mapFndisabledpreviouspullleft2 = l_mapFndisabledpreviouspullleft2;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 2;
            l_previousText4 = l_context.previousText;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_previousText4, this.previousText4)) {
        c_previousText4 = true;
        
        
        this.previousText4 = l_previousText4;
      }
    
      
      
          
      if (c_previousText4) {       l_interpolate5 = "${""}${import0.ChangeDetectionUtil.s(l_previousText4)}${""}";
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
    
      
          this.propertyBindingIndex = 3;
            l_noNext6 = l_context.noNext();
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_noNext6, this.noNext6)) {
        c_noNext6 = true;
        
        
        this.noNext6 = l_noNext6;
      }
    
      
      
          
      if (c_noNext6 || c_align1 || c_align1) {       l_mapFndisablednextpullright7 = import0.ChangeDetectionUtil.mapFn(["disabled", "next", "pull-right"])(l_noNext6, l_align1, l_align1);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFndisablednextpullright7, this.mapFndisablednextpullright7)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFndisablednextpullright7, l_mapFndisablednextpullright7);
      }
    
      this.directive_2_0.rawClass = l_mapFndisablednextpullright7;
      
      isChanged = true;
    
        
        this.mapFndisablednextpullright7 = l_mapFndisablednextpullright7;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_2_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 5;
            l_nextText9 = l_context.nextText;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_nextText9, this.nextText9)) {
        c_nextText9 = true;
        
        
        this.nextText9 = l_nextText9;
      }
    
      
      
          
      if (c_nextText9) {       l_interpolate10 = "${""}${import0.ChangeDetectionUtil.s(l_nextText9)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate10, this.interpolate10)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate10, l_interpolate10);
      }
    
      this.notifyDispatcher(l_interpolate10);
      
    
        
        this.interpolate10 = l_interpolate10;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_page0_0,l_literal1_0,l_operation_subtract2_0,l_event3_0,l_selectPage4_0,l_page0_1,l_literal1_1,l_operation_add2_1,l_event3_1,l_selectPage4_1;
              if (eventName == "click" && elIndex == 1) {
    l_page0_0 = l_context.page;
l_literal1_0 = 1;
l_operation_subtract2_0 = import0.ChangeDetectionUtil.operation_subtract(l_page0_0, l_literal1_0);
l_event3_0 = locals.get(r'$event');
l_selectPage4_0 = l_context.selectPage(l_operation_subtract2_0, l_event3_0);

if (l_selectPage4_0 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 3) {
    l_page0_1 = l_context.page;
l_literal1_1 = 1;
l_operation_add2_1 = import0.ChangeDetectionUtil.operation_add(l_page0_1, l_literal1_1);
l_event3_1 = locals.get(r'$event');
l_selectPage4_1 = l_context.selectPage(l_operation_add2_1, l_event3_1);

if (l_selectPage4_1 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_2_0 = this.getDirectiveFor(directives, 1);  }

        void dehydrateDirectives(destroyPipes) {  this.noPrevious0 = this.align1 = this.mapFndisabledpreviouspullleft2 = this.DoCheck3 = this.previousText4 = this.interpolate5 = this.noNext6 = this.mapFndisablednextpullright7 = this.DoCheck8 = this.nextText9 = this.interpolate10 = this.directive_0_0 = this.directive_2_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{previousText}} in Pager@1:127"), import0.ChangeDetectionUtil.bindingTarget("directive", 2, "rawClass", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 1, null, null, "{{nextText}} in Pager@2:120")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(2, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Pager_0(a);
        }
      }
    

      class _HostPager_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostPager_0(dispatcher)
          : super("HostPager_0",
              dispatcher, 1,
              _HostPager_0._gen_propertyBindingTargets,
              _HostPager_0._gen_directiveIndices,
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
          return new _HostPager_0(a);
        }
      }
    
const PaginationTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/pagination/pagination.dart|Pagination',_Pagination_0.newChangeDetector,const [const import2.TextCmd('  ', false, null),const import2.BeginElementCmd('ul', const ['class','pagination'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n    ', false, null),const import2.BeginElementCmd('li', const ['class','pagination-first'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('a', const ['href',''], const [null,'click'], const [], const [], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n\n    ', false, null),const import2.BeginElementCmd('li', const ['class','pagination-prev'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('a', const ['href',''], const [null,'click'], const [], const [], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n\n    ', false, null),const import2.EmbeddedTemplateCmd(const [], const ['page','\$implicit'], const [import4.NgFor], false, null, _Pagination_1.newChangeDetector, const [const import2.BeginElementCmd('li', const ['class','pagination-page'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('a', const ['href',''], const [null,'click'], const [], const [], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n\n    ', false, null),const import2.BeginElementCmd('li', const ['class','pagination-next'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('a', const ['href',''], const [null,'click'], const [], const [], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.TextCmd('\n\n    ', false, null),const import2.BeginElementCmd('li', const ['class','pagination-last'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('a', const ['href',''], const [null,'click'], const [], const [], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const []);
PaginationTemplateGetter() => PaginationTemplate;
const HostPaginationTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/pagination/pagination.dart|HostPagination',_HostPagination_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-pagination', const [], const [], const [], const [import1.Pagination], import2.ViewEncapsulation.None, null, PaginationTemplateGetter),const import2.EndComponentCmd()],const []));
HostPaginationTemplateGetter() => HostPaginationTemplate;
const PagerTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/pagination/pagination.dart|Pager',_Pager_0.newChangeDetector,const [const import2.BeginElementCmd('ul', const ['class','pager'], const [], const [], const [], false, null),const import2.TextCmd('\n  ', false, null),const import2.BeginElementCmd('li', const [], const [], const [], const [import3.NgClass], true, null),const import2.BeginElementCmd('a', const ['href',''], const [null,'click'], const [], const [], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null),const import2.BeginElementCmd('li', const [], const [], const [], const [import3.NgClass], true, null),const import2.BeginElementCmd('a', const ['href',''], const [null,'click'], const [], const [], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.EndElementCmd(),const import2.TextCmd('\n', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n', false, null)],const []);
PagerTemplateGetter() => PagerTemplate;
const HostPagerTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/pagination/pagination.dart|HostPager',_HostPager_0.newChangeDetector,const [const import2.BeginComponentCmd('pager', const ['ngModel',''], const [], const [], const [import1.Pager], import2.ViewEncapsulation.None, null, PagerTemplateGetter),const import2.EndComponentCmd()],const []));
HostPagerTemplateGetter() => HostPagerTemplate;
