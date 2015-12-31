library asset_ng2_strap_lib_accordion_accordion.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/accordion/accordion.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_class.dart' as import3;
import 'package:ng2_strap/collapse/collapse.dart' as import4;


      class _Accordion_0 extends import0.AbstractChangeDetector<import1.Accordion> {
        

        _Accordion_0(dispatcher)
          : super("Accordion_0",
              dispatcher, 0,
              _Accordion_0._gen_propertyBindingTargets,
              _Accordion_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context;
          var isChanged = false;
          var changes = null;

          
        }

        

        

        

        

        

        static final _gen_propertyBindingTargets = [];

        static final _gen_directiveIndices = [];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Accordion_0(a);
        }
      }
    

      class _HostAccordion_0 extends import0.AbstractChangeDetector<dynamic> {
        var literal0, directive_0_0;

        _HostAccordion_0(dispatcher)
          : super("HostAccordion_0",
              dispatcher, 1,
              _HostAccordion_0._gen_propertyBindingTargets,
              _HostAccordion_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_literal0;
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
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.literal0 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "panel-group", null, "true in HostAccordion@0:0")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _HostAccordion_0(a);
        }
      }
    

      class _AccordionPanel_0 extends import0.AbstractChangeDetector<import1.AccordionPanel> {
        var panelClass0, literal1, DoCheck2, isDisabled3, mapFntextmuted4, DoCheck5, heading6, interpolate7, operation_negate9, isExpanded10, isCollapsed11, isCollapse12, height13, self14, isCollapsing15, directive_0_0, directive_2_0, directive_3_0;

        _AccordionPanel_0(dispatcher)
          : super("AccordionPanel_0",
              dispatcher, 16,
              _AccordionPanel_0._gen_propertyBindingTargets,
              _AccordionPanel_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_panelClass0,l_literal1,l_DoCheck2,l_isDisabled3,c_isDisabled3,l_mapFntextmuted4,l_DoCheck5,l_heading6,c_heading6,l_interpolate7,l_isOpen8,l_operation_negate9,l_isExpanded10,l_isCollapsed11,l_isCollapse12,l_height13,l_self14,l_isCollapsing15;c_isDisabled3=c_heading6 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_panelClass0 = l_context.panelClass;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_panelClass0, this.panelClass0)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.panelClass0, l_panelClass0);
      }
    
      this.directive_0_0.rawClass = l_panelClass0;
      
      isChanged = true;
    
        
        this.panelClass0 = l_panelClass0;
      }
    
      
      
          this.propertyBindingIndex = 1;
            l_literal1 = "panel";
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
            l_isDisabled3 = l_context.isDisabled;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_isDisabled3, this.isDisabled3)) {
        c_isDisabled3 = true;
        
        
        this.isDisabled3 = l_isDisabled3;
      }
    
      
      
          
      if (c_isDisabled3) {       l_mapFntextmuted4 = import0.ChangeDetectionUtil.mapFn(["text-muted"])(l_isDisabled3);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFntextmuted4, this.mapFntextmuted4)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFntextmuted4, l_mapFntextmuted4);
      }
    
      this.directive_2_0.rawClass = l_mapFntextmuted4;
      
      isChanged = true;
    
        
        this.mapFntextmuted4 = l_mapFntextmuted4;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_2_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 5;
            l_heading6 = l_context.heading;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_heading6, this.heading6)) {
        c_heading6 = true;
        
        
        this.heading6 = l_heading6;
      }
    
      
      
          
      if (c_heading6) {       l_interpolate7 = "${"\n            "}${import0.ChangeDetectionUtil.s(l_heading6)}${"\n            "}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate7, this.interpolate7)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate7, l_interpolate7);
      }
    
      this.notifyDispatcher(l_interpolate7);
      
    
        
        this.interpolate7 = l_interpolate7;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 6;
            l_isOpen8 = l_context.isOpen;
    
      
      
          
            l_operation_negate9 = import0.ChangeDetectionUtil.operation_negate(l_isOpen8);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_negate9, this.operation_negate9)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_negate9, l_operation_negate9);
      }
    
      this.directive_3_0.collapse = l_operation_negate9;
      
      isChanged = true;
    
        
        this.operation_negate9 = l_operation_negate9;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 7;
            l_isExpanded10 = this.directive_3_0.isExpanded;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_isExpanded10, this.isExpanded10)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.isExpanded10, l_isExpanded10);
      }
    
      this.notifyDispatcher(l_isExpanded10);
      
    
        
        this.isExpanded10 = l_isExpanded10;
      }
    
      
      
          this.propertyBindingIndex = 8;
            l_isCollapsed11 = this.directive_3_0.isCollapsed;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_isCollapsed11, this.isCollapsed11)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.isCollapsed11, l_isCollapsed11);
      }
    
      this.notifyDispatcher(l_isCollapsed11);
      
    
        
        this.isCollapsed11 = l_isCollapsed11;
      }
    
      
      
          this.propertyBindingIndex = 9;
            l_isCollapse12 = this.directive_3_0.isCollapse;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_isCollapse12, this.isCollapse12)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.isCollapse12, l_isCollapse12);
      }
    
      this.notifyDispatcher(l_isCollapse12);
      
    
        
        this.isCollapse12 = l_isCollapse12;
      }
    
      
      
          this.propertyBindingIndex = 10;
            l_height13 = this.directive_3_0.height;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_height13, this.height13)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.height13, l_height13);
      }
    
      this.notifyDispatcher(l_height13);
      
    
        
        this.height13 = l_height13;
      }
    
      
      
          this.propertyBindingIndex = 11;
            l_self14 = l_isExpanded10;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self14, this.self14)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self14, l_self14);
      }
    
      this.notifyDispatcher(l_self14);
      
    
        
        this.self14 = l_self14;
      }
    
      
      
          this.propertyBindingIndex = 12;
            l_isCollapsing15 = this.directive_3_0.isCollapsing;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_isCollapsing15, this.isCollapsing15)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.isCollapsing15, l_isCollapsing15);
      }
    
      this.notifyDispatcher(l_isCollapsing15);
      
    
        
        this.isCollapsing15 = l_isCollapsing15;
      }
    
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_event0_0,l_toggleOpen1_0;
              if (eventName == "click" && elIndex == 1) {
    l_event0_0 = locals.get(r'$event');
l_toggleOpen1_0 = l_context.toggleOpen(l_event0_0);

if (l_toggleOpen1_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_2_0 = this.getDirectiveFor(directives, 1);
this.directive_3_0 = this.getDirectiveFor(directives, 2);  }

        void dehydrateDirectives(destroyPipes) {  this.panelClass0 = this.literal1 = this.DoCheck2 = this.isDisabled3 = this.mapFntextmuted4 = this.DoCheck5 = this.heading6 = this.interpolate7 = this.operation_negate9 = this.isExpanded10 = this.isCollapsed11 = this.isCollapse12 = this.height13 = this.self14 = this.isCollapsing15 = this.directive_0_0 = this.directive_2_0 = this.directive_3_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 2, "rawClass", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "\n            {{heading}}\n             in AccordionPanel@4:55"), import0.ChangeDetectionUtil.bindingTarget("directive", 3, "collapse", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("elementAttribute", 3, "aria-expanded", null, "isExpanded in AccordionPanel@11:4"), import0.ChangeDetectionUtil.bindingTarget("elementAttribute", 3, "aria-hidden", null, "isCollapsed in AccordionPanel@11:4"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 3, "collapse", null, "isCollapse in AccordionPanel@11:4"), import0.ChangeDetectionUtil.bindingTarget("elementStyle", 3, "height", null, "height in AccordionPanel@11:4"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 3, "in", null, "isExpanded in AccordionPanel@11:4"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 3, "collapsing", null, "isCollapsing in AccordionPanel@11:4")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(2, 0), import0.ChangeDetectionUtil.directiveIndex(3, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _AccordionPanel_0(a);
        }
      }
    

      class _HostAccordionPanel_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, isOpen1, directive_0_0;

        _HostAccordionPanel_0(dispatcher)
          : super("HostAccordionPanel_0",
              dispatcher, 2,
              _HostAccordionPanel_0._gen_propertyBindingTargets,
              _HostAccordionPanel_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_OnInit0,l_isOpen1;
          var isChanged = false;
          var changes = null;

                
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_0_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 1;
            l_isOpen1 = this.directive_0_0.isOpen;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_isOpen1, this.isOpen1)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.isOpen1, l_isOpen1);
      }
    
      this.notifyDispatcher(l_isOpen1);
      
    
        
        this.isOpen1 = l_isOpen1;
      }
    
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.OnInit0 = this.isOpen1 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [null, import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "panel-open", null, "isOpen in HostAccordionPanel@0:0")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _HostAccordionPanel_0(a);
        }
      }
    
const AccordionTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/accordion/accordion.dart|Accordion',_Accordion_0.newChangeDetector,const [const import2.NgContentCmd(0, null)],const []);
AccordionTemplateGetter() => AccordionTemplate;
const HostAccordionTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/accordion/accordion.dart|HostAccordion',_HostAccordion_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-accordion', const [], const [], const [], const [import1.Accordion], import2.ViewEncapsulation.None, null, AccordionTemplateGetter),const import2.EndComponentCmd()],const []));
HostAccordionTemplateGetter() => HostAccordionTemplate;
const AccordionPanelTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/accordion/accordion.dart|AccordionPanel',_AccordionPanel_0.newChangeDetector,const [const import2.TextCmd('  ', false, null),const import2.BeginElementCmd('div', const ['class','panel'], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd('\n    ', false, null),const import2.BeginElementCmd('div', const ['class','panel-heading'], const [null,'click'], const [], const [], true, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('h4', const ['class','panel-title'], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('a', const ['class','accordion-toggle','href','','tabindex','0'], const [], const [], const [], false, null),const import2.TextCmd('\n          ', false, null),const import2.BeginElementCmd('span', const [], const [], const [], const [import3.NgClass], true, null),const import2.TextCmd(null, true, null),const import2.NgContentCmd(0, null),const import2.TextCmd('\n          ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.BeginElementCmd('div', const ['class','panel-collapse collapse'], const [], const [], const [import4.Collapse], true, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('div', const ['class','panel-body'], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.NgContentCmd(1, null),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const []);
AccordionPanelTemplateGetter() => AccordionPanelTemplate;
const HostAccordionPanelTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/accordion/accordion.dart|HostAccordionPanel',_HostAccordionPanel_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-accordion-panel', const [], const [], const [], const [import1.AccordionPanel], import2.ViewEncapsulation.None, null, AccordionPanelTemplateGetter),const import2.EndComponentCmd()],const []));
HostAccordionPanelTemplateGetter() => HostAccordionPanelTemplate;
