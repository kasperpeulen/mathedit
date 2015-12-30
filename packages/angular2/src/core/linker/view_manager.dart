library angular2.src.core.linker.view_manager;

import "package:angular2/src/core/di.dart"
    show Injector, Inject, Provider, Injectable, ResolvedProvider;
import "package:angular2/src/facade/lang.dart" show isPresent, isBlank;
import "package:angular2/src/facade/exceptions.dart" show BaseException;
import "view.dart" as viewModule;
import "element_ref.dart" show ElementRef, ElementRef_;
import "view_ref.dart"
    show ProtoViewRef, ViewRef, HostViewRef, internalView, internalProtoView;
import "view_container_ref.dart" show ViewContainerRef;
import "template_ref.dart" show TemplateRef, TemplateRef_;
import "package:angular2/src/core/render/api.dart"
    show Renderer, RenderViewRef, RenderFragmentRef, RenderViewWithFragments;
import "view_manager_utils.dart" show AppViewManagerUtils;
import "view_pool.dart" show AppViewPool;
import "view_listener.dart" show AppViewListener;
import "../profile/profile.dart" show wtfCreateScope, wtfLeave, WtfScopeFn;
import "proto_view_factory.dart" show ProtoViewFactory;

/**
 * Service exposing low level API for creating, moving and destroying Views.
 *
 * Most applications should use higher-level abstractions like [DynamicComponentLoader] and
 * [ViewContainerRef] instead.
 */
abstract class AppViewManager {
  /**
   * Returns a [ViewContainerRef] of the View Container at the specified location.
   */
  ViewContainerRef getViewContainer(ElementRef location);
  /**
   * Returns the [ElementRef] that makes up the specified Host View.
   */
  ElementRef getHostElement(HostViewRef hostViewRef) {
    var hostView = internalView((hostViewRef as ViewRef));
    if (!identical(hostView.proto.type, viewModule.ViewType.HOST)) {
      throw new BaseException("This operation is only allowed on host views");
    }
    return hostView.elementRefs[hostView.elementOffset];
  }

  /**
   * Searches the Component View of the Component specified via `hostLocation` and returns the
   * [ElementRef] for the Element identified via a Variable Name `variableName`.
   *
   * Throws an exception if the specified `hostLocation` is not a Host Element of a Component, or if
   * variable `variableName` couldn't be found in the Component View of this Component.
   */
  ElementRef getNamedElementInComponentView(
      ElementRef hostLocation, String variableName);
  /**
   * Returns the component instance for the provided Host Element.
   */
  dynamic getComponent(ElementRef hostLocation);
  /**
   * Creates an instance of a Component and attaches it to the first element in the global View
   * (usually DOM Document) that matches the component's selector or `overrideSelector`.
   *
   * This as a low-level way to bootstrap an application and upgrade an existing Element to a
   * Host Element. Most applications should use [DynamicComponentLoader#loadAsRoot] instead.
   *
   * The Component and its View are created based on the `hostProtoViewRef` which can be obtained
   * by compiling the component with [Compiler#compileInHost].
   *
   * Use [AppViewManager#destroyRootHostView] to destroy the created Component and it's Host
   * View.
   *
   * ### Example
   *
   * ```
   * @ng.Component({
   *   selector: 'child-component'
   * })
   * @ng.View({
   *   template: 'Child'
   * })
   * class ChildComponent {
   *
   * }
   *
   * @ng.Component({
   *   selector: 'my-app'
   * })
   * @ng.View({
   *   template: `
   *     Parent (<some-component></some-component>)
   *   `
   * })
   * class MyApp implements OnDestroy {
   *   viewRef: ng.ViewRef;
   *
   *   constructor(public appViewManager: ng.AppViewManager, compiler: ng.Compiler) {
   *     compiler.compileInHost(ChildComponent).then((protoView: ng.ProtoViewRef) => {
   *       this.viewRef = appViewManager.createRootHostView(protoView, 'some-component', null);
   *     })
   *   }
   *
   *   ngOnDestroy() {
   *     this.appViewManager.destroyRootHostView(this.viewRef);
   *     this.viewRef = null;
   *   }
   * }
   *
   * ng.bootstrap(MyApp);
   * ```
   */
  HostViewRef createRootHostView(ProtoViewRef hostProtoViewRef,
      String overrideSelector, Injector injector);
  /**
   * Destroys the Host View created via [AppViewManager#createRootHostView].
   *
   * Along with the Host View, the Component Instance as well as all nested View and Components are
   * destroyed as well.
   */
  destroyRootHostView(HostViewRef hostViewRef);
  /**
   * Instantiates an Embedded View based on the [TemplateRef `templateRef`] and inserts it
   * into the View Container specified via `viewContainerLocation` at the specified `index`.
   *
   * Returns the [ViewRef] for the newly created View.
   *
   * This as a low-level way to create and attach an Embedded via to a View Container. Most
   * applications should used [ViewContainerRef#createEmbeddedView] instead.
   *
   * Use [AppViewManager#destroyViewInContainer] to destroy the created Embedded View.
   */

