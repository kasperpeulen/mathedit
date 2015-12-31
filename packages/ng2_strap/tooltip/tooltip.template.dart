library asset_ng2_strap_lib_tooltip_tooltip.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/tooltip/tooltip.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_class.dart' as import3;
import 'package:angular2/src/common/directives/ng_style.dart' as import4;


      class _TooltipContainer_0 extends import0.AbstractChangeDetector<import1.TooltipContainer> {
        var classMap0, literal1, DoCheck2, top3, left4, display5, mapFntopleftdisplay6, DoCheck7, content8, interpolate9, directive_0_0, directive_0_1;

        _TooltipContainer_0(dispatcher)
          : super("TooltipContainer_0",
              dispatcher, 10,
              _TooltipContainer_0._gen_propertyBindingTargets,
              _TooltipContainer_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_classMap0,l_literal1,l_DoCheck2,l_top3,c_top3,l_left4,c_left4,l_display5,c_display5,l_mapFntopleftdisplay6,l_DoCheck7,l_content8,c_content8,l_interpolate9;c_top3=c_left4=c_display5=c_content8 = false;
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
            l_literal1 = "tooltip";
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
            l_top3 = l_context.top;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_top3, this.top3)) {
        c_top3 = true;
        
        
        this.top3 = l_top3;
      }
    
      
      
          
            l_left4 = l_context.left;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_left4, this.left4)) {
        c_left4 = true;
        
        
        this.left4 = l_left4;
      }
    
      
      
          
            l_display5 = l_context.display;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_display5, this.display5)) {
        c_display5 = true;
        
        
        this.display5 = l_display5;
      }
    
      
      
          
      if (c_top3 || c_left4 || c_display5) {       l_mapFntopleftdisplay6 = import0.ChangeDetectionUtil.mapFn(["top", "left", "display"])(l_top3, l_left4, l_display5);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFntopleftdisplay6, this.mapFntopleftdisplay6)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFntopleftdisplay6, l_mapFntopleftdisplay6);
      }
    
      this.directive_0_1.rawStyle = l_mapFntopleftdisplay6;
      
      isChanged = true;
    
        
        this.mapFntopleftdisplay6 = l_mapFntopleftdisplay6;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_0_1.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 5;
            l_content8 = l_context.content;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_content8, this.content8)) {
        c_content8 = true;
        
        
        this.content8 = l_content8;
      }
    
      
      
          
      if (c_content8) {       l_interpolate9 = "${"\n        "}${import0.ChangeDetectionUtil.s(l_content8)}${"\n      "}";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_interpolate9, this.interpolate9)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.interpolate9, l_interpolate9);
      }
    
      this.notifyDispatcher(l_interpolate9);
      
    
        
        this.interpolate9 = l_interpolate9;
      }
     }
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_0_1 = this.getDirectiveFor(directives, 1);  }

        void dehydrateDirectives(destroyPipes) {  this.classMap0 = this.literal1 = this.DoCheck2 = this.top3 = this.left4 = this.display5 = this.mapFntopleftdisplay6 = this.DoCheck7 = this.content8 = this.interpolate9 = this.directive_0_0 = this.directive_0_1 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawStyle", null, "AST"), null, import0.ChangeDetectionUtil.bindingTarget("textNode", 0, null, null, "\n        {{content}}\n       in TooltipContainer@4:33")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(0, 1)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _TooltipContainer_0(a);
        }
      }
    

      class _HostTooltipContainer_0 extends import0.AbstractChangeDetector<dynamic> {
        var directive_0_0;

        _HostTooltipContainer_0(dispatcher)
          : super("HostTooltipContainer_0",
              dispatcher, 0,
              _HostTooltipContainer_0._gen_propertyBindingTargets,
              _HostTooltipContainer_0._gen_directiveIndices,
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
          return new _HostTooltipContainer_0(a);
        }
      }
    
const TooltipContainerTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/tooltip/tooltip.dart|TooltipContainer',_TooltipContainer_0.newChangeDetector,const [const import2.TextCmd('    ', false, null),const import2.BeginElementCmd('div', const ['class','tooltip','role','tooltip'], const [], const [], const [import3.NgClass,import4.NgStyle], true, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('div', const ['class','tooltip-arrow'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('div', const ['class','tooltip-inner'], const [], const [], const [], false, null),const import2.TextCmd(null, true, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd()],const []);
TooltipContainerTemplateGetter() => TooltipContainerTemplate;
const HostTooltipContainerTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/tooltip/tooltip.dart|HostTooltipContainer',_HostTooltipContainer_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-tooltip-container', const [], const [], const [], const [import1.TooltipContainer], import2.ViewEncapsulation.None, null, TooltipContainerTemplateGetter),const import2.EndComponentCmd()],const []));
HostTooltipContainerTemplateGetter() => HostTooltipContainerTemplate;
