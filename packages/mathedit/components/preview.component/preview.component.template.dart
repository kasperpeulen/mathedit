library asset_mathedit_lib_components_preview.component_preview.component.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:mathedit/components/preview.component/preview.component.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:mathedit/components/preview.component/preview.component.css.dart' as import3;


      class _PreviewComponent_0 extends import0.AbstractChangeDetector<import1.PreviewComponent> {
        

        _PreviewComponent_0(dispatcher)
          : super("PreviewComponent_0",
              dispatcher, 0,
              _PreviewComponent_0._gen_propertyBindingTargets,
              _PreviewComponent_0._gen_directiveIndices,
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
          return new _PreviewComponent_0(a);
        }
      }
    

      class _HostPreviewComponent_0 extends import0.AbstractChangeDetector<dynamic> {
        var directive_0_0;

        _HostPreviewComponent_0(dispatcher)
          : super("HostPreviewComponent_0",
              dispatcher, 0,
              _HostPreviewComponent_0._gen_propertyBindingTargets,
              _HostPreviewComponent_0._gen_directiveIndices,
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
          return new _HostPreviewComponent_0(a);
        }
      }
    
const PreviewComponentTemplate = const import2.CompiledComponentTemplate('asset:mathedit/lib/components/preview.component/preview.component.dart|PreviewComponent',_PreviewComponent_0.newChangeDetector,const [const import2.BeginElementCmd('div', const ['class','preview','id','preview'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.TextCmd('\n', false, null),const import2.BeginElementCmd('div', const ['class','preview','id','buffer','style','visibility: hidden; position: absolute'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.TextCmd('\n', false, null)],const [import3.STYLES]);
PreviewComponentTemplateGetter() => PreviewComponentTemplate;
const HostPreviewComponentTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:mathedit/lib/components/preview.component/preview.component.dart|HostPreviewComponent',_HostPreviewComponent_0.newChangeDetector,const [const import2.BeginComponentCmd('preview', const [], const [], const [], const [import1.PreviewComponent], import2.ViewEncapsulation.None, null, PreviewComponentTemplateGetter),const import2.EndComponentCmd()],const []));
HostPreviewComponentTemplateGetter() => HostPreviewComponentTemplate;
