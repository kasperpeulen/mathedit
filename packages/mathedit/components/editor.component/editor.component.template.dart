library asset_mathedit_lib_components_editor.component_editor.component.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:mathedit/components/editor.component/editor.component.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:mathedit/directives/autogrow_directive.dart' as import3;
import 'package:mathedit/components/editor.component/editor.component.css.dart' as import4;


      class _EditorComponent_0 extends import0.AbstractChangeDetector<import1.EditorComponent> {
        var textareaValue0, directive_0_0;

        _EditorComponent_0(dispatcher)
          : super("EditorComponent_0",
              dispatcher, 1,
              _EditorComponent_0._gen_propertyBindingTargets,
              _EditorComponent_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_textareaValue0;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_textareaValue0 = l_context.textareaValue;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_textareaValue0, this.textareaValue0)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.textareaValue0, l_textareaValue0);
      }
    
      this.notifyDispatcher(l_textareaValue0);
      
    
        
        this.textareaValue0 = l_textareaValue0;
      }
    
      
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_event0_0,l_target1_0,l_value2_0,l_onInput3_0,l_event0_1,l_target1_1,l_onInput2_1;
              if (eventName == "input" && elIndex == 0) {
    l_event0_0 = locals.get(r'$event');
l_target1_0 = l_event0_0.target;
l_value2_0 = l_target1_0.value;
l_onInput3_0 = l_context.onInput(l_value2_0);

if (l_onInput3_0 == false) { preventDefault = true; }
    }
    if (eventName == "input" && elIndex == 0) {
    l_event0_1 = locals.get(r'$event');
l_target1_1 = l_event0_1.target;
l_onInput2_1 = this.directive_0_0.onInput(l_target1_1);

if (l_onInput2_1 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.textareaValue0 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "value", null, "textareaValue in EditorComponent@1:4"), import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "autogrow", null, " in EditorComponent@2:4")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _EditorComponent_0(a);
        }
      }
    

      class _HostEditorComponent_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostEditorComponent_0(dispatcher)
          : super("HostEditorComponent_0",
              dispatcher, 1,
              _HostEditorComponent_0._gen_propertyBindingTargets,
              _HostEditorComponent_0._gen_directiveIndices,
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
          var l_context = this.context,l_event0_0,l_currentTarget1_0,l_onClick2_0;
              if (eventName == "click" && elIndex == 0) {
    l_event0_0 = locals.get(r'$event');
l_currentTarget1_0 = l_event0_0.currentTarget;
l_onClick2_0 = this.directive_0_0.onClick(l_currentTarget1_0);

if (l_onClick2_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.OnInit0 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _HostEditorComponent_0(a);
        }
      }
    
const EditorComponentTemplate = const import2.CompiledComponentTemplate('asset:mathedit/lib/components/editor.component/editor.component.dart|EditorComponent',_EditorComponent_0.newChangeDetector,const [const import2.BeginElementCmd('textarea', const ['placeholder','Type some LaTeX or markdown here.','spellcheck','false'], const [null,'input'], const [], const [import3.AutogrowDirective], true, null),const import2.EndElementCmd()],const [import4.STYLES]);
EditorComponentTemplateGetter() => EditorComponentTemplate;
const HostEditorComponentTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:mathedit/lib/components/editor.component/editor.component.dart|HostEditorComponent',_HostEditorComponent_0.newChangeDetector,const [const import2.BeginComponentCmd('editor', const [], const [null,'click'], const [], const [import1.EditorComponent], import2.ViewEncapsulation.None, null, EditorComponentTemplateGetter),const import2.EndComponentCmd()],const []));
HostEditorComponentTemplateGetter() => HostEditorComponentTemplate;
