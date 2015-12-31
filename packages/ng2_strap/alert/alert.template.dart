library asset_ng2_strap_lib_alert_alert.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/alert/alert.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_if.dart' as import3;
import 'package:angular2/src/common/directives/ng_class.dart' as import4;


      class _Alert_0 extends import0.AbstractChangeDetector<import1.Alert> {
        var operation_negate1, directive_0_0;

        _Alert_0(dispatcher)
          : super("Alert_0",
              dispatcher, 2,
              _Alert_0._gen_propertyBindingTargets,
              _Alert_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_closed0,l_operation_negate1;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_closed0 = l_context.closed;
    
      
      
          
            l_operation_negate1 = import0.ChangeDetectionUtil.operation_negate(l_closed0);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_negate1, this.operation_negate1)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_negate1, l_operation_negate1);
      }
    
      this.directive_0_0.ngIf = l_operation_negate1;
      
      isChanged = true;
    
        
        this.operation_negate1 = l_operation_negate1;
      }
    
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.operation_negate1 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "ngIf", null, "!closed in Alert@0:52")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Alert_0(a);
        }
      }
    

      class _Alert_1 extends import0.AbstractChangeDetector<import1.Alert> {
        var classes0, literal1, DoCheck2, closeable3, directive_0_0, directive_1_0;

        _Alert_1(dispatcher)
          : super("Alert_1",
              dispatcher, 4,
              _Alert_1._gen_propertyBindingTargets,
              _Alert_1._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_classes0,l_literal1,l_DoCheck2,l_closeable3;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_classes0 = l_context.classes;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_classes0, this.classes0)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.classes0, l_classes0);
      }
    
      this.directive_0_0.rawClass = l_classes0;
      
      isChanged = true;
    
        
        this.classes0 = l_classes0;
      }
    
      
      
          this.propertyBindingIndex = 1;
            l_literal1 = "alert";
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
            l_closeable3 = l_context.closeable;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_closeable3, this.closeable3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.closeable3, l_closeable3);
      }
    
      this.directive_1_0.ngIf = l_closeable3;
      
      isChanged = true;
    
        
        this.closeable3 = l_closeable3;
      }
    
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);
this.directive_1_0 = this.getDirectiveFor(directives, 1);  }

        void dehydrateDirectives(destroyPipes) {  this.classes0 = this.literal1 = this.DoCheck2 = this.closeable3 = this.directive_0_0 = this.directive_1_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "classes in Alert@0:32"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "alert in "), null, import0.ChangeDetectionUtil.bindingTarget("directive", 1, "ngIf", null, "closeable in Alert@1:12")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0), import0.ChangeDetectionUtil.directiveIndex(1, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Alert_1(a);
        }
      }
    

      class _Alert_2 extends import0.AbstractChangeDetector<import1.Alert> {
        

        _Alert_2(dispatcher)
          : super("Alert_2",
              dispatcher, 0,
              _Alert_2._gen_propertyBindingTargets,
              _Alert_2._gen_directiveIndices,
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
          var l_context = this.context,l_onClose0_0;
              if (eventName == "click" && elIndex == 0) {
    l_onClose0_0 = l_context.onClose();

if (l_onClose0_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        

        

        static final _gen_propertyBindingTargets = [];

        static final _gen_directiveIndices = [];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Alert_2(a);
        }
      }
    

      class _HostAlert_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostAlert_0(dispatcher)
          : super("HostAlert_0",
              dispatcher, 1,
              _HostAlert_0._gen_propertyBindingTargets,
              _HostAlert_0._gen_directiveIndices,
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
          return new _HostAlert_0(a);
        }
      }
    
const AlertTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/alert/alert.dart|Alert',_Alert_0.newChangeDetector,const [const import2.EmbeddedTemplateCmd(const [], const [], const [import3.NgIf], true, null, _Alert_1.newChangeDetector, const [const import2.BeginElementCmd('div', const ['class','alert','role','alert'], const [], const [], const [import4.NgClass], true, null),const import2.TextCmd('\n    ', false, null),const import2.EmbeddedTemplateCmd(const [], const [], const [import3.NgIf], false, null, _Alert_2.newChangeDetector, const [const import2.BeginElementCmd('button', const ['class','close','type','button'], const [null,'click'], const [], const [], true, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('span', const ['aria-hidden','true'], const [], const [], const [], false, null),const import2.TextCmd('×', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('span', const ['class','sr-only'], const [], const [], const [], false, null),const import2.TextCmd('Close', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n    ', false, null),const import2.NgContentCmd(0, null),const import2.TextCmd('\n', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n', false, null)],const []);
AlertTemplateGetter() => AlertTemplate;
const HostAlertTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/alert/alert.dart|HostAlert',_HostAlert_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-alert', const [], const [], const [], const [import1.Alert], import2.ViewEncapsulation.None, null, AlertTemplateGetter),const import2.EndComponentCmd()],const []));
HostAlertTemplateGetter() => HostAlertTemplate;