  // TODO(i): this low-level version of ViewContainerRef#createEmbeddedView doesn't add anything new

  //    we should make it private, otherwise we have two apis to do the same thing.
  ViewRef createEmbeddedViewInContainer(
      ElementRef viewContainerLocation, num index, TemplateRef templateRef);
  /**
   * Instantiates a single [Component] and inserts its Host View into the View Container
   * found at `viewContainerLocation`. Within the container, the view will be inserted at position
   * specified via `index`.
   *
   * The component is instantiated using its [ProtoViewRef `protoViewRef`] which can be
   * obtained via [Compiler#compileInHost].
   *
   * You can optionally specify `imperativelyCreatedInjector`, which configure the [Injector]
   * that will be created for the Host View.
   *
   * Returns the [HostViewRef] of the Host View created for the newly instantiated Component.
   *
   * Use [AppViewManager#destroyViewInContainer] to destroy the created Host View.
   */
  HostViewRef createHostViewInContainer(
      ElementRef viewContainerLocation,
      num index,
      ProtoViewRef protoViewRef,
      List<ResolvedProvider> imperativelyCreatedInjector);
  /**
   * Destroys an Embedded or Host View attached to a View Container at the specified `index`.
   *
   * The View Container is located via `viewContainerLocation`.
   */
  destroyViewInContainer(ElementRef viewContainerLocation, num index);
  /**
   *
   * See [AppViewManager#detachViewInContainer].
   */

  // TODO(i): refactor detachViewInContainer+attachViewInContainer to moveViewInContainer
  ViewRef attachViewInContainer(
      ElementRef viewContainerLocation, num index, ViewRef viewRef);
  /**
   * See [AppViewManager#attachViewInContainer].
   */
  ViewRef detachViewInContainer(ElementRef viewContainerLocation, num index);
}

@Injectable()
class AppViewManager_ extends AppViewManager {
  AppViewPool _viewPool;
  AppViewListener _viewListener;
  AppViewManagerUtils _utils;
  Renderer _renderer;
  ProtoViewFactory _protoViewFactory;
  AppViewManager_(this._viewPool, this._viewListener, this._utils,
      this._renderer, @Inject(ProtoViewFactory) _protoViewFactory)
      : super() {
    /* super call moved to initializer */;
    this._protoViewFactory = _protoViewFactory;
  }
  ViewContainerRef getViewContainer(ElementRef location) {
    var hostView = internalView(((location as ElementRef_)).parentView);
    return hostView.elementInjectors[
        ((location as ElementRef_)).boundElementIndex].getViewContainerRef();
  }

