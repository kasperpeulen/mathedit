library asset_ng2_strap_lib_tabs_tabs.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/tabs/tabs.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_class.dart' as import3;
import 'package:angular2/src/common/directives/ng_for.dart' as import4;
import 'package:ng2_strap/common.dart' as import5;


      class _Tabset_0 extends import0.AbstractChangeDetector<import1.Tabset> {
        var vertical0, justified1, operation_equals4, operation_equals6, mapFnnavstackednavjustifiednavtabsnavpills7, literal8, DoCheck9, tabs10, DoCheck11, directive_0_0, directive_1_0;

        _Tabset_0(dispatcher)
          : super("Tabset_0",
              dispatcher, 12,
              _Tabset_0._gen_propertyBindingTargets,
              _Tabset_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_vertical0,c_vertical0,l_justified1,c_justified1,l_type2,l_literal3,l_operation_equals4,c_operation_equals4,l_literal5,l_operation_equals6,c_operation_equals6,l_mapFnnavstackednavjustifiednavtabsnavpills7,l_literal8,l_DoCheck9,l_tabs10,l_DoCheck11;c_vertical0=c_justified1=c_operation_equals4=c_operation_equals6 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_vertical0 = l_context.vertical;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_vertical0, this.vertical0)) {
        c_vertical0 = true;
        
        
        this.vertical0 = l_vertical0;
      }
    
      
      
          
            l_justified1 = l_context.justified;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_justified1, this.justified1)) {
        c_justified1 = true;
        
        
        this.justified1 = l_justified1;
      }
    
      
      
          
            l_type2 = l_context.type;
    
      
      
          
            l_literal3 = "tabs";
    
      
      
          
            l_operation_equals4 = import0.ChangeDetectionUtil.operation_equals(l_type2, l_literal3);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_equals4, this.operation_equals4)) {
        c_operation_equals4 = true;
        
        
        this.operation_equals4 = l_operation_equals4;
      }
    
      
      
          
            l_literal5 = "pills";
    
      
      
          
            l_operation_equals6 = import0.ChangeDetectionUtil.operation_equals(l_type2, l_literal5);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_equals6, this.operation_equals6)) {
        c_operation_equals6 = true;
        
        
        this.operation_equals6 = l_operation_equals6;
      }
    
      
      
          
      if (c_vertical0 || c_justified1 || c_operation_equals4 || c_operation_equals6) {       l_mapFnnavstackednavjustifiednavtabsnavpills7 = import0.ChangeDetectionUtil.mapFn(["nav-stacked", "nav-justified", "nav-tabs", "nav-pills"])(l_vertical0, l_justified1, l_operation_equals4, l_operation_equals6);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnnavstackednavjustifiednavtabsnavpills7, this.mapFnnavstackednavjustifiednavtabsnavpills7)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnnavstackednavjustifiednavtabsnavpills7, l_mapFnnavstackednavjustifiednavtabsnavpills7);
      }
    
      this.directive_0_0.rawClass = l_mapFnnavstackednavjustifiednavtabsnavpills7;
      
      isChanged = true;
    
        
        this.mapFnnavstackednavjustifiednavtabsnavpills7 = l_mapFnnavstackednavjustifiednavtabsnavpills7;
      }
     }
      
      
          this.propertyBindingIndex = 1;
            l_literal8 = "nav";
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
            l_tabs10 = l_context.tabs;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_tabs10, this.tabs10)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.tabs10, l_tabs10);
      }
    
      this.directive_1_0.ngForOf = l_tabs10;
      
      isChanged = true;
    
        
        this.tabs10 = l_tabs10;
      }
    
      
      
          
      if (!throwOnChange) this.directive_1_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_event0_0,l_preventDefault1_0;
              if (eventName == "click" && elIndex == 0) {
    l_event0_0 = locals.get(r'$event');
l_preventDefault1_0 = l_event0_0.preventDefault();

if (l_preventDefault1_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_1_0 = this.getDirectiveFor(directives, 1);  }

        void dehydrateDirectives(destroyPipes) {  this.vertical0 = this.justified1 = this.operation_equals4 = this.operation_equals6 = this.mapFnnavstackednavjustifiednavtabsnavpills7 = this.literal8 = this.DoCheck9 = this.tabs10 = this.DoCheck11 = this.directive_0_0 = this.directive_1_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 1, "ngForOf", null, "tabs in Tabset@8:12"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(1, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Tabset_0(a);
        }
      }
    

      class _Tabset_1 extends import0.AbstractChangeDetector<import1.Tabset> {
        var active1, disabled2, mapFnactivedisabled3, literal4, DoCheck5, mapFnactivedisabled6, literal7, DoCheck8, headingRef9, heading10, interpolate11, directive_0_0, directive_1_0, directive_2_0;

        _Tabset_1(dispatcher)
          : super("Tabset_1",
              dispatcher, 12,
              _Tabset_1._gen_propertyBindingTargets,
              _Tabset_1._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_tabz0,l_active1,c_active1,l_disabled2,c_disabled2,l_mapFnactivedisabled3,l_literal4,l_DoCheck5,l_mapFnactivedisabled6,l_literal7,l_DoCheck8,l_headingRef9,l_heading10,c_heading10,l_interpolate11;c_active1=c_disabled2=c_heading10 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_tabz0 = this.locals.get(r'tabz');
    
      
      
          
            l_active1 = l_tabz0.active;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_active1, this.active1)) {
        c_active1 = true;
        
        
        this.active1 = l_active1;
      }
    
      
      
          
            l_disabled2 = l_tabz0.disabled;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_disabled2, this.disabled2)) {
        c_disabled2 = true;
        
        
        this.disabled2 = l_disabled2;
      }
    
      
      
          
      if (c_active1 || c_disabled2) {       l_mapFnactivedisabled3 = import0.ChangeDetectionUtil.mapFn(["active", "disabled"])(l_active1, l_disabled2);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnactivedisabled3, this.mapFnactivedisabled3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnactivedisabled3, l_mapFnactivedisabled3);
      }
    
      this.directive_0_0.rawClass = l_mapFnactivedisabled3;
      
      isChanged = true;
    
        
        this.mapFnactivedisabled3 = l_mapFnactivedisabled3;
      }
     }
      
      
          this.propertyBindingIndex = 1;
            l_literal4 = "nav-item";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal4, this.literal4)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal4, l_literal4);
      }
    
      this.directive_0_0.initialClasses = l_literal4;
      
      isChanged = true;
    
        
        this.literal4 = l_literal4;
      }
    
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 3;
      if (c_active1 || c_disabled2) {       l_mapFnactivedisabled6 = import0.ChangeDetectionUtil.mapFn(["active", "disabled"])(l_active1, l_disabled2);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnactivedisabled6, this.mapFnactivedisabled6)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnactivedisabled6, l_mapFnactivedisabled6);
      }
    
      this.directive_1_0.rawClass = l_mapFnactivedisabled6;
      
      isChanged = true;
    
        
        this.mapFnactivedisabled6 = l_mapFnactivedisabled6;
      }
     }
      
      
          this.propertyBindingIndex = 4;
            l_literal7 = "nav-link";
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
            l_headingRef9 = l_tabz0.headingRef;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_headingRef9, this.headingRef9)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.headingRef9, l_headingRef9);
      }
    
      this.directive_2_0.ngTransclude = l_headingRef9;
      
      isChanged = true;
    
        
        this.headingRef9 = l_headingRef9;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 7;
            l_heading10 = l_tabz0.heading;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_heading10, this.heading10)) {
        c_heading10 = true;
        
        
        this.heading10 = l_heading10;
      }
    
      
      
          
      if (c_heading10) {       l_interpolate11 = "${""}${import0.ChangeDetectionUtil.s(l_heading10)}${""}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate11, this.interpolate11)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate11, l_interpolate11);
      }
    
      this.notifyDispatcher(l_interpolate11);
      
    
        
        this.interpolate11 = l_interpolate11;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_tabz0_0,l_literal1_0,l_active2_0;
              if (eventName == "click" && elIndex == 1) {
    l_tabz0_0 = locals.get(r'tabz');
l_literal1_0 = true;
l_active2_0 = l_tabz0_0.active = l_literal1_0;

if (l_active2_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_1_0 = this.getDirectiveFor(directives, 1);
this.directive_2_0 = this.getDirectiveFor(directives, 2);  }

        void dehydrateDirectives(destroyPipes) {  this.active1 = this.disabled2 = this.mapFnactivedisabled3 = this.literal4 = this.DoCheck5 = this.mapFnactivedisabled6 = this.literal7 = this.DoCheck8 = this.headingRef9 = this.heading10 = this.interpolate11 = this.directive_0_0 = this.directive_1_0 = this.directive_2_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "{active: tabz.active, disabled: tabz.disabled} in Tabset@8:52"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "nav-item in "), null, import0.ChangeDetectionUtil.bindingTarget("directive", 1, "rawClass", null, "{active: tabz.active, disabled: tabz.disabled} in Tabset@9:35"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "initialClasses", null, "nav-link in "), null, import0.ChangeDetectionUtil.bindingTarget("directive", 2, "ngTransclude", null, "tabz.headingRef in Tabset@10:32"), import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "{{tabz.heading}} in Tabset@10:65")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(1, 0), import0.ChangeDetectionUtil.directiveIndex(2, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Tabset_1(a);
        }
      }
    

      class _HostTabset_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostTabset_0(dispatcher)
          : super("HostTabset_0",
              dispatcher, 1,
              _HostTabset_0._gen_propertyBindingTargets,
              _HostTabset_0._gen_directiveIndices,
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
          return new _HostTabset_0(a);
        }
      }
    
const TabsetTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/tabs/tabs.dart|Tabset',_Tabset_0.newChangeDetector,const [const import2.TextCmd('    ', false, null),const import2.BeginElementCmd('ul', const ['class','nav'], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n        ', false, null),const import2.EmbeddedTemplateCmd(const [], const ['tabz','\$implicit'], const [import4.NgFor], false, null, _Tabset_1.newChangeDetector, const [const import2.BeginElementCmd('li', const ['class','nav-item'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('a', const ['class','nav-link','href',''], const [null,'click'], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n            ', false, null),const import2.BeginElementCmd('span', const ['ng-transclude',''], const [], const [], const [import5.NgTransclude], true, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n          ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.BeginElementCmd('div', const ['class','tab-content'], const [], const [], const [], false, null),const import2.TextCmd('\n      ', false, null),const import2.NgContentCmd(0, null),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const []);
TabsetTemplateGetter() => TabsetTemplate;
const HostTabsetTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/tabs/tabs.dart|HostTabset',_HostTabset_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-tabset', const [], const [], const [], const [import1.Tabset], import2.ViewEncapsulation.None, null, TabsetTemplateGetter),const import2.EndComponentCmd()],const []));
HostTabsetTemplateGetter() => HostTabsetTemplate;
