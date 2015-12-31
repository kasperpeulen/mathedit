library asset_ng2_strap_lib_typeahead_typeahead.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/typeahead/typeahead.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_for.dart' as import3;
import 'package:angular2/src/common/directives/ng_class.dart' as import4;
import 'package:angular2/src/common/forms/directives/ng_model.dart' as import5;
import 'package:angular2/src/common/forms/directives/default_value_accessor.dart' as import6;
import 'package:angular2/src/common/forms/directives/ng_control_status.dart' as import7;


      class _TypeaheadContainer_0 extends import0.AbstractChangeDetector<import1.TypeaheadContainer> {
        var top0, left1, display2, mapFntopleftdisplay3, matches4, DoCheck5, directive_1_0;

        _TypeaheadContainer_0(dispatcher)
          : super("TypeaheadContainer_0",
              dispatcher, 6,
              _TypeaheadContainer_0._gen_propertyBindingTargets,
              _TypeaheadContainer_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_top0,c_top0,l_left1,c_left1,l_display2,c_display2,l_mapFntopleftdisplay3,l_matches4,l_DoCheck5;c_top0=c_left1=c_display2 = false;
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
            l_matches4 = l_context.matches;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_matches4, this.matches4)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.matches4, l_matches4);
      }
    
      this.directive_1_0.ngForOf = l_matches4;
      
      isChanged = true;
    
        
        this.matches4 = l_matches4;
      }
    
      
      
          
      if (!throwOnChange) this.directive_1_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_1_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.top0 = this.left1 = this.display2 = this.mapFntopleftdisplay3 = this.matches4 = this.DoCheck5 = this.directive_1_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "ng-style", null, "{top: top, left: left, display: display} in TypeaheadContainer@1:6"), import0.ChangeDetectionUtil.bindingTarget("directive", 1, "ngForOf", null, "matches in TypeaheadContainer@3:8"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(1, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _TypeaheadContainer_0(a);
        }
      }
    

      class _TypeaheadContainer_1 extends import0.AbstractChangeDetector<import1.TypeaheadContainer> {
        var isActive1, mapFnactive2, DoCheck3, hightlight5, directive_0_0;

        _TypeaheadContainer_1(dispatcher)
          : super("TypeaheadContainer_1",
              dispatcher, 6,
              _TypeaheadContainer_1._gen_propertyBindingTargets,
              _TypeaheadContainer_1._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_match0,l_isActive1,c_isActive1,l_mapFnactive2,l_DoCheck3,l_query4,l_hightlight5;c_isActive1 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_match0 = this.locals.get(r'match');
    
      
      
          
            l_isActive1 = l_context.isActive(l_match0);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_isActive1, this.isActive1)) {
        c_isActive1 = true;
        
        
        this.isActive1 = l_isActive1;
      }
    
      
      
          
      if (c_isActive1) {       l_mapFnactive2 = import0.ChangeDetectionUtil.mapFn(["active"])(l_isActive1);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnactive2, this.mapFnactive2)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnactive2, l_mapFnactive2);
      }
    
      this.directive_0_0.rawClass = l_mapFnactive2;
      
      isChanged = true;
    
        
        this.mapFnactive2 = l_mapFnactive2;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 2;
            l_query4 = l_context.query;
    
      
      
          
            l_hightlight5 = l_context.hightlight(l_match0, l_query4);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_hightlight5, this.hightlight5)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.hightlight5, l_hightlight5);
      }
    
      this.notifyDispatcher(l_hightlight5);
      
    
        
        this.hightlight5 = l_hightlight5;
      }
    
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_match0_0,l_selectActive1_0,l_match0_1,l_event1_1,l_selectMatch2_1;
              if (eventName == "mouseenter" && elIndex == 0) {
    l_match0_0 = locals.get(r'match');
l_selectActive1_0 = l_context.selectActive(l_match0_0);

if (l_selectActive1_0 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 1) {
    l_match0_1 = locals.get(r'match');
l_event1_1 = locals.get(r'$event');
l_selectMatch2_1 = l_context.selectMatch(l_match0_1, l_event1_1);

if (l_selectMatch2_1 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.isActive1 = this.mapFnactive2 = this.DoCheck3 = this.hightlight5 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "{active: isActive(match) } in TypeaheadContainer@4:8"), null, import0.ChangeDetectionUtil.bindingTarget("elementProperty", 1, "innerHTML", null, "hightlight(match, query) in TypeaheadContainer@6:71")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _TypeaheadContainer_1(a);
        }
      }
    

      class _HostTypeaheadContainer_0 extends import0.AbstractChangeDetector<dynamic> {
        var directive_0_0;

        _HostTypeaheadContainer_0(dispatcher)
          : super("HostTypeaheadContainer_0",
              dispatcher, 0,
              _HostTypeaheadContainer_0._gen_propertyBindingTargets,
              _HostTypeaheadContainer_0._gen_directiveIndices,
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
          return new _HostTypeaheadContainer_0(a);
        }
      }
    

      class _Typeahead_0 extends import0.AbstractChangeDetector<import1.Typeahead> {
        var model1, OnChanges2, ngClassInvalid3, ngClassTouched4, ngClassUntouched5, ngClassValid6, ngClassDirty7, ngClassPristine8, directive_0_0, directive_0_1, directive_0_2;

        _Typeahead_0(dispatcher)
          : super("Typeahead_0",
              dispatcher, 9,
              _Typeahead_0._gen_propertyBindingTargets,
              _Typeahead_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_cd0,l_model1,l_OnChanges2,l_ngClassInvalid3,l_ngClassTouched4,l_ngClassUntouched5,l_ngClassValid6,l_ngClassDirty7,l_ngClassPristine8;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_cd0 = l_context.cd;
    
      
      
          
            l_model1 = l_cd0.model;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_model1, this.model1)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.model1, l_model1);
      }
    
      this.directive_0_0.model = l_model1;
      
      isChanged = true;
    
        changes = addChange(changes, this.model1, l_model1);
        this.model1 = l_model1;
      }
    
      
      
          
      if (!throwOnChange && changes != null) this.directive_0_0.ngOnChanges(changes);
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 2;
            l_ngClassInvalid3 = this.directive_0_2.ngClassInvalid;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassInvalid3, this.ngClassInvalid3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassInvalid3, l_ngClassInvalid3);
      }
    
      this.notifyDispatcher(l_ngClassInvalid3);
      
    
        
        this.ngClassInvalid3 = l_ngClassInvalid3;
      }
    
      
      
          this.propertyBindingIndex = 3;
            l_ngClassTouched4 = this.directive_0_2.ngClassTouched;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassTouched4, this.ngClassTouched4)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassTouched4, l_ngClassTouched4);
      }
    
      this.notifyDispatcher(l_ngClassTouched4);
      
    
        
        this.ngClassTouched4 = l_ngClassTouched4;
      }
    
      
      
          this.propertyBindingIndex = 4;
            l_ngClassUntouched5 = this.directive_0_2.ngClassUntouched;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassUntouched5, this.ngClassUntouched5)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassUntouched5, l_ngClassUntouched5);
      }
    
      this.notifyDispatcher(l_ngClassUntouched5);
      
    
        
        this.ngClassUntouched5 = l_ngClassUntouched5;
      }
    
      
      
          this.propertyBindingIndex = 5;
            l_ngClassValid6 = this.directive_0_2.ngClassValid;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassValid6, this.ngClassValid6)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassValid6, l_ngClassValid6);
      }
    
      this.notifyDispatcher(l_ngClassValid6);
      
    
        
        this.ngClassValid6 = l_ngClassValid6;
      }
    
      
      
          this.propertyBindingIndex = 6;
            l_ngClassDirty7 = this.directive_0_2.ngClassDirty;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassDirty7, this.ngClassDirty7)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassDirty7, l_ngClassDirty7);
      }
    
      this.notifyDispatcher(l_ngClassDirty7);
      
    
        
        this.ngClassDirty7 = l_ngClassDirty7;
      }
    
      
      
          this.propertyBindingIndex = 7;
            l_ngClassPristine8 = this.directive_0_2.ngClassPristine;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_ngClassPristine8, this.ngClassPristine8)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.ngClassPristine8, l_ngClassPristine8);
      }
    
      this.notifyDispatcher(l_ngClassPristine8);
      
    
        
        this.ngClassPristine8 = l_ngClassPristine8;
      }
    
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_cd0_0,l_event1_0,l_model2_0,l_event0_1,l_onTypeaheadChange1_1,l_event0_2,l_target1_2,l_value2_2,l_onChange3_2,l_onTouched0_3;
              if (eventName == "ngModelChange" && elIndex == 0) {
    l_cd0_0 = l_context.cd;
l_event1_0 = locals.get(r'$event');
l_model2_0 = l_cd0_0.model = l_event1_0;

if (l_model2_0 == false) { preventDefault = true; }
    }
    if (eventName == "keyup" && elIndex == 0) {
    l_event0_1 = locals.get(r'$event');
l_onTypeaheadChange1_1 = l_context.onTypeaheadChange(l_event0_1);

if (l_onTypeaheadChange1_1 == false) { preventDefault = true; }
    }
    if (eventName == "input" && elIndex == 0) {
    l_event0_2 = locals.get(r'$event');
l_target1_2 = l_event0_2.target;
l_value2_2 = l_target1_2.value;
l_onChange3_2 = this.directive_0_1.onChange(l_value2_2);

if (l_onChange3_2 == false) { preventDefault = true; }
    }
    if (eventName == "blur" && elIndex == 0) {
    l_onTouched0_3 = this.directive_0_1.onTouched();

if (l_onTouched0_3 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_0_1 = this.getDirectiveFor(directives, 1);
this.directive_0_2 = this.getDirectiveFor(directives, 2);  }

        void dehydrateDirectives(destroyPipes) {  this.model1 = this.OnChanges2 = this.ngClassInvalid3 = this.ngClassTouched4 = this.ngClassUntouched5 = this.ngClassValid6 = this.ngClassDirty7 = this.ngClassPristine8 = this.directive_0_0 = this.directive_0_1 = this.directive_0_2 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "model", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "ng-invalid", null, "ngClassInvalid in Typeahead@0:0"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "ng-touched", null, "ngClassTouched in Typeahead@0:0"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "ng-untouched", null, "ngClassUntouched in Typeahead@0:0"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "ng-valid", null, "ngClassValid in Typeahead@0:0"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "ng-dirty", null, "ngClassDirty in Typeahead@0:0"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "ng-pristine", null, "ngClassPristine in Typeahead@0:0")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(0, 1), import0.ChangeDetectionUtil.directiveIndex(0, 2)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Typeahead_0(a);
        }
      }
    

      class _HostTypeahead_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostTypeahead_0(dispatcher)
          : super("HostTypeahead_0",
              dispatcher, 1,
              _HostTypeahead_0._gen_propertyBindingTargets,
              _HostTypeahead_0._gen_directiveIndices,
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
          return new _HostTypeahead_0(a);
        }
      }
    
const TypeaheadContainerTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/typeahead/typeahead.dart|TypeaheadContainer',_TypeaheadContainer_0.newChangeDetector,const [const import2.TextCmd('  ', false, null),const import2.BeginElementCmd('ul', const ['class','dropdown-menu','style','display: block'], const [], const [], const [], true, null),const import2.TextCmd('\n    ', false, null),const import2.EmbeddedTemplateCmd(const [], const ['match','\$implicit'], const [import3.NgFor], false, null, _TypeaheadContainer_1.newChangeDetector, const [const import2.BeginElementCmd('li', const [], const [null,'mouseenter'], const [], const [import4.NgClass], true, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('a', const ['href','#','tabindex','-1'], const [null,'click'], const [], const [], true, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n  ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const ['n2s-typeahead-dropdown {\n  position: absolute;\n}\n']);
TypeaheadContainerTemplateGetter() => TypeaheadContainerTemplate;
const HostTypeaheadContainerTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/typeahead/typeahead.dart|HostTypeaheadContainer',_HostTypeaheadContainer_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-typeahead-dropdown', const [], const [], const [], const [import1.TypeaheadContainer], import2.ViewEncapsulation.None, null, TypeaheadContainerTemplateGetter),const import2.EndComponentCmd()],const []));
HostTypeaheadContainerTemplateGetter() => HostTypeaheadContainerTemplate;
const TypeaheadTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/typeahead/typeahead.dart|Typeahead',_Typeahead_0.newChangeDetector,const [const import2.BeginElementCmd('input', const ['class','form-control','type','text'], const [null,'ngModelChange',null,'keyup',null,'input',null,'blur'], const [], const [import5.NgModel,import6.DefaultValueAccessor,import7.NgControlStatus], true, null),const import2.EndElementCmd()],const []);
TypeaheadTemplateGetter() => TypeaheadTemplate;
const HostTypeaheadTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/typeahead/typeahead.dart|HostTypeahead',_HostTypeahead_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-typeahead', const [], const [], const [], const [import1.Typeahead], import2.ViewEncapsulation.None, null, TypeaheadTemplateGetter),const import2.EndComponentCmd()],const []));
HostTypeaheadTemplateGetter() => HostTypeaheadTemplate;
