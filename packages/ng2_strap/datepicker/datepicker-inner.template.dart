library asset_ng2_strap_lib_datepicker_datepicker_inner.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/datepicker/datepicker-inner.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;


      class _DatePickerInner_0 extends import0.AbstractChangeDetector<import1.DatePickerInner> {
        var operation_equals2;

        _DatePickerInner_0(dispatcher)
          : super("DatePickerInner_0",
              dispatcher, 3,
              _DatePickerInner_0._gen_propertyBindingTargets,
              _DatePickerInner_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_datepickerMode0,l_literal1,l_operation_equals2;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_datepickerMode0 = l_context.datepickerMode;
    
      
      
          
            l_literal1 = null;
    
      
      
          
            l_operation_equals2 = import0.ChangeDetectionUtil.operation_equals(l_datepickerMode0, l_literal1);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_equals2, this.operation_equals2)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_equals2, l_operation_equals2);
      }
    
      this.notifyDispatcher(l_operation_equals2);
      
    
        
        this.operation_equals2 = l_operation_equals2;
      }
    
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        

        void dehydrateDirectives(destroyPipes) {  this.operation_equals2 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 0, "hidden", null, "datepickerMode == null in DatePickerInner@0:5")];

        static final _gen_directiveIndices = [];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _DatePickerInner_0(a);
        }
      }
    

      class _HostDatePickerInner_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, directive_0_0;

        _HostDatePickerInner_0(dispatcher)
          : super("HostDatePickerInner_0",
              dispatcher, 1,
              _HostDatePickerInner_0._gen_propertyBindingTargets,
              _HostDatePickerInner_0._gen_directiveIndices,
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
          return new _HostDatePickerInner_0(a);
        }
      }
    
const DatePickerInnerTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/datepicker/datepicker-inner.dart|DatePickerInner',_DatePickerInner_0.newChangeDetector,const [const import2.BeginElementCmd('div', const ['class','well well-sm bg-faded p-a card','role','application'], const [], const [], const [], true, null),const import2.TextCmd('\n  ', false, null),const import2.NgContentCmd(0, null),const import2.TextCmd('\n', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const []);
DatePickerInnerTemplateGetter() => DatePickerInnerTemplate;
const HostDatePickerInnerTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/datepicker/datepicker-inner.dart|HostDatePickerInner',_HostDatePickerInner_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-datepicker-inner', const [], const [], const [], const [import1.DatePickerInner], import2.ViewEncapsulation.None, null, DatePickerInnerTemplateGetter),const import2.EndComponentCmd()],const []));
HostDatePickerInnerTemplateGetter() => HostDatePickerInnerTemplate;