  ElementRef getNamedElementInComponentView(
      ElementRef hostLocation, String variableName) {
    var hostView = internalView(((hostLocation as ElementRef_)).parentView);
    var boundElementIndex = ((hostLocation as ElementRef_)).boundElementIndex;
    var componentView = hostView.getNestedView(boundElementIndex);
    if (isBlank(componentView)) {
      throw new BaseException(
          '''There is no component directive at element ${ boundElementIndex}''');
    }
    var binderIdx = componentView.proto.variableLocations[variableName];
    if (isBlank(binderIdx)) {
      throw new BaseException('''Could not find variable ${ variableName}''');
    }
    return componentView.elementRefs[componentView.elementOffset + binderIdx];
  }

  dynamic getComponent(ElementRef hostLocation) {
    var hostView = internalView(((hostLocation as ElementRef_)).parentView);
    var boundElementIndex = ((hostLocation as ElementRef_)).boundElementIndex;
    return this._utils.getComponentInstance(hostView, boundElementIndex);
  }

  /** @internal */
  WtfScopeFn _createRootHostViewScope =
      wtfCreateScope("AppViewManager#createRootHostView()");
  HostViewRef createRootHostView(ProtoViewRef hostProtoViewRef,
      String overrideSelector, Injector injector) {
    var s = this._createRootHostViewScope();
    viewModule.AppProtoView hostProtoView = internalProtoView(hostProtoViewRef);
    this._protoViewFactory.initializeProtoViewIfNeeded(hostProtoView);
    var hostElementSelector = overrideSelector;
    if (isBlank(hostElementSelector)) {
      hostElementSelector =
          hostProtoView.elementBinders[0].componentDirective.metadata.selector;
    }
    var renderViewWithFragments = this._renderer.createRootHostView(
        hostProtoView.render,
        hostProtoView.mergeInfo.embeddedViewCount + 1,
        hostElementSelector);
    var hostView = this._createMainView(hostProtoView, renderViewWithFragments);
    this._renderer.hydrateView(hostView.render);
    this._utils.hydrateRootHostView(hostView, injector);
    return wtfLeave(s, hostView.ref);
  }

  /** @internal */
  WtfScopeFn _destroyRootHostViewScope =
      wtfCreateScope("AppViewManager#destroyRootHostView()");
  destroyRootHostView(HostViewRef hostViewRef) {
    // Note: Don't put the hostView into the view pool

    // as it is depending on the element for which it was created.
    var s = this._destroyRootHostViewScope();
    var hostView = internalView((hostViewRef as ViewRef));
    this._renderer.detachFragment(hostView.renderFragment);
    this._renderer.dehydrateView(hostView.render);
    this._viewDehydrateRecurse(hostView);
    this._viewListener.onViewDestroyed(hostView);
    this._renderer.destroyView(hostView.render);
    wtfLeave(s);
  }

  /** @internal */
  WtfScopeFn _createEmbeddedViewInContainerScope =
      wtfCreateScope("AppViewManager#createEmbeddedViewInContainer()");
  ViewRef createEmbeddedViewInContainer(
      ElementRef viewContainerLocation, num index, TemplateRef templateRef) {
    var s = this._createEmbeddedViewInContainerScope();
    var protoView =
        internalProtoView(((templateRef as TemplateRef_)).protoViewRef);
    if (!identical(protoView.type, viewModule.ViewType.EMBEDDED)) {
      throw new BaseException(
          "This method can only be called with embedded ProtoViews!");
    }
    this._protoViewFactory.initializeProtoViewIfNeeded(protoView);
    return wtfLeave(
        s,
        this._createViewInContainer(viewContainerLocation, index, protoView,
            templateRef.elementRef, null));
  }

  /** @internal */
  WtfScopeFn _createHostViewInContainerScope =
      wtfCreateScope("AppViewManager#createHostViewInContainer()");
  HostViewRef createHostViewInContainer(
      ElementRef viewContainerLocation,
      num index,
      ProtoViewRef protoViewRef,
      List<ResolvedProvider> imperativelyCreatedInjector) {
    var s = this._createHostViewInContainerScope();
    var protoView = internalProtoView(protoViewRef);
    if (!identical(protoView.type, viewModule.ViewType.HOST)) {
      throw new BaseException(
          "This method can only be called with host ProtoViews!");
    }
    this._protoViewFactory.initializeProtoViewIfNeeded(protoView);
    return wtfLeave(
        s,
        this._createViewInContainer(viewContainerLocation, index, protoView,
            viewContainerLocation, imperativelyCreatedInjector));
  }

