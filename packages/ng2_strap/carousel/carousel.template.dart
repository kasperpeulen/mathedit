library asset_ng2_strap_lib_carousel_carousel.template.dart;

import 'package:angular2/src/core/change_detection/pregen_proto_change_detector.dart' as import0;
import 'package:ng2_strap/carousel/carousel.dart' as import1;
import 'package:angular2/src/core/linker/template_commands.dart' as import2;
import 'package:angular2/src/common/directives/ng_for.dart' as import3;
import 'package:angular2/src/common/directives/ng_class.dart' as import4;


      class _Carousel_0 extends import0.AbstractChangeDetector<import1.Carousel> {
        var operation_less_or_equals_then3, self4, DoCheck5, directive_2_0;

        _Carousel_0(dispatcher)
          : super("Carousel_0",
              dispatcher, 6,
              _Carousel_0._gen_propertyBindingTargets,
              _Carousel_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_slides0,l_length1,l_literal2,l_operation_less_or_equals_then3,l_self4,l_DoCheck5;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_slides0 = l_context.slides;
    
      
      
          
            l_length1 = l_slides0.length;
    
      
      
          
            l_literal2 = 1;
    
      
      
          
            l_operation_less_or_equals_then3 = import0.ChangeDetectionUtil.operation_less_or_equals_then(l_length1, l_literal2);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_less_or_equals_then3, this.operation_less_or_equals_then3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.operation_less_or_equals_then3, l_operation_less_or_equals_then3);
      }
    
      this.notifyDispatcher(l_operation_less_or_equals_then3);
      
    
        
        this.operation_less_or_equals_then3 = l_operation_less_or_equals_then3;
      }
    
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 1;
            l_self4 = l_slides0;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self4, this.self4)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self4, l_self4);
      }
    
      this.directive_2_0.ngForOf = l_self4;
      
      isChanged = true;
    
        
        this.self4 = l_self4;
      }
    
      
      
          
      if (!throwOnChange) this.directive_2_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_pause0_0,l_play0_1;
              if (eventName == "mouseenter" && elIndex == 0) {
    l_pause0_0 = l_context.pause();

if (l_pause0_0 == false) { preventDefault = true; }
    }
    if (eventName == "mouseleave" && elIndex == 0) {
    l_play0_1 = l_context.play();

if (l_play0_1 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_2_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.operation_less_or_equals_then3 = this.self4 = this.DoCheck5 = this.directive_2_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("elementProperty", 1, "hidden", null, "slides.length <= 1 in Carousel@1:34"), import0.ChangeDetectionUtil.bindingTarget("directive", 2, "ngForOf", null, "slides in Carousel@2:9"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(2, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Carousel_0(a);
        }
      }
    

      class _Carousel_1 extends import0.AbstractChangeDetector<import1.Carousel> {
        var operation_identical3, mapFnactive4, DoCheck5, directive_0_0;

        _Carousel_1(dispatcher)
          : super("Carousel_1",
              dispatcher, 6,
              _Carousel_1._gen_propertyBindingTargets,
              _Carousel_1._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_slidez0,l_active1,l_literal2,l_operation_identical3,c_operation_identical3,l_mapFnactive4,l_DoCheck5;c_operation_identical3 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_slidez0 = this.locals.get(r'slidez');
    
      
      
          
            l_active1 = l_slidez0.active;
    
      
      
          
            l_literal2 = true;
    
      
      
          
            l_operation_identical3 = import0.ChangeDetectionUtil.operation_identical(l_active1, l_literal2);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_operation_identical3, this.operation_identical3)) {
        c_operation_identical3 = true;
        
        
        this.operation_identical3 = l_operation_identical3;
      }
    
      
      
          
      if (c_operation_identical3) {       l_mapFnactive4 = import0.ChangeDetectionUtil.mapFn(["active"])(l_operation_identical3);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnactive4, this.mapFnactive4)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnactive4, l_mapFnactive4);
      }
    
      this.directive_0_0.rawClass = l_mapFnactive4;
      
      isChanged = true;
    
        
        this.mapFnactive4 = l_mapFnactive4;
      }
     }
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

                handleEventInternal(eventName, elIndex, locals) {
          var preventDefault = false;
          var l_context = this.context,l_slidez0_0,l_select1_0;
              if (eventName == "click" && elIndex == 0) {
    l_slidez0_0 = locals.get(r'slidez');
l_select1_0 = l_context.select(l_slidez0_0);

if (l_select1_0 == false) { preventDefault = true; }
    }
          return preventDefault;
        }
      

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.operation_identical3 = this.mapFnactive4 = this.DoCheck5 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "{active: slidez.active === true} in Carousel@2:36"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Carousel_1(a);
        }
      }
    

      class _HostCarousel_0 extends import0.AbstractChangeDetector<dynamic> {
        var directive_0_0;

        _HostCarousel_0(dispatcher)
          : super("HostCarousel_0",
              dispatcher, 0,
              _HostCarousel_0._gen_propertyBindingTargets,
              _HostCarousel_0._gen_directiveIndices,
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
          return new _HostCarousel_0(a);
        }
      }
    

      class _Slide_0 extends import0.AbstractChangeDetector<import1.Slide> {
        var active0, mapFnactive1, literal2, DoCheck3, directive_0_0;

        _Slide_0(dispatcher)
          : super("Slide_0",
              dispatcher, 4,
              _Slide_0._gen_propertyBindingTargets,
              _Slide_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_active0,c_active0,l_mapFnactive1,l_literal2,l_DoCheck3;c_active0 = false;
          var isChanged = false;
          var changes = null;

                this.propertyBindingIndex = 0;
            l_active0 = l_context.active;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_active0, this.active0)) {
        c_active0 = true;
        
        
        this.active0 = l_active0;
      }
    
      
      
          
      if (c_active0) {       l_mapFnactive1 = import0.ChangeDetectionUtil.mapFn(["active"])(l_active0);
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_mapFnactive1, this.mapFnactive1)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.mapFnactive1, l_mapFnactive1);
      }
    
      this.directive_0_0.rawClass = l_mapFnactive1;
      
      isChanged = true;
    
        
        this.mapFnactive1 = l_mapFnactive1;
      }
     }
      
      
          this.propertyBindingIndex = 1;
            l_literal2 = "item text-center";
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal2, this.literal2)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal2, l_literal2);
      }
    
      this.directive_0_0.initialClasses = l_literal2;
      
      isChanged = true;
    
        
        this.literal2 = l_literal2;
      }
    
      
      
          
      if (!throwOnChange) this.directive_0_0.ngDoCheck();
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.active0 = this.mapFnactive1 = this.literal2 = this.DoCheck3 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [import0.ChangeDetectionUtil.bindingTarget("directive", 0, "rawClass", null, "AST"), import0.ChangeDetectionUtil.bindingTarget("directive", 0, "initialClasses", null, "AST"), null];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _Slide_0(a);
        }
      }
    

      class _HostSlide_0 extends import0.AbstractChangeDetector<dynamic> {
        var OnInit0, literal1, active2, self3, directive_0_0;

        _HostSlide_0(dispatcher)
          : super("HostSlide_0",
              dispatcher, 4,
              _HostSlide_0._gen_propertyBindingTargets,
              _HostSlide_0._gen_directiveIndices,
              import0.ChangeDetectionStrategy.Default) {
          dehydrateDirectives(false);
        }

        void detectChangesInRecordsInternal(throwOnChange) {
          var l_context = this.context,l_OnInit0,l_literal1,l_active2,l_self3;
          var isChanged = false;
          var changes = null;

                
      if (!throwOnChange && this.state == import0.ChangeDetectorState.NeverChecked) this.directive_0_0.ngOnInit();
            changes = null;
      
      isChanged = false;
    
      
          this.propertyBindingIndex = 1;
            l_literal1 = true;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_literal1, this.literal1)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.literal1, l_literal1);
      }
    
      this.notifyDispatcher(l_literal1);
      
    
        
        this.literal1 = l_literal1;
      }
    
      
      
          this.propertyBindingIndex = 2;
            l_active2 = this.directive_0_0.active;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_active2, this.active2)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.active2, l_active2);
      }
    
      this.notifyDispatcher(l_active2);
      
    
        
        this.active2 = l_active2;
      }
    
      
      
          this.propertyBindingIndex = 3;
            l_self3 = l_literal1;
          if (import0.ChangeDetectionUtil.looseNotIdentical(l_self3, this.self3)) {
        
                    if(import0.assertionsEnabled() && throwOnChange) {
        this.throwOnChangeError(this.self3, l_self3);
      }
    
      this.notifyDispatcher(l_self3);
      
    
        
        this.self3 = l_self3;
      }
    
            changes = null;
      
      isChanged = false;
    
      
    
        }

        

        

        

        void hydrateDirectives(directives) { this.directive_0_0 = this.getDirectiveFor(directives, 0);  }

        void dehydrateDirectives(destroyPipes) {  this.OnInit0 = this.literal1 = this.active2 = this.self3 = this.directive_0_0 = import0.ChangeDetectionUtil.uninitialized; }

        static final _gen_propertyBindingTargets = [null, import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "carousel-item", null, "true in HostSlide@0:0"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "active", null, "active in HostSlide@0:0"), import0.ChangeDetectionUtil.bindingTarget("elementClass", 0, "item", null, "true in HostSlide@0:0")];

        static final _gen_directiveIndices = [import0.ChangeDetectionUtil.directiveIndex(0, 0)];

        static import0.ChangeDetector
            newChangeDetector(a) {
          return new _HostSlide_0(a);
        }
      }
    
const CarouselTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/carousel/carousel.dart|Carousel',_Carousel_0.newChangeDetector,const [const import2.BeginElementCmd('div', const ['class','carousel slide'], const [null,'mouseenter',null,'mouseleave'], const [], const [], true, null),const import2.TextCmd('\n  ', false, null),const import2.BeginElementCmd('ol', const ['class','carousel-indicators'], const [], const [], const [], true, null),const import2.TextCmd('\n     ', false, null),const import2.EmbeddedTemplateCmd(const [], const ['slidez','\$implicit'], const [import3.NgFor], false, null, _Carousel_1.newChangeDetector, const [const import2.BeginElementCmd('li', const [], const [null,'click'], const [], const [import4.NgClass], true, null),const import2.EndElementCmd()]),const import2.TextCmd('\n  ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null),const import2.BeginElementCmd('div', const ['class','carousel-inner'], const [], const [], const [], false, null),const import2.NgContentCmd(0, null),const import2.EndElementCmd(),const import2.TextCmd('\n', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const []);
CarouselTemplateGetter() => CarouselTemplate;
const HostCarouselTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/carousel/carousel.dart|HostCarousel',_HostCarousel_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-carousel', const [], const [], const [], const [import1.Carousel], import2.ViewEncapsulation.None, null, CarouselTemplateGetter),const import2.EndComponentCmd()],const []));
HostCarouselTemplateGetter() => HostCarouselTemplate;
const SlideTemplate = const import2.CompiledComponentTemplate('asset:ng2_strap/lib/carousel/carousel.dart|Slide',_Slide_0.newChangeDetector,const [const import2.TextCmd('  ', false, null),const import2.BeginElementCmd('div', const ['class','item text-center'], const [], const [], const [import4.NgClass], true, null),const import2.TextCmd('\n    ', false, null),const import2.NgContentCmd(0, null),const import2.TextCmd('\n  ', false, null),const import2.EndElementCmd(),const import2.TextCmd('\n  ', false, null)],const []);
SlideTemplateGetter() => SlideTemplate;
const HostSlideTemplate = const import2.CompiledHostTemplate(const import2.CompiledComponentTemplate('asset:ng2_strap/lib/carousel/carousel.dart|HostSlide',_HostSlide_0.newChangeDetector,const [const import2.BeginComponentCmd('n2s-slide', const [], const [], const [], const [import1.Slide], import2.ViewEncapsulation.None, null, SlideTemplateGetter),const import2.EndComponentCmd()],const []));
HostSlideTemplateGetter() => HostSlideTemplate;
