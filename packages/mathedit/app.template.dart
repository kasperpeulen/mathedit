library asset_mathedit_lib_app.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:mathedit/app.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:mathedit/components/editor_component/editor_component.dart' as import3;
import 'package:mathedit/components/editor_component/editor_component.template.dart' as import4;
import 'package:mathedit/components/preview_component/preview_component.dart' as import5;
import 'package:mathedit/components/preview_component/preview_component.template.dart' as import6;
import 'package:mathedit/app.css.dart' as import7;


      class _AppComponent_0 extends import0.AbstractChangeDetector<import1.AppComponent> {
        var previewValue0, directive_0_0, directive_1_0;

        _AppComponent_0(dispatcher)
          : super("AppComponent_0",
              dispatcher, 1,
              _AppComponent_0._gen_propertyBindingTargets,
              _AppComponent_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_previewValue0;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_previewValue0 = l_context.previewValue;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_previewValue0, this.previewValue0)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.previewValue0, l_previewValue0);
      }
    
      this.directive_1_0.value = l_previewValue0;
      
      isChanged = true;
    
        
        this.previewValue0 = l_previewValue0;
      }
    
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_event0_0,l_onTextareaChange1_0;
              if (eventName == "value" && elIndex == 0) {
    l_event0_0 = locals.get(r'$event');
l_onTextareaChange1_0 = l_context.onTextareaChange(l_event0_0);

if (l_onTextareaChange1_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_1_0 = this.getDirectiveFor(directives, 1);  }

        void dehydrateDirectives(destroyPipes) {  this.previewValue0 = this.directive_0_0 = this.directive_1_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 1, "value", null, null)];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(1, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _AppComponent_0(a);
        }
      }
    

      class _HostAppComponent_0 extends import0.AbstractChangeDetector<dynamic> {
        var directive_0_0;

        _HostAppComponent_0(dispatcher)
          : super("HostAppComponent_0",
              dispatcher, 0,
              _HostAppComponent_0._gen_propertyBindingTargets,
              _HostAppComponent_0._gen_directiveIndices,
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
          return new _HostAppComponent_0(a);
        }
      }
    
const AppComponentTemplate = const import2.CompiledComponentTemplate('asset:mathedit/lib/app.dart|AppComponent',_AppComponent_0.newChangeDetector,const [const import2.BeginComponentCmd('editor', const ['style','flex: 2;'], const [null,'value'], const [], const [import3.EditorComponent], import2.ViewEncapsulation.None, null, import4.EditorComponentTemplateGetter),const import2.EndComponentCmd(),const import2.TextCmd('\n\n', false, null),const import2.BeginComponentCmd('preview', const ['style','flex: 2;'], const [], const [], const [import5.PreviewComponent], import2.ViewEncapsulation.None, null, import6.PreviewComponentTemplateGetter),const import2.EndComponentCmd(),const import2.TextCmd('\n', false, null)],const [import7.STYLES]);
AppComponentTemplateGetter() => AppComponentTemplate;
const HostAppComponentTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:mathedit/lib/app.dart|HostAppComponent',_HostAppComponent_0.newChangeDetector,const [const import2.BeginComponentCmd('app', const [], const [], const [], const [import1.AppComponent], import2.ViewEncapsulation.None, null, AppComponentTemplateGetter),const import2.EndComponentCmd()],const []));
HostAppComponentTemplateGetter() => HostAppComponentTemplate;
