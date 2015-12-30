library asset_mathedit_lib_components_math_edit.component_math_edit.component.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:mathedit/components/math_edit.component/math_edit.component.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:mathedit/components/editor.component/editor.component.dart' as import3;
import 'package:mathedit/components/editor.component/editor.component.template.dart' as import4;
import 'package:mathedit/components/preview.component/preview.component.dart' as import5;
import 'package:mathedit/components/preview.component/preview.component.template.dart' as import6;
import 'package:mathedit/components/math_edit.component/math_edit.component.css.dart' as import7;


      class _MathEditComponent_0 extends import0.AbstractChangeDetector<import1.MathEditComponent> {
        var operation_negate1, gistValue2, OnInit3, directive_0_0, directive_1_0;

        _MathEditComponent_0(dispatcher)
          : super("MathEditComponent_0",
              dispatcher, 4,
              _MathEditComponent_0._gen_propertyBindingTargets,
              _MathEditComponent_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_loaded0,l_operation_negate1,l_gistValue2,l_OnInit3;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_loaded0 = l_context.loaded;
    
      
      
          
            l_operation_negate1 = import0.ChangeDetectionUtil.operation_negate(l_loaded0);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_negate1, this.operation_negate1)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_negate1, l_operation_negate1);
      }
    
      this.notifyDispatcher(l_operation_negate1);
      
    
        
        this.operation_negate1 = l_operation_negate1;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 1;
            l_gistValue2 = l_context.gistValue;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_gistValue2, this.gistValue2)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.gistValue2, l_gistValue2);
      }
    
      this.directive_0_0.textareaValue = l_gistValue2;
      
      isChanged = true;
    
        
        this.gistValue2 = l_gistValue2;
      }
    
      
      
          
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_0_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_event0_0,l_onTextareaChange1_0,l_event0_1,l_currentTarget1_1,l_onClick2_1;
              if (eventName == "value" && elIndex == 0) {
    l_event0_0 = locals.get(r'$event');
l_onTextareaChange1_0 = l_context.onTextareaChange(l_event0_0);

if (l_onTextareaChange1_0 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 0) {
    l_event0_1 = locals.get(r'$event');
l_currentTarget1_1 = l_event0_1.currentTarget;
l_onClick2_1 = this.directive_0_0.onClick(l_currentTarget1_1);

if (l_onClick2_1 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_1_0 = this.getDirectiveFor(directives, 1);  }

        void dehydrateDirectives(destroyPipes) {  this.operation_negate1 = this.gistValue2 = this.OnInit3 = this.directive_0_0 = this.directive_1_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "hidden", null, "!loaded in MathEditComponent@0:8"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "textareaValue", null, "AST"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(1, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _MathEditComponent_0(a);
        }
      }
    

      class _HostMathEditComponent_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostMathEditComponent_0(dispatcher)
          : super("HostMathEditComponent_0",
              dispatcher, 1,
              _HostMathEditComponent_0._gen_propertyBindingTargets,
              _HostMathEditComponent_0._gen_directiveIndices,
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
          var l_context = this.context,l_event0_0,l_onSave1_0,l_event0_1,l_onLogin1_1;
              if (eventName == "keydown.control.k" && elIndex == 0) {
    l_event0_0 = locals.get(r'$event');
l_onSave1_0 = this.directive_0_0.onSave(l_event0_0);

if (l_onSave1_0 == false) { preventDefault = true; }
    }
    if (eventName == "keydown.control.l" && elIndex == 0) {
    l_event0_1 = locals.get(r'$event');
l_onLogin1_1 = this.directive_0_0.onLogin(l_event0_1);

if (l_onLogin1_1 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.OnInit0 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _HostMathEditComponent_0(a);
        }
      }
    
const MathEditComponentTemplate = const import2.CompiledComponentTemplate('asset:mathedit/lib/components/math_edit.component/math_edit.component.dart|MathEditComponent',_MathEditComponent_0.newChangeDetector,const [const import2.BeginComponentCmd('editor', const ['style','flex: 1;'], const [null,'value',null,'click'], const [], const [import3.EditorComponent], import2.ViewEncapsulation.None, null, import4.EditorComponentTemplateGetter),const import2.EndComponentCmd(),const import2.TextCmd('\n\n', false, null),const import2.BeginComponentCmd('preview', const ['style','flex: 1;'], const [], const [], const [import5.PreviewComponent], import2.ViewEncapsulation.None, null, import6.PreviewComponentTemplateGetter),const import2.EndComponentCmd(),const import2.TextCmd('\n\n', false, null),const import2.BeginElementCmd('div', const [], const [], const ['editor',null], const [], true, null),const import2.EndElementCmd()],const [import7.STYLES]);
MathEditComponentTemplateGetter() => MathEditComponentTemplate;
const HostMathEditComponentTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:mathedit/lib/components/math_edit.component/math_edit.component.dart|HostMathEditComponent',_HostMathEditComponent_0.newChangeDetector,const [const import2.BeginComponentCmd('math-edit', const [], const [null,'keydown.control.k',null,'keydown.control.l'], const [], const [import1.MathEditComponent], import2.ViewEncapsulation.None, null, MathEditComponentTemplateGetter),const import2.EndComponentCmd()],const []));
HostMathEditComponentTemplateGetter() => HostMathEditComponentTemplate;
