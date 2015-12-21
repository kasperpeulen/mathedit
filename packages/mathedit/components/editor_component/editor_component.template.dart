library asset_mathedit_lib_components_editor_component_editor_component.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:mathedit/components/editor_component/editor_component.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:mathedit/components/editor_component/editor_component.css.dart' as import3;


      class _EditorComponent_0 extends import0.AbstractChangeDetector<import1.EditorComponent> {
        

        _EditorComponent_0(dispatcher)
          : super("EditorComponent_0",
              dispatcher, 0,
              _EditorComponent_0._gen_propertyBindingTargets,
              _EditorComponent_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context;
          var isChanged = false;
          var changes = null;

          
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_event0_0,l_target1_0,l_value2_0,l_onInput3_0;
              if (eventName == "input" && elIndex == 0) {
    l_event0_0 = locals.get(r'$event');
l_target1_0 = l_event0_0.target;
l_value2_0 = l_target1_0.value;
l_onInput3_0 = l_context.onInput(l_value2_0);

if (l_onInput3_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        

        

        static final _gen_propertyBindingTargets = [];

        static final _gen_directiveIndices = [];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _EditorComponent_0(a);
        }
      }
    

      class _HostEditorComponent_0 extends import0.AbstractChangeDetector<dynamic> {
        var directive_0_0;

        _HostEditorComponent_0(dispatcher)
          : super("HostEditorComponent_0",
              dispatcher, 0,
              _HostEditorComponent_0._gen_propertyBindingTargets,
              _HostEditorComponent_0._gen_directiveIndices,
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
          return new _HostEditorComponent_0(a);
        }
      }
    
const EditorComponentTemplate = const import2.CompiledComponentTemplate('asset:mathedit/lib/components/editor_component/editor_component.dart|EditorComponent',_EditorComponent_0.newChangeDetector,const [const import2.BeginElementCmd('textarea', const ['placeholder','Type some LaTeX or markdown here.','spellcheck','false'], const [null,'input'], const [], const [], true, null),const import2.EndElementCmd()],const [import3.STYLES]);
EditorComponentTemplateGetter() => EditorComponentTemplate;
const HostEditorComponentTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:mathedit/lib/components/editor_component/editor_component.dart|HostEditorComponent',_HostEditorComponent_0.newChangeDetector,const [const import2.BeginComponentCmd('editor', const [], const [], const [], const [import1.EditorComponent], import2.ViewEncapsulation.None, null, EditorComponentTemplateGetter),const import2.EndComponentCmd()],const []));
HostEditorComponentTemplateGetter() => HostEditorComponentTemplate;
