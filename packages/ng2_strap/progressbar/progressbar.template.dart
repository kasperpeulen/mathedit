library asset_ng2_strap_lib_progressbar_progressbar.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/progressbar/progressbar.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_style.dart' as import3;
import 'package:angular2/src/common/directives/ng_class.dart' as import4;


      class _Bar_0 extends import0.AbstractChangeDetector<import1.Bar> {
        var value0, operation_add5, max6, operation_add11, transition12, mapFnwidthtransition13, DoCheck14, type15, literal16, DoCheck17, directive_0_0, directive_0_1;

        _Bar_0(dispatcher)
          : super("Bar_0",
              dispatcher, 18,
              _Bar_0._gen_propertyBindingTargets,
              _Bar_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_value0,l_percent1,l_literal2,l_toStringAsFixed3,l_literal4,l_operation_add5,l_max6,l_literal7,l_operation_less_then8,l_cond9,l_toString10,l_operation_add11,c_operation_add11,l_transition12,c_transition12,l_mapFnwidthtransition13,l_DoCheck14,l_type15,l_literal16,l_DoCheck17;c_operation_add11=c_transition12 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_value0 = l_context.value;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_value0, this.value0)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.value0, l_value0);
      }
    
      this.notifyDispatcher(l_value0);
      
    
        
        this.value0 = l_value0;
      }
    
      
      
          this.propertyBindingIndex = 1;
            l_percent1 = l_context.percent;
    
      
      
          
            l_literal2 = 0;
    
      
      
          
            l_toStringAsFixed3 = l_percent1.toStringAsFixed(l_literal2);
    
      
      
          
            l_literal4 = "%";
    
      
      
          
            l_operation_add5 = import0.ChangeDetectionUtil.operation_add(l_toStringAsFixed3, l_literal4);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_add5, this.operation_add5)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_add5, l_operation_add5);
      }
    
      this.notifyDispatcher(l_operation_add5);
      
    
        
        this.operation_add5 = l_operation_add5;
      }
    
      
      
          this.propertyBindingIndex = 2;
            l_max6 = l_context.max;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_max6, this.max6)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.max6, l_max6);
      }
    
      this.notifyDispatcher(l_max6);
      
    
        
        this.max6 = l_max6;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 3;
            l_literal7 = 100;
    
      
      
          
            l_operation_less_then8 = import0.ChangeDetectionUtil.operation_less_then(l_percent1, l_literal7);
    
      
      
          
            l_cond9 = import0.ChangeDetectionUtil.cond(l_operation_less_then8, l_percent1, l_literal7);
    
      
      
          
            l_toString10 = l_cond9.toString();
    
      
      
          
            l_operation_add11 = import0.ChangeDetectionUtil.operation_add(l_toString10, l_literal4);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_add11, this.operation_add11)) {
        c_operation_add11 = true;
        
        
        this.operation_add11 = l_operation_add11;
      }
    
      
      
          
            l_transition12 = l_context.transition;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_transition12, this.transition12)) {
        c_transition12 = true;
        
        
        this.transition12 = l_transition12;
      }
    
      
      
          
      if (c_operation_add11 || c_transition12) {       l_mapFnwidthtransition13 = import0.ChangeDetectionUtil.mapFn(["width", "transition"])(l_operation_add11, l_transition12);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnwidthtransition13, this.mapFnwidthtransition13)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnwidthtransition13, l_mapFnwidthtransition13);
      }
    
      this.directive_0_0.rawStyle = l_mapFnwidthtransition13;
      
      isChanged = true;
    
        
        this.mapFnwidthtransition13 = l_mapFnwidthtransition13;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 5;
            l_type15 = l_context.type;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_type15, this.type15)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.type15, l_type15);
      }
    
      this.directive_0_1.rawClass = l_type15;
      
      isChanged = true;
    
        
        this.type15 = l_type15;
      }
    
      
      
          this.propertyBindingIndex = 6;
            l_literal16 = "progress-bar";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal16, this.literal16)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal16, l_literal16);
      }
    
      this.directive_0_1.initialClasses = l_literal16;
      
      isChanged = true;
    
        
        this.literal16 = l_literal16;
      }
    
      
      
          
      if (!throwOnChange) this.directive_0_1.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_0_1 = this.getDirectiveFor(directives, 1);  }

        void dehydrateDirectives(destroyPipes) {  this.value0 = this.operation_add5 = this.max6 = this.operation_add11 = this.transition12 = this.mapFnwidthtransition13 = this.DoCheck14 = this.type15 = this.literal16 = this.DoCheck17 = this.directive_0_0 = this.directive_0_1 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementAttribute", 0, "aria-valuenow", null, "value in Bar@6:4"), import0.ChangeDetectionUtil.bindingTarget("elementAttribute", 0, "aria-valuetext", null, "percent.toStringAsFixed(0) + '%' in Bar@7:4"), import0.ChangeDetectionUtil.bindingTarget("elementAttribute", 0, "aria-valuemax", null, "max in Bar@8:4"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawStyle", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "AST"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(0, 1)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Bar_0(a);
        }
      }
    

      class _HostBar_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostBar_0(dispatcher)
          : super("HostBar_0",
              dispatcher, 1,
              _HostBar_0._gen_propertyBindingTargets,
              _HostBar_0._gen_directiveIndices,
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
          return new _HostBar_0(a);
        }
      }
    

      class _Progressbar_0 extends import0.AbstractChangeDetector<import1.Progressbar> {
        var animate0, max1, OnInit2, max3, type4, value5, OnInit6, directive_0_0, directive_1_0;

        _Progressbar_0(dispatcher)
          : super("Progressbar_0",
              dispatcher, 7,
              _Progressbar_0._gen_propertyBindingTargets,
              _Progressbar_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_animate0,l_max1,l_OnInit2,l_max3,l_type4,l_value5,l_OnInit6;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_animate0 = l_context.animate;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_animate0, this.animate0)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.animate0, l_animate0);
      }
    
      this.directive_0_0.animate = l_animate0;
      
      isChanged = true;
    
        
        this.animate0 = l_animate0;
      }
    
      
      
          this.propertyBindingIndex = 1;
            l_max1 = l_context.max;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_max1, this.max1)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.max1, l_max1);
      }
    
      this.directive_0_0.max = l_max1;
      
      isChanged = true;
    
        
        this.max1 = l_max1;
      }
    
      
      
          
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_0_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 3;
            l_max3 = this.directive_0_0.max;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_max3, this.max3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.max3, l_max3);
      }
    
      this.notifyDispatcher(l_max3);
      
    
        
        this.max3 = l_max3;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 4;
            l_type4 = l_context.type;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_type4, this.type4)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.type4, l_type4);
      }
    
      this.directive_1_0.type = l_type4;
      
      isChanged = true;
    
        
        this.type4 = l_type4;
      }
    
      
      
          this.propertyBindingIndex = 5;
            l_value5 = l_context.value;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_value5, this.value5)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.value5, l_value5);
      }
    
      this.directive_1_0.value = l_value5;
      
      isChanged = true;
    
        
        this.value5 = l_value5;
      }
    
      
      
          
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_1_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_1_0 = this.getDirectiveFor(directives, 1);  }

        void dehydrateDirectives(destroyPipes) {  this.animate0 = this.max1 = this.OnInit2 = this.max3 = this.type4 = this.value5 = this.OnInit6 = this.directive_0_0 = this.directive_1_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "animate", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "max", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("elementAttribute", 0, "max", null, "max in Progressbar@0:4"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "type", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "value", null, "AST"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(1, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Progressbar_0(a);
        }
      }
    

      class _HostProgressbar_0 extends import0.AbstractChangeDetector<dynamic> {
        var directive_0_0;

        _HostProgressbar_0(dispatcher)
          : super("HostProgressbar_0",
              dispatcher, 0,
              _HostProgressbar_0._gen_propertyBindingTargets,
              _HostProgressbar_0._gen_directiveIndices,
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
          return new _HostProgressbar_0(a);
        }
      }
    
const BarTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/progressbar/progressbar.dart|Bar',_Bar_0.newChangeDetector,const [const import2.TextCmd('  ', false, null),const import2.BeginElementCmd('div', const ['aria-valuemin','0','class','progress-bar','role','progressbar','style','min-width: 0;'], const [], const [], const [import3.NgStyle,import4.NgClass], true, null),const import2.NgContentCmd(0, null),const import2.EndElementCmd(),const import2.TextCmd('\n', false, null)],const []);
BarTemplateGetter() => BarTemplate;
const HostBarTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/progressbar/progressbar.dart|HostBar',_HostBar_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-bar', const [], const [], const [], const [import1.Bar], import2.ViewEncapsulation.None, null, BarTemplateGetter),const import2.EndComponentCmd()],const []));
HostBarTemplateGetter() => HostBarTemplate;
const ProgressbarTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/progressbar/progressbar.dart|Progressbar',_Progressbar_0.newChangeDetector,const [const import2.TextCmd('    ', false, null),const import2.BeginElementCmd('div', const ['class','progress','n2s-progress',''], const [], const [], const [import1.Progress], true, null),const import2.TextCmd('\n      ', false, null),const import2.BeginComponentCmd('n2s-bar', const [], const [], const [], const [import1.Bar], import2.ViewEncapsulation.None, null, BarTemplateGetter),const import2.TextCmd('\n          ', false, 0),const import2.NgContentCmd(0, 0),const import2.TextCmd('\n      ', false, 0),const import2.EndComponentCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const []);
ProgressbarTemplateGetter() => ProgressbarTemplate;
const HostProgressbarTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/progressbar/progressbar.dart|HostProgressbar',_HostProgressbar_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-progressbar', const [], const [], const [], const [import1.Progressbar], import2.ViewEncapsulation.None, null, ProgressbarTemplateGetter),const import2.EndComponentCmd()],const []));
HostProgressbarTemplateGetter() => HostProgressbarTemplate;
