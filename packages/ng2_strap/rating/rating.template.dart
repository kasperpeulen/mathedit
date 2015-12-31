library asset_ng2_strap_lib_rating_rating.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/rating/rating.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_for.dart' as import3;
import 'package:angular2/src/common/directives/ng_class.dart' as import4;


      class _Rating_0 extends import0.AbstractChangeDetector<import1.Rating> {
        var length1, value2, self3, DoCheck4, directive_1_0;

        _Rating_0(dispatcher)
          : super("Rating_0",
              dispatcher, 5,
              _Rating_0._gen_propertyBindingTargets,
              _Rating_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_range0,l_length1,l_value2,l_self3,l_DoCheck4;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_range0 = l_context.range;
    
      
      
          
            l_length1 = l_range0.length;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_length1, this.length1)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.length1, l_length1);
      }
    
      this.notifyDispatcher(l_length1);
      
    
        
        this.length1 = l_length1;
      }
    
      
      
          this.propertyBindingIndex = 1;
            l_value2 = l_context.value;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_value2, this.value2)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.value2, l_value2);
      }
    
      this.notifyDispatcher(l_value2);
      
    
        
        this.value2 = l_value2;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 2;
            l_self3 = l_range0;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self3, this.self3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self3, l_self3);
      }
    
      this.directive_1_0.ngForOf = l_self3;
      
      isChanged = true;
    
        
        this.self3 = l_self3;
      }
    
      
      
          
      if (!throwOnChange) this.directive_1_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_reset0_0,l_event0_1,l_onKeydown1_1;
              if (eventName == "mouseleave" && elIndex == 0) {
    l_reset0_0 = l_context.reset();

if (l_reset0_0 == false) { preventDefault = true; }
    }
    if (eventName == "keydown" && elIndex == 0) {
    l_event0_1 = locals.get(r'$event');
l_onKeydown1_1 = l_context.onKeydown(l_event0_1);

if (l_onKeydown1_1 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_1_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.length1 = this.value2 = this.self3 = this.DoCheck4 = this.directive_1_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementAttribute", 0, "aria-valuemax", null, "range.length in Rating@0:108"), import0.ChangeDetectionUtil.bindingTarget("elementAttribute", 0, "aria-valuenow", null, "value in Rating@0:144"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "ngForOf", null, "range in Rating@1:25"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(1, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Rating_0(a);
        }
      }
    

      class _Rating_1 extends import0.AbstractChangeDetector<import1.Rating> {
        var cond7, interpolate8, keyedAccess11, cond18, literal19, DoCheck20, directive_0_0;

        _Rating_1(dispatcher)
          : super("Rating_1",
              dispatcher, 21,
              _Rating_1._gen_propertyBindingTargets,
              _Rating_1._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_index0,l_value1,l_operation_less_then2,l_SkipRecordsIfNot3,l_literal4,l_SkipRecords5,l_literal6,l_cond7,c_cond7,l_interpolate8,l_r9,l_literal10,l_keyedAccess11,l_SkipRecordsIfNot12,l_literal13,l_keyedAccess14,l_SkipRecords15,l_literal16,l_keyedAccess17,l_cond18,l_literal19,l_DoCheck20;c_cond7 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_index0 = this.locals.get(r'index');
    
      
      
          
            l_value1 = l_context.value;
    
      
      
          
            l_operation_less_then2 = import0.ChangeDetectionUtil.operation_less_then(l_index0, l_value1);
    
      
      
          
      if (l_operation_less_then2) {
      
      
          
            l_literal4 = "*";
    
      
      
          
      } else {
      
      
          
            l_literal6 = " ";
    
      
      }
          
            l_cond7 = import0.ChangeDetectionUtil.cond(l_operation_less_then2, l_literal4, l_literal6);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_cond7, this.cond7)) {
        c_cond7 = true;
        
        
        this.cond7 = l_cond7;
      }
    
      
      
          
      if (c_cond7) {       l_interpolate8 = "${"("}${import0.ChangeDetectionUtil.s(l_cond7)}${")"}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate8, this.interpolate8)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate8, l_interpolate8);
      }
    
      this.notifyDispatcher(l_interpolate8);
      
    
        
        this.interpolate8 = l_interpolate8;
      }
     }
      
      
          this.propertyBindingIndex = 1;
            l_r9 = this.locals.get(r'r');
    
      
      
          
            l_literal10 = "title";
    
      
      
          
            l_keyedAccess11 = l_r9[l_literal10];
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_keyedAccess11, this.keyedAccess11)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.keyedAccess11, l_keyedAccess11);
      }
    
      this.notifyDispatcher(l_keyedAccess11);
      
    
        
        this.keyedAccess11 = l_keyedAccess11;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 2;
      if (l_operation_less_then2) {
      
      
          
            l_literal13 = "stateOn";
    
      
      
          
            l_keyedAccess14 = l_r9[l_literal13];
    
      
      
          
      } else {
      
      
          
            l_literal16 = "stateOff";
    
      
      
          
            l_keyedAccess17 = l_r9[l_literal16];
    
      
      }
          
            l_cond18 = import0.ChangeDetectionUtil.cond(l_operation_less_then2, l_keyedAccess14, l_keyedAccess17);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_cond18, this.cond18)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.cond18, l_cond18);
      }
    
      this.directive_0_0.rawClass = l_cond18;
      
      isChanged = true;
    
        
        this.cond18 = l_cond18;
      }
    
      
      
          this.propertyBindingIndex = 3;
            l_literal19 = "glyphicon";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal19, this.literal19)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal19, l_literal19);
      }
    
      this.directive_0_0.initialClasses = l_literal19;
      
      isChanged = true;
    
        
        this.literal19 = l_literal19;
      }
    
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_index0_0,l_literal1_0,l_operation_add2_0,l_enter3_0,l_index0_1,l_literal1_1,l_operation_add2_1,l_rate3_1;
              if (eventName == "mouseenter" && elIndex == 0) {
    l_index0_0 = locals.get(r'index');
l_literal1_0 = 1;
l_operation_add2_0 = import0.ChangeDetectionUtil.operation_add(l_index0_0, l_literal1_0);
l_enter3_0 = l_context.enter(l_operation_add2_0);

if (l_enter3_0 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 0) {
    l_index0_1 = locals.get(r'index');
l_literal1_1 = 1;
l_operation_add2_1 = import0.ChangeDetectionUtil.operation_add(l_index0_1, l_literal1_1);
l_rate3_1 = l_context.rate(l_operation_add2_1);

if (l_rate3_1 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.cond7 = this.interpolate8 = this.keyedAccess11 = this.cond18 = this.literal19 = this.DoCheck20 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "({{ index < value ? '*' : ' ' }}) in Rating@2:30"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "title", null, "r['title'] in Rating@3:144"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "index < value ? r['stateOn'] : r['stateOff'] in Rating@3:87"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "glyphicon in "), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Rating_1(a);
        }
      }
    

      class _HostRating_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostRating_0(dispatcher)
          : super("HostRating_0",
              dispatcher, 1,
              _HostRating_0._gen_propertyBindingTargets,
              _HostRating_0._gen_directiveIndices,
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

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_event0_0,l_onKeydown1_0;
              if (eventName == "keydown" && elIndex == 0) {
    l_event0_0 = locals.get(r'$event');
l_onKeydown1_0 = this.directive_0_0.onKeydown(l_event0_0);

if (l_onKeydown1_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.OnInit0 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _HostRating_0(a);
        }
      }
    
const RatingTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/rating/rating.dart|Rating',_Rating_0.newChangeDetector,const [const import2.TextCmd('    ', false, null),const import2.BeginElementCmd('span', const ['aria-valuemin','0','role','slider','tabindex','0'], const [null,'mouseleave',null,'keydown'], const [], const [], true, null),const import2.TextCmd('\n      ', false, null),const import2.EmbeddedTemplateCmd(const ['ngFor',''], const ['r','\$implicit','index','index'], const [import3.NgFor], false, null, _Rating_1.newChangeDetector, const [const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('span', const ['class','sr-only'], const [], const [], const [], false, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('i', const ['class','glyphicon'], const [null,'mouseenter',null,'click'], const [], const [import4.NgClass], true, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null)]),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const []);
RatingTemplateGetter() => RatingTemplate;
const HostRatingTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/rating/rating.dart|HostRating',_HostRating_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-rating', const [], const [null,'keydown'], const [], const [import1.Rating], import2.ViewEncapsulation.None, null, RatingTemplateGetter),const import2.EndComponentCmd()],const []));
HostRatingTemplateGetter() => HostRatingTemplate;