  /**
   *
   * See [AppViewManager#destroyViewInContainer].
   * @internal
   */
  ViewRef _createViewInContainer(
      ElementRef viewContainerLocation,
      num index,
      viewModule.AppProtoView protoView,
      ElementRef context,
      List<ResolvedProvider> imperativelyCreatedInjector) {
    var parentView =
        internalView(((viewContainerLocation as ElementRef_)).parentView);
    var boundElementIndex =
        ((viewContainerLocation as ElementRef_)).boundElementIndex;
    var contextView = internalView(((context as ElementRef_)).parentView);
    var contextBoundElementIndex = ((context as ElementRef_)).boundElementIndex;
    var embeddedFragmentView =
        contextView.getNestedView(contextBoundElementIndex);
    var view;
    if (identical(protoView.type, viewModule.ViewType.EMBEDDED) &&
        isPresent(embeddedFragmentView) &&
        !embeddedFragmentView.hydrated()) {
      // Case 1: instantiate the first view of a template that has been merged into a parent
      view = embeddedFragmentView;
      this._attachRenderView(parentView, boundElementIndex, index, view);
    } else {
      // Case 2: instantiate another copy of the template or a host ProtoView.

      // This is a separate case

      // as we only inline one copy of the template into the parent view.
      view = this._createPooledView(protoView);
      this._attachRenderView(parentView, boundElementIndex, index, view);
      this._renderer.hydrateView(view.render);
    }
    this._utils.attachViewInContainer(parentView, boundElementIndex,
        contextView, contextBoundElementIndex, index, view);
    try {
      this._utils.hydrateViewInContainer(
          parentView,
          boundElementIndex,
          contextView,
          contextBoundElementIndex,
          index,
          imperativelyCreatedInjector);
    } catch (e, e_stack) {
      this._utils.detachViewInContainer(parentView, boundElementIndex, index);
      rethrow;
    }
    return view.ref;
  }

  /** @internal */
  _attachRenderView(viewModule.AppView parentView, num boundElementIndex,
      num index, viewModule.AppView view) {
    var elementRef = parentView.elementRefs[boundElementIndex];
    if (identical(index, 0)) {
      this
          ._renderer
          .attachFragmentAfterElement(elementRef, view.renderFragment);
    } else {
      var prevView =
          parentView.viewContainers[boundElementIndex].views[index - 1];
      this._renderer.attachFragmentAfterFragment(
          prevView.renderFragment, view.renderFragment);
    }
  }

  /** @internal */
  var _destroyViewInContainerScope =
      wtfCreateScope("AppViewMananger#destroyViewInContainer()");
  destroyViewInContainer(ElementRef viewContainerLocation, num index) {
    var s = this._destroyViewInContainerScope();
    var parentView =
        internalView(((viewContainerLocation as ElementRef_)).parentView);
    var boundElementIndex =
        ((viewContainerLocation as ElementRef_)).boundElementIndex;
    this._destroyViewInContainer(parentView, boundElementIndex, index);
    wtfLeave(s);
  }

  /** @internal */
  var _attachViewInContainerScope =
      wtfCreateScope("AppViewMananger#attachViewInContainer()");
  // TODO(i): refactor detachViewInContainer+attachViewInContainer to moveViewInContainer
  ViewRef attachViewInContainer(
      ElementRef viewContainerLocation, num index, ViewRef viewRef) {
    var s = this._attachViewInContainerScope();
    var view = internalView(viewRef);
    var parentView =
        internalView(((viewContainerLocation as ElementRef_)).parentView);
    var boundElementIndex =
        ((viewContainerLocation as ElementRef_)).boundElementIndex;
    // TODO(tbosch): the public methods attachViewInContainer/detachViewInContainer

    // are used for moving elements without the same container.

    // We will change this into an atomic `move` operation, which should preserve the

    // previous parent injector (see https://github.com/angular/angular/issues/1377).

    // Right now we are destroying any special

    // context view that might have been used.
    this._utils.attachViewInContainer(
        parentView, boundElementIndex, null, null, index, view);
    this._attachRenderView(parentView, boundElementIndex, index, view);
    return wtfLeave(s, viewRef);
  }

