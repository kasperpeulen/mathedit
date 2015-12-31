library asset_mathedit_lib_components_login.component_login.component.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:mathedit/components/login.component/login.component.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:ng2_strap/dropdown/index.dart' as import3;
import 'package:angular2/src/common/directives/ng_if.dart' as import4;
import 'package:mathedit/components/login.component/login.component.css.shim.dart' as import5;


      class _LoginComponent_0 extends import0.AbstractChangeDetector<import1.LoginComponent> {
        var OnInit0, isOpen1, literal2, OnInit3, isOpen4, self5, disabled6, self7, OnInit8, operation_negate10, self11, directive_1_0, directive_2_0, directive_3_0, directive_4_0, directive_5_0;

        _LoginComponent_0(dispatcher)
          : super("LoginComponent_0",
              dispatcher, 12,
              _LoginComponent_0._gen_propertyBindingTargets,
              _LoginComponent_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_OnInit0,l_isOpen1,l_literal2,l_OnInit3,l_isOpen4,l_self5,l_disabled6,l_self7,l_OnInit8,l_loggedIn9,l_operation_negate10,l_self11;
          var isChanged = false;
          var changes = null;

                
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_1_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 1;
            l_isOpen1 = this.directive_1_0.isOpen;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_isOpen1, this.isOpen1)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.isOpen1, l_isOpen1);
      }
    
      this.notifyDispatcher(l_isOpen1);
      
    
        
        this.isOpen1 = l_isOpen1;
      }
    
      
      
          this.propertyBindingIndex = 2;
            l_literal2 = true;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal2, this.literal2)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal2, l_literal2);
      }
    
      this.notifyDispatcher(l_literal2);
      
    
        
        this.literal2 = l_literal2;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_2_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 4;
            l_isOpen4 = this.directive_2_0.isOpen;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_isOpen4, this.isOpen4)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.isOpen4, l_isOpen4);
      }
    
      this.notifyDispatcher(l_isOpen4);
      
    
        
        this.isOpen4 = l_isOpen4;
      }
    
      
      
          this.propertyBindingIndex = 5;
            l_self5 = l_literal2;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self5, this.self5)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self5, l_self5);
      }
    
      this.notifyDispatcher(l_self5);
      
    
        
        this.self5 = l_self5;
      }
    
      
      
          this.propertyBindingIndex = 6;
            l_disabled6 = this.directive_2_0.disabled;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_disabled6, this.disabled6)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.disabled6, l_disabled6);
      }
    
      this.notifyDispatcher(l_disabled6);
      
    
        
        this.disabled6 = l_disabled6;
      }
    
      
      
          this.propertyBindingIndex = 7;
            l_self7 = l_literal2;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self7, this.self7)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self7, l_self7);
      }
    
      this.notifyDispatcher(l_self7);
      
    
        
        this.self7 = l_self7;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_3_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 9;
            l_loggedIn9 = l_context.loggedIn;
    
      
      
          
            l_operation_negate10 = import0.ChangeDetectionUtil.operation_negate(l_loggedIn9);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_negate10, this.operation_negate10)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_negate10, l_operation_negate10);
      }
    
      this.directive_4_0.ngIf = l_operation_negate10;
      
      isChanged = true;
    
        
        this.operation_negate10 = l_operation_negate10;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 10;
            l_self11 = l_loggedIn9;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self11, this.self11)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self11, l_self11);
      }
    
      this.directive_5_0.ngIf = l_self11;
      
      isChanged = true;
    
        
        this.self11 = l_self11;
      }
    
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_event0_0,l_preventDefault1_0,l_event0_1,l_toggleDropdown1_1,l_save0_2,l_literal0_3,l_save1_3;
              if (eventName == "click" && elIndex == 0) {
    l_event0_0 = locals.get(r'$event');
l_preventDefault1_0 = l_event0_0.preventDefault();

if (l_preventDefault1_0 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 2) {
    l_event0_1 = locals.get(r'$event');
l_toggleDropdown1_1 = this.directive_2_0.toggleDropdown(l_event0_1);

if (l_toggleDropdown1_1 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 6) {
    l_save0_2 = l_context.save();

if (l_save0_2 == false) { preventDefault = true; }
    }
    if (eventName == "click" && elIndex == 7) {
    l_literal0_3 = false;
l_save1_3 = l_context.save(l_literal0_3);

if (l_save1_3 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_1_0 = this.getDirectiveFor(directives, 0);
this.directive_2_0 = this.getDirectiveFor(directives, 1);
this.directive_3_0 = this.getDirectiveFor(directives, 2);
this.directive_4_0 = this.getDirectiveFor(directives, 3);
this.directive_5_0 = this.getDirectiveFor(directives, 4);  }

        void dehydrateDirectives(destroyPipes) {  this.OnInit0 = this.isOpen1 = this.literal2 = this.OnInit3 = this.isOpen4 = this.self5 = this.disabled6 = this.self7 = this.OnInit8 = this.operation_negate10 = this.self11 = this.directive_1_0 = this.directive_2_0 = this.directive_3_0 = this.directive_4_0 = this.directive_5_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [null, import0.ChangeDetectionUtil.bindingTarget("elementClass", 1, "open", null, "isOpen in LoginComponent@2:2"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 1, "dropdown", null, "true in LoginComponent@2:2"), null, import0.ChangeDetectionUtil.bindingTarget("elementAttribute", 2, "aria-expanded", null, "isOpen in LoginComponent@3:4"), import0.ChangeDetectionUtil.bindingTarget("elementAttribute", 2, "aria-haspopup", null, "true in LoginComponent@3:4"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 2, "disabled", null, "disabled in LoginComponent@3:4"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 2, "dropdown-toggle", null, "true in LoginComponent@3:4"), null, import0.ChangeDetectionUtil.bindingTarget("directive", 4, "ngIf", null, "!loggedIn in LoginComponent@9:26"), import0.ChangeDetectionUtil.bindingTarget("directive", 5, "ngIf", null, "loggedIn in LoginComponent@12:26")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(1, 0), import0.ChangeDetectionUtil.directiveIndex(2, 0), import0.ChangeDetectionUtil.directiveIndex(3, 0), import0.ChangeDetectionUtil.directiveIndex(4, 0), import0.ChangeDetectionUtil.directiveIndex(5, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _LoginComponent_0(a);
        }
      }
    

      class _LoginComponent_1 extends import0.AbstractChangeDetector<import1.LoginComponent> {
        

        _LoginComponent_1(dispatcher)
          : super("LoginComponent_1",
              dispatcher, 0,
              _LoginComponent_1._gen_propertyBindingTargets,
              _LoginComponent_1._gen_directiveIndices,
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
          var l_context = this.context,l_login0_0;
              if (eventName == "click" && elIndex == 0) {
    l_login0_0 = l_context.login();

if (l_login0_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        

        

        static final _gen_propertyBindingTargets = [];

        static final _gen_directiveIndices = [];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _LoginComponent_1(a);
        }
      }
    

      class _LoginComponent_2 extends import0.AbstractChangeDetector<import1.LoginComponent> {
        

        _LoginComponent_2(dispatcher)
          : super("LoginComponent_2",
              dispatcher, 0,
              _LoginComponent_2._gen_propertyBindingTargets,
              _LoginComponent_2._gen_directiveIndices,
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
          var l_context = this.context,l_logout0_0;
              if (eventName == "click" && elIndex == 0) {
    l_logout0_0 = l_context.logout();

if (l_logout0_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        

        

        static final _gen_propertyBindingTargets = [];

        static final _gen_directiveIndices = [];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _LoginComponent_2(a);
        }
      }
    

      class _HostLoginComponent_0 extends import0.AbstractChangeDetector<dynamic> {
        var directive_0_0;

        _HostLoginComponent_0(dispatcher)
          : super("HostLoginComponent_0",
              dispatcher, 0,
              _HostLoginComponent_0._gen_propertyBindingTargets,
              _HostLoginComponent_0._gen_directiveIndices,
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
          return new _HostLoginComponent_0(a);
        }
      }
    
const LoginComponentTemplate = const import2.CompiledComponentTemplate('asset:mathedit/lib/components/login.component/login.component.dart|LoginComponent',_LoginComponent_0.newChangeDetector,const [const import2.BeginElementCmd('div', const [], const [null,'click'], const [], const [], true, null),const import2.TextCmd('\n  ', false, null),const import2.TextCmd('\n  ', false, null),const import2.BeginElementCmd('div', const ['class','btn-group','dropdown',''], const [], const [], const [import3.Dropdown], true, null),const import2.TextCmd('\n    ', false, null),const import2.BeginElementCmd('button', const ['class','btn btn-primary','dropdown-toggle','','id','single-button','type','button'], const [null,'click'], const [], const [import3.DropdownToggle], true, null),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('span', const ['class','caret'], const [], const [], const [], false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.BeginElementCmd('ul', const ['aria-labelledby','single-button','class','dropdown-menu pull-right','role','menu'], const [], const [], const [import3.DropdownMenu], true, null),const import2.TextCmd('\n      ', false, null),const import2.EmbeddedTemplateCmd(const [], const [], const [import4.NgIf], false, null, _LoginComponent_1.newChangeDetector, const [const import2.BeginElementCmd('li', const ['role','menuitem'], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('a', const ['class','dropdown-item','href','#','title','ctrl-l'], const [null,'click'], const [], const [], true, null),const import2.TextCmd('Login with Github', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n      ', false, null),const import2.EmbeddedTemplateCmd(const [], const [], const [import4.NgIf], false, null, _LoginComponent_2.newChangeDetector, const [const import2.BeginElementCmd('li', const ['role','menuitem'], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('a', const ['class','dropdown-item','href','#'], const [null,'click'], const [], const [], true, null),const import2.TextCmd('Logout from GitHub', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd()]),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('li', const ['role','menuitem'], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('a', const ['class','dropdown-item','href','#','title','ctrl-k'], const [null,'click'], const [], const [], true, null),const import2.TextCmd('Save as Gist', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.BeginElementCmd('li', const ['role','menuitem'], const [], const [], const [], false, null),const import2.TextCmd('\n        ', false, null),const import2.BeginElementCmd('a', const ['class','dropdown-item','href','#'], const [null,'click'], const [], const [], true, null),const import2.TextCmd('Save as secret Gist', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n      ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n    ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n', false, null),const import2.EndElementCmd()],const [import5.STYLES]);
LoginComponentTemplateGetter() => LoginComponentTemplate;
const HostLoginComponentTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:mathedit/lib/components/login.component/login.component.dart|HostLoginComponent',_HostLoginComponent_0.newChangeDetector,const [const import2.BeginComponentCmd('login', const [], const [], const [], const [import1.LoginComponent], import2.ViewEncapsulation.Emulated, null, LoginComponentTemplateGetter),const import2.EndComponentCmd()],const []));
HostLoginComponentTemplateGetter() => HostLoginComponentTemplate;
