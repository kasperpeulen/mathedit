library asset_mathedit_lib_app.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:mathedit/app.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/router/router_outlet.dart' as import3;
import 'package:mathedit/app.css.dart' as import4;


      class _AppComponent_0 extends import0.AbstractChangeDetector<import1.AppComponent> {
        var directive_0_0;

        _AppComponent_0(dispatcher)
          : super("AppComponent_0",
              dispatcher, 0,
              _AppComponent_0._gen_propertyBindingTargets,
              _AppComponent_0._gen_directiveIndices,
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
    
const AppComponentTemplate = const import2.CompiledComponentTemplate('asset:mathedit/lib/app.dart|AppComponent',_AppComponent_0.newChangeDetector,const [const import2.BeginElementCmd('router-outlet', const [], const [], const [], const [import3.RouterOutlet], true, null),const import2.EndElementCmd()],const [import4.STYLES]);
AppComponentTemplateGetter() => AppComponentTemplate;
const HostAppComponentTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:mathedit/lib/app.dart|HostAppComponent',_HostAppComponent_0.newChangeDetector,const [const import2.BeginComponentCmd('app', const [], const [], const [], const [import1.AppComponent], import2.ViewEncapsulation.None, null, AppComponentTemplateGetter),const import2.EndComponentCmd()],const []));
HostAppComponentTemplateGetter() => HostAppComponentTemplate;