  /** @internal */
  var _detachViewInContainerScope =
      wtfCreateScope("AppViewMananger#detachViewInContainer()");
  // TODO(i): refactor detachViewInContainer+attachViewInContainer to moveViewInContainer
  ViewRef detachViewInContainer(ElementRef viewContainerLocation, num index) {
    var s = this._detachViewInContainerScope();
    var parentView =
        internalView(((viewContainerLocation as ElementRef_)).parentView);
    var boundElementIndex =
        ((viewContainerLocation as ElementRef_)).boundElementIndex;
    var viewContainer = parentView.viewContainers[boundElementIndex];
    var view = viewContainer.views[index];
    this._utils.detachViewInContainer(parentView, boundElementIndex, index);
    this._renderer.detachFragment(view.renderFragment);
    return wtfLeave(s, view.ref);
  }

  /** @internal */
  viewModule.AppView _createMainView(viewModule.AppProtoView protoView,
      RenderViewWithFragments renderViewWithFragments) {
    var mergedParentView = this
        ._utils
        .createView(protoView, renderViewWithFragments, this, this._renderer);
    this
        ._renderer
        .setEventDispatcher(mergedParentView.render, mergedParentView);
    this._viewListener.onViewCreated(mergedParentView);
    return mergedParentView;
  }

  /** @internal */
  viewModule.AppView _createPooledView(viewModule.AppProtoView protoView) {
    var view = this._viewPool.getView(protoView);
    if (isBlank(view)) {
      view = this._createMainView(
          protoView,
          this._renderer.createView(
              protoView.render, protoView.mergeInfo.embeddedViewCount + 1));
    }
    return view;
  }

  /** @internal */
  _destroyPooledView(viewModule.AppView view) {
    var wasReturned = this._viewPool.returnView(view);
    if (!wasReturned) {
      this._viewListener.onViewDestroyed(view);
      this._renderer.destroyView(view.render);
    }
  }

  /** @internal */
  _destroyViewInContainer(
      viewModule.AppView parentView, num boundElementIndex, num index) {
    var viewContainer = parentView.viewContainers[boundElementIndex];
    var view = viewContainer.views[index];
    this._viewDehydrateRecurse(view);
    this._utils.detachViewInContainer(parentView, boundElementIndex, index);
    if (view.viewOffset > 0) {
      // Case 1: a view that is part of another view.

      // Just detach the fragment
      this._renderer.detachFragment(view.renderFragment);
    } else {
      // Case 2: a view that is not part of another view.

      // dehydrate and destroy it.
      this._renderer.dehydrateView(view.render);
      this._renderer.detachFragment(view.renderFragment);
      this._destroyPooledView(view);
    }
  }

  /** @internal */
  _viewDehydrateRecurse(viewModule.AppView view) {
    if (view.hydrated()) {
      this._utils.dehydrateView(view);
    }
    var viewContainers = view.viewContainers;
    var startViewOffset = view.viewOffset;
    var endViewOffset = view.viewOffset + view.proto.mergeInfo.viewCount - 1;
    var elementOffset = view.elementOffset;
    for (var viewIdx = startViewOffset; viewIdx <= endViewOffset; viewIdx++) {
      var currView = view.views[viewIdx];
      for (var binderIdx = 0;
          binderIdx < currView.proto.elementBinders.length;
          binderIdx++, elementOffset++) {
        var vc = viewContainers[elementOffset];
        if (isPresent(vc)) {
          for (var j = vc.views.length - 1; j >= 0; j--) {
            this._destroyViewInContainer(currView, elementOffset, j);
          }
        }
      }
    }
  }
}
