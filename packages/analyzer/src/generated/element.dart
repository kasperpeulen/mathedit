// Copyright (c) 2014, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library engine.element;

import 'dart:collection';
import 'dart:math' show min;

import 'package:analyzer/src/generated/utilities_general.dart';
import 'package:analyzer/src/task/dart.dart';
import 'package:analyzer/task/model.dart' show AnalysisTarget;

import 'ast.dart';
import 'constant.dart' show DartObject, EvaluationResultImpl;
import 'engine.dart' show AnalysisContext, AnalysisEngine;
import 'html.dart' show XmlAttributeNode, XmlTagNode;
import 'java_core.dart';
import 'java_engine.dart';
import 'resolver.dart';
import 'scanner.dart' show Keyword;
import 'sdk.dart' show DartSdk;
import 'source.dart';
import 'utilities_collection.dart';
import 'utilities_dart.dart';

/**
 * For AST nodes that could be in both the getter and setter contexts
 * ([IndexExpression]s and [SimpleIdentifier]s), the additional resolved
 * elements are stored in the AST node, in an [AuxiliaryElements]. Because
 * resolved elements are either statically resolved or resolved using propagated
 * type information, this class is a wrapper for a pair of [ExecutableElement]s,
 * not just a single [ExecutableElement].
 */
class AuxiliaryElements {
  /**
   * The element based on propagated type information, or `null` if the AST
   * structure has not been resolved or if the node could not be resolved.
   */
  final ExecutableElement propagatedElement;

  /**
   * The element based on static type information, or `null` if the AST
   * structure has not been resolved or if the node could not be resolved.
   */
  final ExecutableElement staticElement;

  /**
   * Initialize a newly created pair to have both the [staticElement] and the
   * [propagatedElement].
   */
  AuxiliaryElements(this.staticElement, this.propagatedElement);
}

/**
 * A [Type] that represents the type 'bottom'.
 */
class BottomTypeImpl extends TypeImpl {
  /**
   * The unique instance of this class.
   */
  static BottomTypeImpl _INSTANCE = new BottomTypeImpl._();

  /**
   * Return the unique instance of this class.
   */
  static BottomTypeImpl get instance => _INSTANCE;

  /**
   * Prevent the creation of instances of this class.
   */
  BottomTypeImpl._() : super(null, "<bottom>");

  @override
  int get hashCode => 0;

  @override
  bool get isBottom => true;

  @override
  bool operator ==(Object object) => identical(object, this);

  @override
  bool isMoreSpecificThan(DartType type,
          [bool withDynamic = false, Set<Element> visitedElements]) =>
      true;

  @override
  bool isSubtypeOf(DartType type) => true;

  @override
  bool isSupertypeOf(DartType type) => false;

  @override
  TypeImpl pruned(List<FunctionTypeAliasElement> prune) => this;

  @override
  BottomTypeImpl substitute2(
          List<DartType> argumentTypes, List<DartType> parameterTypes,
          [List<FunctionTypeAliasElement> prune]) =>
      this;
}

/**
 * Type created internally if a circular reference is ever detected.  Behaves
 * like `dynamic`, except that when converted to a string it is displayed as
 * `...`.
 */
class CircularTypeImpl extends DynamicTypeImpl {
  CircularTypeImpl() : super._circular();

  @override
  int get hashCode => 1;

  @override
  bool operator ==(Object object) => object is CircularTypeImpl;

  @override
  void appendTo(StringBuffer buffer) {
    buffer.write('...');
  }

  @override
  TypeImpl pruned(List<FunctionTypeAliasElement> prune) => this;
}

/**
 * An element that represents a class.
 */
abstract class ClassElement
    implements TypeDefiningElement, TypeParameterizedElement {
  /**
   * An empty list of class elements.
   */
  static const List<ClassElement> EMPTY_LIST = const <ClassElement>[];

  /**
   * Return a list containing all of the accessors (getters and setters)
   * declared in this class.
   */
  List<PropertyAccessorElement> get accessors;

  /**
   * Return a list containing all the supertypes defined for this class and its
   * supertypes. This includes superclasses, mixins and interfaces.
   */
  List<InterfaceType> get allSupertypes;

  /**
   * Return a list containing all of the constructors declared in this class.
   */
  List<ConstructorElement> get constructors;

  /**
   * Return a list containing all of the fields declared in this class.
   */
  List<FieldElement> get fields;

  /**
   * Return `true` if this class or its superclass declares a non-final instance
   * field.
   */
  bool get hasNonFinalField;

  /**
   * Return `true` if this class has reference to super (so, for example, cannot
   * be used as a mixin).
   */
  bool get hasReferenceToSuper;

  /**
   * Return `true` if this class declares a static member.
   */
  bool get hasStaticMember;

  /**
   * Return a list containing all of the interfaces that are implemented by this
   * class.
   *
   * <b>Note:</b> Because the element model represents the state of the code, it
   * is possible for it to be semantically invalid. In particular, it is not
   * safe to assume that the inheritance structure of a class does not contain a
   * cycle. Clients that traverse the inheritance structure must explicitly
   * guard against infinite loops.
   */
  List<InterfaceType> get interfaces;

  /**
   * Return `true` if this class is abstract. A class is abstract if it has an
   * explicit `abstract` modifier. Note, that this definition of <i>abstract</i>
   * is different from <i>has unimplemented members</i>.
   */
  bool get isAbstract;

  /**
   * Return `true` if this class is defined by an enum declaration.
   */
  bool get isEnum;

  /**
   * Return `true` if this class is a mixin application.  A class is a mixin
   * application if it was declared using the syntax "class A = B with C;".
   */
  bool get isMixinApplication;

  /**
   * Return `true` if this class [isProxy], or if it inherits the proxy
   * annotation from a supertype.
   */
  bool get isOrInheritsProxy;

  /**
   * Return `true` if this element has an annotation of the form '@proxy'.
   */
  bool get isProxy;

  /**
   * Return `true` if this class is a mixin application.  Deprecated--please
   * use [isMixinApplication] instead.
   */
  @deprecated
  bool get isTypedef;

  /**
   * Return `true` if this class can validly be used as a mixin when defining
   * another class. The behavior of this method is defined by the Dart Language
   * Specification in section 9:
   * <blockquote>
   * It is a compile-time error if a declared or derived mixin refers to super.
   * It is a compile-time error if a declared or derived mixin explicitly
   * declares a constructor. It is a compile-time error if a mixin is derived
   * from a class whose superclass is not Object.
   * </blockquote>
   */
  bool get isValidMixin;

  /**
   * Return a list containing all of the methods declared in this class.
   */
  List<MethodElement> get methods;

  /**
   * Return a list containing all of the mixins that are applied to the class
   * being extended in order to derive the superclass of this class.
   *
   * <b>Note:</b> Because the element model represents the state of the code, it
   * is possible for it to be semantically invalid. In particular, it is not
   * safe to assume that the inheritance structure of a class does not contain a
   * cycle. Clients that traverse the inheritance structure must explicitly
   * guard against infinite loops.
   */
  List<InterfaceType> get mixins;

  /**
   * Return the superclass of this class, or `null` if the class represents the
   * class 'Object'. All other classes will have a non-`null` superclass. If the
   * superclass was not explicitly declared then the implicit superclass
   * 'Object' will be returned.
   *
   * <b>Note:</b> Because the element model represents the state of the code, it
   * is possible for it to be semantically invalid. In particular, it is not
   * safe to assume that the inheritance structure of a class does not contain a
   * cycle. Clients that traverse the inheritance structure must explicitly
   * guard against infinite loops.
   */
  InterfaceType get supertype;

  @override
  InterfaceType get type;

  /**
   * Return the unnamed constructor declared in this class, or `null` if this
   * class does not declare an unnamed constructor but does declare named
   * constructors. The returned constructor will be synthetic if this class does
   * not declare any constructors, in which case it will represent the default
   * constructor for the class.
   */
  ConstructorElement get unnamedConstructor;

  /**
   * Return the resolved [ClassDeclaration] or [EnumDeclaration] node that
   * declares this [ClassElement].
   *
   * This method is expensive, because resolved AST might be evicted from cache,
   * so parsing and resolving will be performed.
   */
  @override
  NamedCompilationUnitMember computeNode();

  /**
   * Return the field (synthetic or explicit) defined in this class that has the
   * given [name], or `null` if this class does not define a field with the
   * given name.
   */
  FieldElement getField(String name);

  /**
   * Return the element representing the getter with the given [name] that is
   * declared in this class, or `null` if this class does not declare a getter
   * with the given name.
   */
  PropertyAccessorElement getGetter(String name);

  /**
   * Return the element representing the method with the given [name] that is
   * declared in this class, or `null` if this class does not declare a method
   * with the given name.
   */
  MethodElement getMethod(String name);

  /**
   * Return the named constructor declared in this class with the given [name],
   * or `null` if this class does not declare a named constructor with the given
   * name.
   */
  ConstructorElement getNamedConstructor(String name);

  /**
   * Return the element representing the setter with the given [name] that is
   * declared in this class, or `null` if this class does not declare a setter
   * with the given name.
   */
  PropertyAccessorElement getSetter(String name);

  /**
   * Determine whether the given [constructor], which exists in the superclass
   * of this class, is accessible to constructors in this class.
   */
  bool isSuperConstructorAccessible(ConstructorElement constructor);

  /**
   * Return the element representing the method that results from looking up the
   * given [methodName] in this class with respect to the given [library],
   * ignoring abstract methods, or `null` if the look up fails. The behavior of
   * this method is defined by the Dart Language Specification in section
   * 16.15.1:
   * <blockquote>
   * The result of looking up method <i>m</i> in class <i>C</i> with respect to
   * library <i>L</i> is: If <i>C</i> declares an instance method named <i>m</i>
   * that is accessible to <i>L</i>, then that method is the result of the
   * lookup. Otherwise, if <i>C</i> has a superclass <i>S</i>, then the result
   * of the lookup is the result of looking up method <i>m</i> in <i>S</i> with
   * respect to <i>L</i>. Otherwise, we say that the lookup has failed.
   * </blockquote>
   */
  MethodElement lookUpConcreteMethod(String methodName, LibraryElement library);

  /**
   * Return the element representing the getter that results from looking up the
   * given [getterName] in this class with respect to the given [library], or
   * `null` if the look up fails. The behavior of this method is defined by the
   * Dart Language Specification in section 16.15.2:
   * <blockquote>
   * The result of looking up getter (respectively setter) <i>m</i> in class
   * <i>C</i> with respect to library <i>L</i> is: If <i>C</i> declares an
   * instance getter (respectively setter) named <i>m</i> that is accessible to
   * <i>L</i>, then that getter (respectively setter) is the result of the
   * lookup. Otherwise, if <i>C</i> has a superclass <i>S</i>, then the result
   * of the lookup is the result of looking up getter (respectively setter)
   * <i>m</i> in <i>S</i> with respect to <i>L</i>. Otherwise, we say that the
   * lookup has failed.
   * </blockquote>
   */
  PropertyAccessorElement lookUpGetter(
      String getterName, LibraryElement library);

  /**
   * Return the element representing the getter that results from looking up the
   * given [getterName] in the superclass of this class with respect to the
   * given [library], ignoring abstract getters, or `null` if the look up fails.
   * The behavior of this method is defined by the Dart Language Specification
   * in section 16.15.2:
   * <blockquote>
   * The result of looking up getter (respectively setter) <i>m</i> in class
   * <i>C</i> with respect to library <i>L</i> is: If <i>C</i> declares an
   * instance getter (respectively setter) named <i>m</i> that is accessible to
   * <i>L</i>, then that getter (respectively setter) is the result of the
   * lookup. Otherwise, if <i>C</i> has a superclass <i>S</i>, then the result
   * of the lookup is the result of looking up getter (respectively setter)
   * <i>m</i> in <i>S</i> with respect to <i>L</i>. Otherwise, we say that the
   * lookup has failed.
   * </blockquote>
   */
  PropertyAccessorElement lookUpInheritedConcreteGetter(
      String getterName, LibraryElement library);

  /**
   * Return the element representing the method that results from looking up the
   * given [methodName] in the superclass of this class with respect to the
   * given [library], ignoring abstract methods, or `null` if the look up fails.
   * The behavior of this method is defined by the Dart Language Specification
   * in section 16.15.1:
   * <blockquote>
   * The result of looking up method <i>m</i> in class <i>C</i> with respect to
   * library <i>L</i> is:  If <i>C</i> declares an instance method named
   * <i>m</i> that is accessible to <i>L</i>, then that method is the result of
   * the lookup. Otherwise, if <i>C</i> has a superclass <i>S</i>, then the
   * result of the lookup is the result of looking up method <i>m</i> in
   * <i>S</i> with respect to <i>L</i>. Otherwise, we say that the lookup has
   * failed.
   * </blockquote>
   */
  MethodElement lookUpInheritedConcreteMethod(
      String methodName, LibraryElement library);

  /**
   * Return the element representing the setter that results from looking up the
   * given [setterName] in the superclass of this class with respect to the
   * given [library], ignoring abstract setters, or `null` if the look up fails.
   * The behavior of this method is defined by the Dart Language Specification
   * in section 16.15.2:
   * <blockquote>
   * The result of looking up getter (respectively setter) <i>m</i> in class
   * <i>C</i> with respect to library <i>L</i> is:  If <i>C</i> declares an
   * instance getter (respectively setter) named <i>m</i> that is accessible to
   * <i>L</i>, then that getter (respectively setter) is the result of the
   * lookup. Otherwise, if <i>C</i> has a superclass <i>S</i>, then the result
   * of the lookup is the result of looking up getter (respectively setter)
   * <i>m</i> in <i>S</i> with respect to <i>L</i>. Otherwise, we say that the
   * lookup has failed.
   * </blockquote>
   */
  PropertyAccessorElement lookUpInheritedConcreteSetter(
      String setterName, LibraryElement library);

  /**
   * Return the element representing the method that results from looking up the
   * given [methodName] in the superclass of this class with respect to the
   * given [library], or `null` if the look up fails. The behavior of this
   * method is defined by the Dart Language Specification in section 16.15.1:
   * <blockquote>
   * The result of looking up method <i>m</i> in class <i>C</i> with respect to
   * library <i>L</i> is:  If <i>C</i> declares an instance method named
   * <i>m</i> that is accessible to <i>L</i>, then that method is the result of
   * the lookup. Otherwise, if <i>C</i> has a superclass <i>S</i>, then the
   * result of the lookup is the result of looking up method <i>m</i> in
   * <i>S</i> with respect to <i>L</i>. Otherwise, we say that the lookup has
   * failed.
   * </blockquote>
   */
  MethodElement lookUpInheritedMethod(
      String methodName, LibraryElement library);

  /**
   * Return the element representing the method that results from looking up the
   * given [methodName] in this class with respect to the given [library], or
   * `null` if the look up fails. The behavior of this method is defined by the
   * Dart Language Specification in section 16.15.1:
   * <blockquote>
   * The result of looking up method <i>m</i> in class <i>C</i> with respect to
   * library <i>L</i> is:  If <i>C</i> declares an instance method named
   * <i>m</i> that is accessible to <i>L</i>, then that method is the result of
   * the lookup. Otherwise, if <i>C</i> has a superclass <i>S</i>, then the
   * result of the lookup is the result of looking up method <i>m</i> in
   * <i>S</i> with respect to <i>L</i>. Otherwise, we say that the lookup has
   * failed.
   * </blockquote>
   */
  MethodElement lookUpMethod(String methodName, LibraryElement library);

  /**
   * Return the element representing the setter that results from looking up the
   * given [setterName] in this class with respect to the given [library], or
   * `null` if the look up fails. The behavior of this method is defined by the
   * Dart Language Specification in section 16.15.2:
   * <blockquote>
   * The result of looking up getter (respectively setter) <i>m</i> in class
   * <i>C</i> with respect to library <i>L</i> is: If <i>C</i> declares an
   * instance getter (respectively setter) named <i>m</i> that is accessible to
   * <i>L</i>, then that getter (respectively setter) is the result of the
   * lookup. Otherwise, if <i>C</i> has a superclass <i>S</i>, then the result
   * of the lookup is the result of looking up getter (respectively setter)
   * <i>m</i> in <i>S</i> with respect to <i>L</i>. Otherwise, we say that the
   * lookup has failed.
   * </blockquote>
   */
  PropertyAccessorElement lookUpSetter(
      String setterName, LibraryElement library);
}

/**
 * A concrete implementation of a [ClassElement].
 */
class ClassElementImpl extends ElementImpl implements ClassElement {
  /**
   * An empty list of class elements.
   */
  @deprecated // Use ClassElement.EMPTY_LIST
  static const List<ClassElement> EMPTY_ARRAY = const <ClassElement>[];

  /**
   * A list containing all of the accessors (getters and setters) contained in
   * this class.
   */
  List<PropertyAccessorElement> _accessors = PropertyAccessorElement.EMPTY_LIST;

  /**
   * For classes which are not mixin applications, a list containing all of the
   * constructors contained in this class, or `null` if the list of
   * constructors has not yet been built.
   *
   * For classes which are mixin applications, the list of constructors is
   * computed on the fly by the [constructors] getter, and this field is
   * `null`.
   */
  List<ConstructorElement> _constructors;

  /**
   * A list containing all of the fields contained in this class.
   */
  List<FieldElement> _fields = FieldElement.EMPTY_LIST;

  /**
   * A list containing all of the mixins that are applied to the class being
   * extended in order to derive the superclass of this class.
   */
  List<InterfaceType> mixins = InterfaceType.EMPTY_LIST;

  /**
   * A list containing all of the interfaces that are implemented by this class.
   */
  List<InterfaceType> interfaces = InterfaceType.EMPTY_LIST;

  /**
   * A list containing all of the methods contained in this class.
   */
  List<MethodElement> _methods = MethodElement.EMPTY_LIST;

  /**
   * The superclass of the class, or `null` if the class does not have an
   * explicit superclass.
   */
  InterfaceType supertype;

  /**
   * The type defined by the class.
   */
  InterfaceType type;

  /**
   * A list containing all of the type parameters defined for this class.
   */
  List<TypeParameterElement> _typeParameters = TypeParameterElement.EMPTY_LIST;

  /**
   * The [SourceRange] of the `with` clause, `null` if there is no one.
   */
  SourceRange withClauseRange;

  /**
   * A flag indicating whether the types associated with the instance members of
   * this class have been inferred.
   */
  bool hasBeenInferred = false;

  /**
   * Initialize a newly created class element to have the given [name] at the
   * given [offset] in the file that contains the declaration of this element.
   */
  ClassElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created class element to have the given [name].
   */
  ClassElementImpl.forNode(Identifier name) : super.forNode(name);

  /**
   * Set whether this class is abstract.
   */
  void set abstract(bool isAbstract) {
    setModifier(Modifier.ABSTRACT, isAbstract);
  }

  @override
  List<PropertyAccessorElement> get accessors => _accessors;

  /**
   * Set the accessors contained in this class to the given [accessors].
   */
  void set accessors(List<PropertyAccessorElement> accessors) {
    for (PropertyAccessorElement accessor in accessors) {
      (accessor as PropertyAccessorElementImpl).enclosingElement = this;
    }
    this._accessors = accessors;
  }

  @override
  List<InterfaceType> get allSupertypes {
    List<InterfaceType> list = new List<InterfaceType>();
    _collectAllSupertypes(list);
    return list;
  }

  @override
  List<ConstructorElement> get constructors {
    if (!isMixinApplication) {
      assert(_constructors != null);
      return _constructors == null
          ? ConstructorElement.EMPTY_LIST
          : _constructors;
    }

    return _computeMixinAppConstructors();
  }

  /**
   * Set the constructors contained in this class to the given [constructors].
   *
   * Should only be used for class elements that are not mixin applications.
   */
  void set constructors(List<ConstructorElement> constructors) {
    assert(!isMixinApplication);
    for (ConstructorElement constructor in constructors) {
      (constructor as ConstructorElementImpl).enclosingElement = this;
    }
    this._constructors = constructors;
  }

  /**
   * Return `true` if [CompileTimeErrorCode.MIXIN_HAS_NO_CONSTRUCTORS] should
   * be reported for this class.
   */
  bool get doesMixinLackConstructors {
    if (!isMixinApplication && mixins.isEmpty) {
      // This class is not a mixin application and it doesn't have a "with"
      // clause, so CompileTimeErrorCode.MIXIN_HAS_NO_CONSTRUCTORS is
      // inapplicable.
      return false;
    }
    if (supertype == null) {
      // Should never happen, since Object is the only class that has no
      // supertype, and it should have been caught by the test above.
      assert(false);
      return false;
    }
    // Find the nearest class in the supertype chain that is not a mixin
    // application.
    ClassElement nearestNonMixinClass = supertype.element;
    if (nearestNonMixinClass.isMixinApplication) {
      // Use a list to keep track of the classes we've seen, so that we won't
      // go into an infinite loop in the event of a non-trivial loop in the
      // class hierarchy.
      List<ClassElementImpl> classesSeen = <ClassElementImpl>[this];
      while (nearestNonMixinClass.isMixinApplication) {
        if (classesSeen.contains(nearestNonMixinClass)) {
          // Loop in the class hierarchy (which is reported elsewhere).  Don't
          // confuse the user with further errors.
          return false;
        }
        classesSeen.add(nearestNonMixinClass);
        if (nearestNonMixinClass.supertype == null) {
          // Should never happen, since Object is the only class that has no
          // supertype, and it is not a mixin application.
          assert(false);
          return false;
        }
        nearestNonMixinClass = nearestNonMixinClass.supertype.element;
      }
    }
    return !nearestNonMixinClass.constructors.any(isSuperConstructorAccessible);
  }

  /**
   * Set whether this class is defined by an enum declaration.
   */
  void set enum2(bool isEnum) {
    setModifier(Modifier.ENUM, isEnum);
  }

  @override
  List<FieldElement> get fields => _fields;

  /**
   * Set the fields contained in this class to the given [fields].
   */
  void set fields(List<FieldElement> fields) {
    for (FieldElement field in fields) {
      (field as FieldElementImpl).enclosingElement = this;
    }
    this._fields = fields;
  }

  @override
  bool get hasNonFinalField {
    List<ClassElement> classesToVisit = new List<ClassElement>();
    HashSet<ClassElement> visitedClasses = new HashSet<ClassElement>();
    classesToVisit.add(this);
    while (!classesToVisit.isEmpty) {
      ClassElement currentElement = classesToVisit.removeAt(0);
      if (visitedClasses.add(currentElement)) {
        // check fields
        for (FieldElement field in currentElement.fields) {
          if (!field.isFinal &&
              !field.isConst &&
              !field.isStatic &&
              !field.isSynthetic) {
            return true;
          }
        }
        // check mixins
        for (InterfaceType mixinType in currentElement.mixins) {
          ClassElement mixinElement = mixinType.element;
          classesToVisit.add(mixinElement);
        }
        // check super
        InterfaceType supertype = currentElement.supertype;
        if (supertype != null) {
          ClassElement superElement = supertype.element;
          if (superElement != null) {
            classesToVisit.add(superElement);
          }
        }
      }
    }
    // not found
    return false;
  }

  @override
  bool get hasReferenceToSuper => hasModifier(Modifier.REFERENCES_SUPER);

  /**
   * Set whether this class references 'super'.
   */
  void set hasReferenceToSuper(bool isReferencedSuper) {
    setModifier(Modifier.REFERENCES_SUPER, isReferencedSuper);
  }

  @override
  bool get hasStaticMember {
    for (MethodElement method in _methods) {
      if (method.isStatic) {
        return true;
      }
    }
    for (PropertyAccessorElement accessor in _accessors) {
      if (accessor.isStatic) {
        return true;
      }
    }
    return false;
  }

  @override
  bool get isAbstract => hasModifier(Modifier.ABSTRACT);

  @override
  bool get isEnum => hasModifier(Modifier.ENUM);

  @override
  bool get isMixinApplication => hasModifier(Modifier.MIXIN_APPLICATION);

  @override
  bool get isOrInheritsProxy =>
      _safeIsOrInheritsProxy(this, new HashSet<ClassElement>());

  @override
  bool get isProxy {
    for (ElementAnnotation annotation in metadata) {
      if (annotation.isProxy) {
        return true;
      }
    }
    return false;
  }

  @override
  @deprecated
  bool get isTypedef => isMixinApplication;

  @override
  bool get isValidMixin => hasModifier(Modifier.MIXIN);

  @override
  ElementKind get kind => ElementKind.CLASS;

  @override
  List<MethodElement> get methods => _methods;

  /**
   * Set the methods contained in this class to the given [methods].
   */
  void set methods(List<MethodElement> methods) {
    for (MethodElement method in methods) {
      (method as MethodElementImpl).enclosingElement = this;
    }
    this._methods = methods;
  }

  /**
   * Set whether this class is a mixin application.
   */
  void set mixinApplication(bool isMixinApplication) {
    setModifier(Modifier.MIXIN_APPLICATION, isMixinApplication);
  }

  @override
  List<TypeParameterElement> get typeParameters => _typeParameters;

  /**
   * Set the type parameters defined for this class to the given
   * [typeParameters].
   */
  void set typeParameters(List<TypeParameterElement> typeParameters) {
    for (TypeParameterElement typeParameter in typeParameters) {
      (typeParameter as TypeParameterElementImpl).enclosingElement = this;
    }
    this._typeParameters = typeParameters;
  }

  @override
  ConstructorElement get unnamedConstructor {
    for (ConstructorElement element in constructors) {
      String name = element.displayName;
      if (name == null || name.isEmpty) {
        return element;
      }
    }
    return null;
  }

  /**
   * Set whether this class is a valid mixin.
   */
  void set validMixin(bool isValidMixin) {
    setModifier(Modifier.MIXIN, isValidMixin);
  }

  @override
  accept(ElementVisitor visitor) => visitor.visitClassElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    String name = displayName;
    if (name == null) {
      buffer.write("{unnamed class}");
    } else {
      buffer.write(name);
    }
    int variableCount = _typeParameters.length;
    if (variableCount > 0) {
      buffer.write("<");
      for (int i = 0; i < variableCount; i++) {
        if (i > 0) {
          buffer.write(", ");
        }
        (_typeParameters[i] as TypeParameterElementImpl).appendTo(buffer);
      }
      buffer.write(">");
    }
  }

  @override
  NamedCompilationUnitMember computeNode() {
    if (isEnum) {
      return getNodeMatching((node) => node is EnumDeclaration);
    } else {
      return getNodeMatching(
          (node) => node is ClassDeclaration || node is ClassTypeAlias);
    }
  }

  @override
  ElementImpl getChild(String identifier) {
    //
    // The casts in this method are safe because the set methods would have
    // thrown a CCE if any of the elements in the arrays were not of the
    // expected types.
    //
    for (PropertyAccessorElement accessor in _accessors) {
      if ((accessor as PropertyAccessorElementImpl).identifier == identifier) {
        return accessor as PropertyAccessorElementImpl;
      }
    }
    for (ConstructorElement constructor in _constructors) {
      if ((constructor as ConstructorElementImpl).identifier == identifier) {
        return constructor as ConstructorElementImpl;
      }
    }
    for (FieldElement field in _fields) {
      if ((field as FieldElementImpl).identifier == identifier) {
        return field as FieldElementImpl;
      }
    }
    for (MethodElement method in _methods) {
      if ((method as MethodElementImpl).identifier == identifier) {
        return method as MethodElementImpl;
      }
    }
    for (TypeParameterElement typeParameter in _typeParameters) {
      if ((typeParameter as TypeParameterElementImpl).identifier ==
          identifier) {
        return typeParameter as TypeParameterElementImpl;
      }
    }
    return null;
  }

  @override
  FieldElement getField(String name) {
    for (FieldElement fieldElement in _fields) {
      if (name == fieldElement.name) {
        return fieldElement;
      }
    }
    return null;
  }

  @override
  PropertyAccessorElement getGetter(String getterName) {
    for (PropertyAccessorElement accessor in _accessors) {
      if (accessor.isGetter && accessor.name == getterName) {
        return accessor;
      }
    }
    return null;
  }

  @override
  MethodElement getMethod(String methodName) {
    for (MethodElement method in _methods) {
      if (method.name == methodName) {
        return method;
      }
    }
    return null;
  }

  @override
  ConstructorElement getNamedConstructor(String name) {
    for (ConstructorElement element in constructors) {
      String elementName = element.name;
      if (elementName != null && elementName == name) {
        return element;
      }
    }
    return null;
  }

  @override
  PropertyAccessorElement getSetter(String setterName) {
    // TODO (jwren) revisit- should we append '=' here or require clients to
    // include it?
    // Do we need the check for isSetter below?
    if (!StringUtilities.endsWithChar(setterName, 0x3D)) {
      setterName += '=';
    }
    for (PropertyAccessorElement accessor in _accessors) {
      if (accessor.isSetter && accessor.name == setterName) {
        return accessor;
      }
    }
    return null;
  }

  @override
  bool isSuperConstructorAccessible(ConstructorElement constructor) {
    // If this class has no mixins, then all superclass constructors are
    // accessible.
    if (mixins.isEmpty) {
      return true;
    }
    // Otherwise only constructors that lack optional parameters are
    // accessible (see dartbug.com/19576).
    for (ParameterElement parameter in constructor.parameters) {
      if (parameter.parameterKind != ParameterKind.REQUIRED) {
        return false;
      }
    }
    return true;
  }

  @override
  MethodElement lookUpConcreteMethod(
          String methodName, LibraryElement library) =>
      _internalLookUpConcreteMethod(methodName, library, true);

  @override
  PropertyAccessorElement lookUpGetter(
          String getterName, LibraryElement library) =>
      _internalLookUpGetter(getterName, library, true);

  @override
  PropertyAccessorElement lookUpInheritedConcreteGetter(
          String getterName, LibraryElement library) =>
      _internalLookUpConcreteGetter(getterName, library, false);

  @override
  MethodElement lookUpInheritedConcreteMethod(
          String methodName, LibraryElement library) =>
      _internalLookUpConcreteMethod(methodName, library, false);

  @override
  PropertyAccessorElement lookUpInheritedConcreteSetter(
          String setterName, LibraryElement library) =>
      _internalLookUpConcreteSetter(setterName, library, false);

  @override
  MethodElement lookUpInheritedMethod(
          String methodName, LibraryElement library) =>
      _internalLookUpMethod(methodName, library, false);

  @override
  MethodElement lookUpMethod(String methodName, LibraryElement library) =>
      _internalLookUpMethod(methodName, library, true);

  @override
  PropertyAccessorElement lookUpSetter(
          String setterName, LibraryElement library) =>
      _internalLookUpSetter(setterName, library, true);

  @override
  void visitChildren(ElementVisitor visitor) {
    super.visitChildren(visitor);
    safelyVisitChildren(_accessors, visitor);
    safelyVisitChildren(_constructors, visitor);
    safelyVisitChildren(_fields, visitor);
    safelyVisitChildren(_methods, visitor);
    safelyVisitChildren(_typeParameters, visitor);
  }

  void _collectAllSupertypes(List<InterfaceType> supertypes) {
    List<InterfaceType> typesToVisit = new List<InterfaceType>();
    List<ClassElement> visitedClasses = new List<ClassElement>();
    typesToVisit.add(this.type);
    while (!typesToVisit.isEmpty) {
      InterfaceType currentType = typesToVisit.removeAt(0);
      ClassElement currentElement = currentType.element;
      if (!visitedClasses.contains(currentElement)) {
        visitedClasses.add(currentElement);
        if (!identical(currentType, this.type)) {
          supertypes.add(currentType);
        }
        InterfaceType supertype = currentType.superclass;
        if (supertype != null) {
          typesToVisit.add(supertype);
        }
        for (InterfaceType type in currentElement.interfaces) {
          typesToVisit.add(type);
        }
        for (InterfaceType type in currentElement.mixins) {
          ClassElement element = type.element;
          if (!visitedClasses.contains(element)) {
            supertypes.add(type);
          }
        }
      }
    }
  }

  /**
   * Compute a list of constructors for this class, which is a mixin
   * application.  If specified, [visitedClasses] is a list of the other mixin
   * application classes which have been visited on the way to reaching this
   * one (this is used to detect circularities).
   */
  List<ConstructorElement> _computeMixinAppConstructors(
      [List<ClassElementImpl> visitedClasses = null]) {
    // First get the list of constructors of the superclass which need to be
    // forwarded to this class.
    Iterable<ConstructorElement> constructorsToForward;
    if (supertype == null) {
      // Shouldn't ever happen, since the only class with no supertype is
      // Object, and it isn't a mixin application.  But for safety's sake just
      // assume an empty list.
      assert(false);
      constructorsToForward = <ConstructorElement>[];
    } else if (!supertype.element.isMixinApplication) {
      List<ConstructorElement> superclassConstructors =
          supertype.element.constructors;
      // Filter out any constructors with optional parameters (see
      // dartbug.com/15101).
      constructorsToForward =
          superclassConstructors.where(isSuperConstructorAccessible);
    } else {
      if (visitedClasses == null) {
        visitedClasses = <ClassElementImpl>[this];
      } else {
        if (visitedClasses.contains(this)) {
          // Loop in the class hierarchy.  Don't try to forward any
          // constructors.
          return <ConstructorElement>[];
        }
        visitedClasses.add(this);
      }
      try {
        ClassElementImpl superclass = supertype.element;
        constructorsToForward =
            superclass._computeMixinAppConstructors(visitedClasses);
      } finally {
        visitedClasses.removeLast();
      }
    }

    // Figure out the type parameter substitution we need to perform in order
    // to produce constructors for this class.  We want to be robust in the
    // face of errors, so drop any extra type arguments and fill in any missing
    // ones with `dynamic`.
    List<DartType> parameterTypes =
        TypeParameterTypeImpl.getTypes(supertype.typeParameters);
    List<DartType> argumentTypes = new List<DartType>.filled(
        parameterTypes.length, DynamicTypeImpl.instance);
    for (int i = 0; i < supertype.typeArguments.length; i++) {
      if (i >= argumentTypes.length) {
        break;
      }
      argumentTypes[i] = supertype.typeArguments[i];
    }

    // Now create an implicit constructor for every constructor found above,
    // substituting type parameters as appropriate.
    return constructorsToForward
        .map((ConstructorElement superclassConstructor) {
      ConstructorElementImpl implicitConstructor =
          new ConstructorElementImpl(superclassConstructor.name, -1);
      implicitConstructor.synthetic = true;
      implicitConstructor.redirectedConstructor = superclassConstructor;
      implicitConstructor.const2 = superclassConstructor.isConst;
      implicitConstructor.returnType = type;
      List<ParameterElement> superParameters = superclassConstructor.parameters;
      int count = superParameters.length;
      if (count > 0) {
        List<ParameterElement> implicitParameters =
            new List<ParameterElement>(count);
        for (int i = 0; i < count; i++) {
          ParameterElement superParameter = superParameters[i];
          ParameterElementImpl implicitParameter =
              new ParameterElementImpl(superParameter.name, -1);
          implicitParameter.const3 = superParameter.isConst;
          implicitParameter.final2 = superParameter.isFinal;
          implicitParameter.parameterKind = superParameter.parameterKind;
          implicitParameter.synthetic = true;
          implicitParameter.type =
              superParameter.type.substitute2(argumentTypes, parameterTypes);
          implicitParameters[i] = implicitParameter;
        }
        implicitConstructor.parameters = implicitParameters;
      }
      implicitConstructor.enclosingElement = this;
      implicitConstructor.type = new FunctionTypeImpl(implicitConstructor);
      return implicitConstructor;
    }).toList();
  }

  PropertyAccessorElement _internalLookUpConcreteGetter(
      String getterName, LibraryElement library, bool includeThisClass) {
    PropertyAccessorElement getter =
        _internalLookUpGetter(getterName, library, includeThisClass);
    while (getter != null && getter.isAbstract) {
      Element definingClass = getter.enclosingElement;
      if (definingClass is! ClassElementImpl) {
        return null;
      }
      getter = (definingClass as ClassElementImpl)
          ._internalLookUpGetter(getterName, library, false);
    }
    return getter;
  }

  MethodElement _internalLookUpConcreteMethod(
      String methodName, LibraryElement library, bool includeThisClass) {
    MethodElement method =
        _internalLookUpMethod(methodName, library, includeThisClass);
    while (method != null && method.isAbstract) {
      ClassElement definingClass = method.enclosingElement;
      if (definingClass == null) {
        return null;
      }
      method = definingClass.lookUpInheritedMethod(methodName, library);
    }
    return method;
  }

  PropertyAccessorElement _internalLookUpConcreteSetter(
      String setterName, LibraryElement library, bool includeThisClass) {
    PropertyAccessorElement setter =
        _internalLookUpSetter(setterName, library, includeThisClass);
    while (setter != null && setter.isAbstract) {
      Element definingClass = setter.enclosingElement;
      if (definingClass is! ClassElementImpl) {
        return null;
      }
      setter = (definingClass as ClassElementImpl)
          ._internalLookUpSetter(setterName, library, false);
    }
    return setter;
  }

  PropertyAccessorElement _internalLookUpGetter(
      String getterName, LibraryElement library, bool includeThisClass) {
    HashSet<ClassElement> visitedClasses = new HashSet<ClassElement>();
    ClassElement currentElement = this;
    if (includeThisClass) {
      PropertyAccessorElement element = currentElement.getGetter(getterName);
      if (element != null && element.isAccessibleIn(library)) {
        return element;
      }
    }
    while (currentElement != null && visitedClasses.add(currentElement)) {
      for (InterfaceType mixin in currentElement.mixins.reversed) {
        ClassElement mixinElement = mixin.element;
        if (mixinElement != null) {
          PropertyAccessorElement element = mixinElement.getGetter(getterName);
          if (element != null && element.isAccessibleIn(library)) {
            return element;
          }
        }
      }
      InterfaceType supertype = currentElement.supertype;
      if (supertype == null) {
        return null;
      }
      currentElement = supertype.element;
      PropertyAccessorElement element = currentElement.getGetter(getterName);
      if (element != null && element.isAccessibleIn(library)) {
        return element;
      }
    }
    return null;
  }

  MethodElement _internalLookUpMethod(
      String methodName, LibraryElement library, bool includeThisClass) {
    HashSet<ClassElement> visitedClasses = new HashSet<ClassElement>();
    ClassElement currentElement = this;
    if (includeThisClass) {
      MethodElement element = currentElement.getMethod(methodName);
      if (element != null && element.isAccessibleIn(library)) {
        return element;
      }
    }
    while (currentElement != null && visitedClasses.add(currentElement)) {
      for (InterfaceType mixin in currentElement.mixins.reversed) {
        ClassElement mixinElement = mixin.element;
        if (mixinElement != null) {
          MethodElement element = mixinElement.getMethod(methodName);
          if (element != null && element.isAccessibleIn(library)) {
            return element;
          }
        }
      }
      InterfaceType supertype = currentElement.supertype;
      if (supertype == null) {
        return null;
      }
      currentElement = supertype.element;
      MethodElement element = currentElement.getMethod(methodName);
      if (element != null && element.isAccessibleIn(library)) {
        return element;
      }
    }
    return null;
  }

  PropertyAccessorElement _internalLookUpSetter(
      String setterName, LibraryElement library, bool includeThisClass) {
    HashSet<ClassElement> visitedClasses = new HashSet<ClassElement>();
    ClassElement currentElement = this;
    if (includeThisClass) {
      PropertyAccessorElement element = currentElement.getSetter(setterName);
      if (element != null && element.isAccessibleIn(library)) {
        return element;
      }
    }
    while (currentElement != null && visitedClasses.add(currentElement)) {
      for (InterfaceType mixin in currentElement.mixins.reversed) {
        ClassElement mixinElement = mixin.element;
        if (mixinElement != null) {
          PropertyAccessorElement element = mixinElement.getSetter(setterName);
          if (element != null && element.isAccessibleIn(library)) {
            return element;
          }
        }
      }
      InterfaceType supertype = currentElement.supertype;
      if (supertype == null) {
        return null;
      }
      currentElement = supertype.element;
      PropertyAccessorElement element = currentElement.getSetter(setterName);
      if (element != null && element.isAccessibleIn(library)) {
        return element;
      }
    }
    return null;
  }

  bool _safeIsOrInheritsProxy(
      ClassElement classElt, HashSet<ClassElement> visitedClassElts) {
    if (visitedClassElts.contains(classElt)) {
      return false;
    }
    visitedClassElts.add(classElt);
    if (classElt.isProxy) {
      return true;
    } else if (classElt.supertype != null &&
        _safeIsOrInheritsProxy(classElt.supertype.element, visitedClassElts)) {
      return true;
    }
    List<InterfaceType> supertypes = classElt.interfaces;
    for (int i = 0; i < supertypes.length; i++) {
      if (_safeIsOrInheritsProxy(supertypes[i].element, visitedClassElts)) {
        return true;
      }
    }
    supertypes = classElt.mixins;
    for (int i = 0; i < supertypes.length; i++) {
      if (_safeIsOrInheritsProxy(supertypes[i].element, visitedClassElts)) {
        return true;
      }
    }
    return false;
  }
}

/**
 * An element that is contained within a [ClassElement].
 */
abstract class ClassMemberElement implements Element {
  /**
   * Return the type in which this member is defined.
   */
  @override
  ClassElement get enclosingElement;

  /**
   * Return `true` if this element is a static element. A static element is an
   * element that is not associated with a particular instance, but rather with
   * an entire library or class.
   */
  bool get isStatic;
}

/**
 * An element representing a compilation unit.
 */
abstract class CompilationUnitElement implements Element, UriReferencedElement {
  /**
   * An empty list of compilation unit elements.
   */
  static const List<CompilationUnitElement> EMPTY_LIST =
      const <CompilationUnitElement>[];

  /**
   * Return a list containing all of the top-level accessors (getters and
   * setters) contained in this compilation unit.
   */
  List<PropertyAccessorElement> get accessors;

  /**
   * Return the library in which this compilation unit is defined.
   */
  @override
  LibraryElement get enclosingElement;

  /**
   * Return a list containing all of the enums contained in this compilation
   * unit.
   */
  List<ClassElement> get enums;

  /**
   * Return a list containing all of the top-level functions contained in this
   * compilation unit.
   */
  List<FunctionElement> get functions;

  /**
   * Return a list containing all of the function type aliases contained in this
   * compilation unit.
   */
  List<FunctionTypeAliasElement> get functionTypeAliases;

  /**
   * Return `true` if this compilation unit defines a top-level function named
   * `loadLibrary`.
   */
  bool get hasLoadLibraryFunction;

  /**
   * Return a list containing all of the top-level variables contained in this
   * compilation unit.
   */
  List<TopLevelVariableElement> get topLevelVariables;

  /**
   * Return a list containing all of the classes contained in this compilation
   * unit.
   */
  List<ClassElement> get types;

  /**
   * Return the resolved [CompilationUnit] node that declares this element.
   *
   * This method is expensive, because resolved AST might be evicted from cache,
   * so parsing and resolving will be performed.
   */
  @override
  CompilationUnit computeNode();

  /**
   * Return the element at the given [offset], maybe `null` if no such element.
   */
  Element getElementAt(int offset);

  /**
   * Return the enum defined in this compilation unit that has the given [name],
   * or `null` if this compilation unit does not define an enum with the given
   * name.
   */
  ClassElement getEnum(String name);

  /**
   * Return the class defined in this compilation unit that has the given
   * [name], or `null` if this compilation unit does not define a class with the
   * given name.
   */
  ClassElement getType(String name);
}

/**
 * A concrete implementation of a [CompilationUnitElement].
 */
class CompilationUnitElementImpl extends UriReferencedElementImpl
    implements CompilationUnitElement {
  /**
   * An empty list of compilation unit elements.
   */
  @deprecated // Use CompilationUnitElement.EMPTY_LIST
  static const List<CompilationUnitElement> EMPTY_ARRAY =
      const <CompilationUnitElement>[];

  /**
   * The source that corresponds to this compilation unit.
   */
  Source source;

  /**
   * The source of the library containing this compilation unit.
   *
   * This is the same as the source of the containing [LibraryElement],
   * except that it does not require the containing [LibraryElement] to be
   * computed.
   */
  Source librarySource;

  /**
   * A list containing all of the top-level accessors (getters and setters)
   * contained in this compilation unit.
   */
  List<PropertyAccessorElement> _accessors = PropertyAccessorElement.EMPTY_LIST;

  /**
   * A list containing all of the enums contained in this compilation unit.
   */
  List<ClassElement> _enums = ClassElement.EMPTY_LIST;

  /**
   * A list containing all of the top-level functions contained in this
   * compilation unit.
   */
  List<FunctionElement> _functions = FunctionElement.EMPTY_LIST;

  /**
   * A list containing all of the function type aliases contained in this
   * compilation unit.
   */
  List<FunctionTypeAliasElement> _typeAliases =
      FunctionTypeAliasElement.EMPTY_LIST;

  /**
   * A list containing all of the types contained in this compilation unit.
   */
  List<ClassElement> _types = ClassElement.EMPTY_LIST;

  /**
   * A list containing all of the variables contained in this compilation unit.
   */
  List<TopLevelVariableElement> _variables = TopLevelVariableElement.EMPTY_LIST;

  /**
   * A map from offsets to elements of this unit at these offsets.
   */
  final Map<int, Element> _offsetToElementMap = new HashMap<int, Element>();

  /**
   * Initialize a newly created compilation unit element to have the given
   * [name].
   */
  CompilationUnitElementImpl(String name) : super(name, -1);

  @override
  List<PropertyAccessorElement> get accessors => _accessors;

  /**
   * Set the top-level accessors (getters and setters) contained in this
   * compilation unit to the given [accessors].
   */
  void set accessors(List<PropertyAccessorElement> accessors) {
    for (PropertyAccessorElement accessor in accessors) {
      (accessor as PropertyAccessorElementImpl).enclosingElement = this;
    }
    this._accessors = accessors;
  }

  @override
  LibraryElement get enclosingElement =>
      super.enclosingElement as LibraryElement;

  @override
  List<ClassElement> get enums => _enums;

  /**
   * Set the enums contained in this compilation unit to the given [enums].
   */
  void set enums(List<ClassElement> enums) {
    for (ClassElement enumDeclaration in enums) {
      (enumDeclaration as ClassElementImpl).enclosingElement = this;
    }
    this._enums = enums;
  }

  @override
  List<FunctionElement> get functions => _functions;

  /**
   * Set the top-level functions contained in this compilation unit to the given
   * [functions].
   */
  void set functions(List<FunctionElement> functions) {
    for (FunctionElement function in functions) {
      (function as FunctionElementImpl).enclosingElement = this;
    }
    this._functions = functions;
  }

  @override
  List<FunctionTypeAliasElement> get functionTypeAliases => _typeAliases;

  @override
  int get hashCode => source.hashCode;

  @override
  bool get hasLoadLibraryFunction {
    for (int i = 0; i < _functions.length; i++) {
      if (_functions[i].name == FunctionElement.LOAD_LIBRARY_NAME) {
        return true;
      }
    }
    return false;
  }

  @override
  String get identifier => source.encoding;

  @override
  ElementKind get kind => ElementKind.COMPILATION_UNIT;

  @override
  List<TopLevelVariableElement> get topLevelVariables => _variables;

  /**
   * Set the top-level variables contained in this compilation unit to the given
   * [variables].
   */
  void set topLevelVariables(List<TopLevelVariableElement> variables) {
    for (TopLevelVariableElement field in variables) {
      (field as TopLevelVariableElementImpl).enclosingElement = this;
    }
    this._variables = variables;
  }

  /**
   * Set the function type aliases contained in this compilation unit to the
   * given [typeAliases].
   */
  void set typeAliases(List<FunctionTypeAliasElement> typeAliases) {
    for (FunctionTypeAliasElement typeAlias in typeAliases) {
      (typeAlias as FunctionTypeAliasElementImpl).enclosingElement = this;
    }
    this._typeAliases = typeAliases;
  }

  @override
  List<ClassElement> get types => _types;

  /**
   * Set the types contained in this compilation unit to the given [types].
   */
  void set types(List<ClassElement> types) {
    for (ClassElement type in types) {
      (type as ClassElementImpl).enclosingElement = this;
    }
    this._types = types;
  }

  @override
  bool operator ==(Object object) =>
      object is CompilationUnitElementImpl && source == object.source;

  @override
  accept(ElementVisitor visitor) => visitor.visitCompilationUnitElement(this);

  /**
   * This method is invoked after this unit was incrementally resolved.
   */
  void afterIncrementalResolution() {
    _offsetToElementMap.clear();
  }

  @override
  void appendTo(StringBuffer buffer) {
    if (source == null) {
      buffer.write("{compilation unit}");
    } else {
      buffer.write(source.fullName);
    }
  }

  @override
  CompilationUnit computeNode() => unit;

  @override
  ElementImpl getChild(String identifier) {
    //
    // The casts in this method are safe because the set methods would have
    // thrown a CCE if any of the elements in the arrays were not of the
    // expected types.
    //
    for (PropertyAccessorElement accessor in _accessors) {
      if ((accessor as PropertyAccessorElementImpl).identifier == identifier) {
        return accessor as PropertyAccessorElementImpl;
      }
    }
    for (VariableElement variable in _variables) {
      if ((variable as VariableElementImpl).identifier == identifier) {
        return variable as VariableElementImpl;
      }
    }
    for (ExecutableElement function in _functions) {
      if ((function as ExecutableElementImpl).identifier == identifier) {
        return function as ExecutableElementImpl;
      }
    }
    for (FunctionTypeAliasElement typeAlias in _typeAliases) {
      if ((typeAlias as FunctionTypeAliasElementImpl).identifier ==
          identifier) {
        return typeAlias as FunctionTypeAliasElementImpl;
      }
    }
    for (ClassElement type in _types) {
      if ((type as ClassElementImpl).identifier == identifier) {
        return type as ClassElementImpl;
      }
    }
    for (ClassElement type in _enums) {
      if ((type as ClassElementImpl).identifier == identifier) {
        return type as ClassElementImpl;
      }
    }
    return null;
  }

  @override
  Element getElementAt(int offset) {
    if (_offsetToElementMap.isEmpty) {
      accept(new _BuildOffsetToElementMap(_offsetToElementMap));
    }
    return _offsetToElementMap[offset];
  }

  @override
  ClassElement getEnum(String enumName) {
    for (ClassElement enumDeclaration in _enums) {
      if (enumDeclaration.name == enumName) {
        return enumDeclaration;
      }
    }
    return null;
  }

  @override
  ClassElement getType(String className) {
    for (ClassElement type in _types) {
      if (type.name == className) {
        return type;
      }
    }
    return null;
  }

  /**
   * Replace the given [from] top-level variable with [to] in this compilation unit.
   */
  void replaceTopLevelVariable(
      TopLevelVariableElement from, TopLevelVariableElement to) {
    int index = _variables.indexOf(from);
    _variables[index] = to;
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    super.visitChildren(visitor);
    safelyVisitChildren(_accessors, visitor);
    safelyVisitChildren(_enums, visitor);
    safelyVisitChildren(_functions, visitor);
    safelyVisitChildren(_typeAliases, visitor);
    safelyVisitChildren(_types, visitor);
    safelyVisitChildren(_variables, visitor);
  }
}

/**
 * A [FieldElement] for a 'const' or 'final' field that has an initializer.
 *
 * TODO(paulberry): we should rename this class to reflect the fact that it's
 * used for both const and final fields.  However, we shouldn't do so until
 * we've created an API for reading the values of constants; until that API is
 * available, clients are likely to read constant values by casting to
 * ConstFieldElementImpl, so it would be a breaking change to rename this
 * class.
 */
class ConstFieldElementImpl extends FieldElementImpl with ConstVariableElement {
  /**
   * The result of evaluating this variable's initializer.
   */
  EvaluationResultImpl _result;

  /**
   * Initialize a newly created synthetic field element to have the given
   * [name] and [offset].
   */
  ConstFieldElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created field element to have the given [name].
   */
  @deprecated // Use new ConstFieldElementImpl.forNode(name)
  ConstFieldElementImpl.con1(Identifier name) : super.forNode(name);

  /**
   * Initialize a newly created synthetic field element to have the given
   * [name] and [offset].
   */
  @deprecated // Use new ConstFieldElementImpl(name, offset)
  ConstFieldElementImpl.con2(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created field element to have the given [name].
   */
  ConstFieldElementImpl.forNode(Identifier name) : super.forNode(name);

  @override
  DartObject get constantValue => _result.value;

  @override
  EvaluationResultImpl get evaluationResult => _result;

  @override
  void set evaluationResult(EvaluationResultImpl result) {
    this._result = result;
  }
}

/**
 * A [LocalVariableElement] for a local 'const' variable that has an
 * initializer.
 */
class ConstLocalVariableElementImpl extends LocalVariableElementImpl
    with ConstVariableElement {
  /**
   * The result of evaluating this variable's initializer.
   */
  EvaluationResultImpl _result;

  /**
   * Initialize a newly created local variable element to have the given [name]
   * and [offset].
   */
  ConstLocalVariableElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created local variable element to have the given [name].
   */
  ConstLocalVariableElementImpl.forNode(Identifier name) : super.forNode(name);

  @override
  DartObject get constantValue => _result.value;

  @override
  EvaluationResultImpl get evaluationResult => _result;

  @override
  void set evaluationResult(EvaluationResultImpl result) {
    this._result = result;
  }
}

/**
 * An element representing a constructor or a factory method defined within a
 * class.
 */
abstract class ConstructorElement
    implements ClassMemberElement, ExecutableElement, ConstantEvaluationTarget {
  /**
   * An empty list of constructor elements.
   */
  static const List<ConstructorElement> EMPTY_LIST =
      const <ConstructorElement>[];

  /**
   * Return `true` if this constructor is a const constructor.
   */
  bool get isConst;

  /**
   * Return `true` if this constructor can be used as a default constructor -
   * unnamed and has no required parameters.
   */
  bool get isDefaultConstructor;

  /**
   * Return `true` if this constructor represents a factory constructor.
   */
  bool get isFactory;

  /**
   * Return the offset of the character immediately following the last character
   * of this constructor's name, or `null` if not named.
   */
  int get nameEnd;

  /**
   * Return the offset of the `.` before this constructor name, or `null` if
   * not named.
   */
  int get periodOffset;

  /**
   * Return the constructor to which this constructor is redirecting, or `null`
   * if this constructor does not redirect to another constructor or if the
   * library containing this constructor has not yet been resolved.
   */
  ConstructorElement get redirectedConstructor;

  /**
   * Return the resolved [ConstructorDeclaration] node that declares this
   * [ConstructorElement] .
   *
   * This method is expensive, because resolved AST might be evicted from cache,
   * so parsing and resolving will be performed.
   */
  @override
  ConstructorDeclaration computeNode();
}

/**
 * A concrete implementation of a [ConstructorElement].
 */
class ConstructorElementImpl extends ExecutableElementImpl
    implements ConstructorElement {
  /**
   * An empty list of constructor elements.
   */
  @deprecated // Use ConstructorElement.EMPTY_LIST
  static const List<ConstructorElement> EMPTY_ARRAY =
      const <ConstructorElement>[];

  /**
   * The constructor to which this constructor is redirecting.
   */
  ConstructorElement redirectedConstructor;

  /**
   * The initializers for this constructor (used for evaluating constant
   * instance creation expressions).
   */
  List<ConstructorInitializer> constantInitializers;

  /**
   * The offset of the `.` before this constructor name or `null` if not named.
   */
  int periodOffset;

  /**
   * Return the offset of the character immediately following the last character
   * of this constructor's name, or `null` if not named.
   */
  int nameEnd;

  /**
   * True if this constructor has been found by constant evaluation to be free
   * of redirect cycles, and is thus safe to evaluate.
   */
  bool isCycleFree = false;

  /**
   * Initialize a newly created constructor element to have the given [name] and
   * [offset].
   */
  ConstructorElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created constructor element to have the given [name].
   */
  ConstructorElementImpl.forNode(Identifier name) : super.forNode(name);

  /**
   * Set whether this constructor represents a 'const' constructor.
   */
  void set const2(bool isConst) {
    setModifier(Modifier.CONST, isConst);
  }

  @override
  ClassElement get enclosingElement => super.enclosingElement as ClassElement;

  /**
   * Set whether this constructor represents a factory method.
   */
  void set factory(bool isFactory) {
    setModifier(Modifier.FACTORY, isFactory);
  }

  @override
  bool get isConst => hasModifier(Modifier.CONST);

  @override
  bool get isDefaultConstructor {
    // unnamed
    String name = this.name;
    if (name != null && name.length != 0) {
      return false;
    }
    // no required parameters
    for (ParameterElement parameter in parameters) {
      if (parameter.parameterKind == ParameterKind.REQUIRED) {
        return false;
      }
    }
    // OK, can be used as default constructor
    return true;
  }

  @override
  bool get isFactory => hasModifier(Modifier.FACTORY);

  @override
  bool get isStatic => false;

  @override
  ElementKind get kind => ElementKind.CONSTRUCTOR;

  @override
  accept(ElementVisitor visitor) => visitor.visitConstructorElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    if (enclosingElement == null) {
      String message;
      String name = displayName;
      if (name != null && !name.isEmpty) {
        message =
            'Found constructor element named $name with no enclosing element';
      } else {
        message = 'Found unnamed constructor element with no enclosing element';
      }
      AnalysisEngine.instance.logger.logError(message);
      buffer.write('<unknown class>');
    } else {
      buffer.write(enclosingElement.displayName);
    }
    String name = displayName;
    if (name != null && !name.isEmpty) {
      buffer.write(".");
      buffer.write(name);
    }
    super.appendTo(buffer);
  }

  @override
  ConstructorDeclaration computeNode() =>
      getNodeMatching((node) => node is ConstructorDeclaration);
}

/**
 * A constructor element defined in a parameterized type where the values of the
 * type parameters are known.
 */
class ConstructorMember extends ExecutableMember implements ConstructorElement {
  /**
   * Initialize a newly created element to represent a constructor, based on the
   * [baseElement], defined by the [definingType]. If [type] is passed, it
   * represents the full type of the member, and will take precedence over
   * the [definingType].
   */
  ConstructorMember(ConstructorElement baseElement, InterfaceType definingType,
      [FunctionType type])
      : super(baseElement, definingType, type);

  @override
  ConstructorElement get baseElement => super.baseElement as ConstructorElement;

  @override
  InterfaceType get definingType => super.definingType as InterfaceType;

  @override
  ClassElement get enclosingElement => baseElement.enclosingElement;

  @override
  bool get isConst => baseElement.isConst;

  @override
  bool get isDefaultConstructor => baseElement.isDefaultConstructor;

  @override
  bool get isFactory => baseElement.isFactory;

  @override
  int get nameEnd => baseElement.nameEnd;

  @override
  int get periodOffset => baseElement.periodOffset;

  @override
  ConstructorElement get redirectedConstructor =>
      from(baseElement.redirectedConstructor, definingType);

  @override
  accept(ElementVisitor visitor) => visitor.visitConstructorElement(this);

  @override
  ConstructorDeclaration computeNode() => baseElement.computeNode();

  @override
  String toString() {
    ConstructorElement baseElement = this.baseElement;
    List<ParameterElement> parameters = this.parameters;
    FunctionType type = this.type;
    StringBuffer buffer = new StringBuffer();
    buffer.write(baseElement.enclosingElement.displayName);
    String name = displayName;
    if (name != null && !name.isEmpty) {
      buffer.write(".");
      buffer.write(name);
    }
    buffer.write("(");
    int parameterCount = parameters.length;
    for (int i = 0; i < parameterCount; i++) {
      if (i > 0) {
        buffer.write(", ");
      }
      buffer.write(parameters[i]);
    }
    buffer.write(")");
    if (type != null) {
      buffer.write(Element.RIGHT_ARROW);
      buffer.write(type.returnType);
    }
    return buffer.toString();
  }

  /**
   * If the given [constructor]'s type is different when any type parameters
   * from the defining type's declaration are replaced with the actual type
   * arguments from the [definingType], create a constructor member representing
   * the given constructor. Return the member that was created, or the original
   * constructor if no member was created.
   */
  static ConstructorElement from(
      ConstructorElement constructor, InterfaceType definingType) {
    if (constructor == null || definingType.typeArguments.length == 0) {
      return constructor;
    }
    FunctionType baseType = constructor.type;
    if (baseType == null) {
      // TODO(brianwilkerson) We need to understand when this can happen.
      return constructor;
    }
    List<DartType> argumentTypes = definingType.typeArguments;
    List<DartType> parameterTypes = definingType.element.type.typeArguments;
    FunctionType substitutedType =
        baseType.substitute2(argumentTypes, parameterTypes);
    if (baseType == substitutedType) {
      return constructor;
    }
    return new ConstructorMember(constructor, definingType, substitutedType);
  }
}

/**
 * A [TopLevelVariableElement] for a top-level 'const' variable that has an
 * initializer.
 */
class ConstTopLevelVariableElementImpl extends TopLevelVariableElementImpl
    with ConstVariableElement {
  /**
   * The result of evaluating this variable's initializer.
   */
  EvaluationResultImpl _result;

  /**
   * Initialize a newly created top-level variable element to have the given
   * [name].
   */
  ConstTopLevelVariableElementImpl(Identifier name) : super.forNode(name);

  @override
  DartObject get constantValue => _result.value;

  @override
  EvaluationResultImpl get evaluationResult => _result;

  @override
  void set evaluationResult(EvaluationResultImpl result) {
    this._result = result;
  }
}

/**
 * Mixin used by elements that represent constant variables and have
 * initializers.
 *
 * Note that in correct Dart code, all constant variables must have
 * initializers.  However, analyzer also needs to handle incorrect Dart code,
 * in which case there might be some constant variables that lack initializers.
 * This interface is only used for constant variables that have initializers.
 *
 * This class is not intended to be part of the public API for analyzer.
 */
abstract class ConstVariableElement {
  /**
   * If this element represents a constant variable, and it has an initializer,
   * a copy of the initializer for the constant.  Otherwise `null`.
   *
   * Note that in correct Dart code, all constant variables must have
   * initializers.  However, analyzer also needs to handle incorrect Dart code,
   * in which case there might be some constant variables that lack
   * initializers.
   */
  Expression constantInitializer;
}

/**
 * The type associated with elements in the element model.
 */
abstract class DartType {
  /**
   * An empty list of types.
   */
  static const List<DartType> EMPTY_LIST = const <DartType>[];

  /**
   * Return the name of this type as it should appear when presented to users in
   * contexts such as error messages.
   */
  String get displayName;

  /**
   * Return the element representing the declaration of this type, or `null` if
   * the type has not, or cannot, be associated with an element. The former case
   * will occur if the element model is not yet complete; the latter case will
   * occur if this object represents an undefined type.
   */
  Element get element;

  /**
   * Return `true` if this type represents the bottom type.
   */
  bool get isBottom;

  /**
   * Return `true` if this type represents the type 'Function' defined in the
   * dart:core library.
   */
  bool get isDartCoreFunction;

  /**
   * Return `true` if this type represents the type 'dynamic'.
   */
  bool get isDynamic;

  /**
   * Return `true` if this type represents the type 'Object'.
   */
  bool get isObject;

  /**
   * Return `true` if this type represents a typename that couldn't be resolved.
   */
  bool get isUndefined;

  /**
   * Return `true` if this type represents the type 'void'.
   */
  bool get isVoid;

  /**
   * Return the name of this type, or `null` if the type does not have a name,
   * such as when the type represents the type of an unnamed function.
   */
  String get name;

  /**
   * Return the least upper bound of this type and the given [type], or `null`
   * if there is no least upper bound.
   *
   * Deprecated, since it is impossible to implement the correct algorithm
   * without access to a [TypeProvider].  Please use
   * [TypeSystem.getLeastUpperBound] instead.
   */
  @deprecated
  DartType getLeastUpperBound(DartType type);

  /**
   * Return `true` if this type is assignable to the given [type]. A type
   * <i>T</i> may be assigned to a type <i>S</i>, written <i>T</i> &hArr;
   * <i>S</i>, iff either <i>T</i> <: <i>S</i> or <i>S</i> <: <i>T</i>.
   */
  bool isAssignableTo(DartType type);

  /**
   * Return `true` if this type is more specific than the given [type].
   */
  bool isMoreSpecificThan(DartType type);

  /**
   * Return `true` if this type is a subtype of the given [type].
   */
  bool isSubtypeOf(DartType type);

  /**
   * Return `true` if this type is a supertype of the given [type]. A type
   * <i>S</i> is a supertype of <i>T</i>, written <i>S</i> :> <i>T</i>, iff
   * <i>T</i> is a subtype of <i>S</i>.
   */
  bool isSupertypeOf(DartType type);

  /**
   * Return the type resulting from substituting the given [argumentTypes] for
   * the given [parameterTypes] in this type. The specification defines this
   * operation in section 2:
   * <blockquote>
   * The notation <i>[x<sub>1</sub>, ..., x<sub>n</sub>/y<sub>1</sub>, ...,
   * y<sub>n</sub>]E</i> denotes a copy of <i>E</i> in which all occurrences of
   * <i>y<sub>i</sub>, 1 <= i <= n</i> have been replaced with
   * <i>x<sub>i</sub></i>.
   * </blockquote>
   * Note that, contrary to the specification, this method will not create a
   * copy of this type if no substitutions were required, but will return this
   * type directly.
   *
   * Note too that the current implementation of this method is only guaranteed
   * to work when the parameter types are type variables.
   */
  DartType substitute2(
      List<DartType> argumentTypes, List<DartType> parameterTypes);
}

/**
 * A [FieldFormalParameterElementImpl] for parameters that have an initializer.
 */
class DefaultFieldFormalParameterElementImpl
    extends FieldFormalParameterElementImpl with ConstVariableElement {
  /**
   * The result of evaluating this variable's initializer.
   */
  EvaluationResultImpl _result;

  /**
   * Initialize a newly created parameter element to have the given [name].
   */
  DefaultFieldFormalParameterElementImpl(Identifier name) : super(name);

  @override
  DartObject get constantValue => _result.value;

  @override
  EvaluationResultImpl get evaluationResult => _result;

  @override
  void set evaluationResult(EvaluationResultImpl result) {
    this._result = result;
  }
}

/**
 * A [ParameterElement] for parameters that have an initializer.
 */
class DefaultParameterElementImpl extends ParameterElementImpl
    with ConstVariableElement {
  /**
   * The result of evaluating this variable's initializer.
   */
  EvaluationResultImpl _result;

  /**
   * Initialize a newly created parameter element to have the given [name].
   */
  DefaultParameterElementImpl(Identifier name) : super.forNode(name);

  @override
  DartObject get constantValue => _result.value;

  @override
  EvaluationResultImpl get evaluationResult => _result;

  @override
  void set evaluationResult(EvaluationResultImpl result) {
    this._result = result;
  }

  @override
  DefaultFormalParameter computeNode() =>
      getNodeMatching((node) => node is DefaultFormalParameter);
}

/**
 * The synthetic element representing the declaration of the type `dynamic`.
 */
class DynamicElementImpl extends ElementImpl implements TypeDefiningElement {
  /**
   * Return the unique instance of this class.
   */
  static DynamicElementImpl get instance =>
      DynamicTypeImpl.instance.element as DynamicElementImpl;

  @override
  DynamicTypeImpl type;

  /**
   * Initialize a newly created instance of this class. Instances of this class
   * should <b>not</b> be created except as part of creating the type associated
   * with this element. The single instance of this class should be accessed
   * through the method [getInstance].
   */
  DynamicElementImpl() : super(Keyword.DYNAMIC.syntax, -1) {
    setModifier(Modifier.SYNTHETIC, true);
  }

  @override
  ElementKind get kind => ElementKind.DYNAMIC;

  @override
  accept(ElementVisitor visitor) => null;
}

/**
 * The [Type] representing the type `dynamic`.
 */
class DynamicTypeImpl extends TypeImpl {
  /**
   * The unique instance of this class.
   */
  static DynamicTypeImpl _INSTANCE = new DynamicTypeImpl._();

  /**
   * Return the unique instance of this class.
   */
  static DynamicTypeImpl get instance => _INSTANCE;

  /**
   * Prevent the creation of instances of this class.
   */
  DynamicTypeImpl._()
      : super(new DynamicElementImpl(), Keyword.DYNAMIC.syntax) {
    (element as DynamicElementImpl).type = this;
  }

  /**
   * Constructor used by [CircularTypeImpl].
   */
  DynamicTypeImpl._circular()
      : super(_INSTANCE.element, Keyword.DYNAMIC.syntax);

  @override
  int get hashCode => 1;

  @override
  bool get isDynamic => true;

  @override
  bool operator ==(Object object) => identical(object, this);

  @override
  bool isMoreSpecificThan(DartType type,
      [bool withDynamic = false, Set<Element> visitedElements]) {
    // T is S
    if (identical(this, type)) {
      return true;
    }
    // else
    return withDynamic;
  }

  @override
  bool isSubtypeOf(DartType type) => true;

  @override
  bool isSupertypeOf(DartType type) => true;

  @override
  TypeImpl pruned(List<FunctionTypeAliasElement> prune) => this;

  @override
  DartType substitute2(
      List<DartType> argumentTypes, List<DartType> parameterTypes,
      [List<FunctionTypeAliasElement> prune]) {
    int length = parameterTypes.length;
    for (int i = 0; i < length; i++) {
      if (parameterTypes[i] == this) {
        return argumentTypes[i];
      }
    }
    return this;
  }
}

/**
 * The base class for all of the elements in the element model. Generally
 * speaking, the element model is a semantic model of the program that
 * represents things that are declared with a name and hence can be referenced
 * elsewhere in the code.
 *
 * There are two exceptions to the general case. First, there are elements in
 * the element model that are created for the convenience of various kinds of
 * analysis but that do not have any corresponding declaration within the source
 * code. Such elements are marked as being <i>synthetic</i>. Examples of
 * synthetic elements include
 * * default constructors in classes that do not define any explicit
 *   constructors,
 * * getters and setters that are induced by explicit field declarations,
 * * fields that are induced by explicit declarations of getters and setters,
 *   and
 * * functions representing the initialization expression for a variable.
 *
 * Second, there are elements in the element model that do not have a name.
 * These correspond to unnamed functions and exist in order to more accurately
 * represent the semantic structure of the program.
 */
abstract class Element implements AnalysisTarget {
  /**
   * An Unicode right arrow.
   */
  static final String RIGHT_ARROW = " \u2192 ";

  /**
   * A comparator that can be used to sort elements by their name offset.
   * Elements with a smaller offset will be sorted to be before elements with a
   * larger name offset.
   */
  static final Comparator<Element> SORT_BY_OFFSET = (Element firstElement,
          Element secondElement) =>
      firstElement.nameOffset - secondElement.nameOffset;

  /**
   * Return the analysis context in which this element is defined.
   */
  AnalysisContext get context;

  /**
   * Return the display name of this element, or `null` if this element does not
   * have a name.
   *
   * In most cases the name and the display name are the same. Differences
   * though are cases such as setters where the name of some setter `set f(x)`
   * is `f=`, instead of `f`.
   */
  String get displayName;

  /**
   * Return the source range of the documentation comment for this element,
   * or `null` if this element does not or cannot have a documentation.
   */
  SourceRange get docRange;

  /**
   * Return the element that either physically or logically encloses this
   * element. This will be `null` if this element is a library because libraries
   * are the top-level elements in the model.
   */
  Element get enclosingElement;

  /**
   * The unique integer identifier of this element.
   */
  int get id;

  /**
   * Return `true` if this element has an annotation of the form '@deprecated'
   * or '@Deprecated('..')'.
   */
  bool get isDeprecated;

  /**
   * Return `true` if this element has an annotation of the form '@override'.
   */
  bool get isOverride;

  /**
   * Return `true` if this element is private. Private elements are visible only
   * within the library in which they are declared.
   */
  bool get isPrivate;

  /**
   * Return `true` if this element is public. Public elements are visible within
   * any library that imports the library in which they are declared.
   */
  bool get isPublic;

  /**
   * Return `true` if this element is synthetic. A synthetic element is an
   * element that is not represented in the source code explicitly, but is
   * implied by the source code, such as the default constructor for a class
   * that does not explicitly define any constructors.
   */
  bool get isSynthetic;

  /**
   * Return the kind of element that this is.
   */
  ElementKind get kind;

  /**
   * Return the library that contains this element. This will be the element
   * itself if it is a library element. This will be `null` if this element is
   * an HTML file because HTML files are not contained in libraries.
   */
  LibraryElement get library;

  /**
   * Return an object representing the location of this element in the element
   * model. The object can be used to locate this element at a later time.
   */
  ElementLocation get location;

  /**
   * Return a list containing all of the metadata associated with this element.
   * The array will be empty if the element does not have any metadata or if the
   * library containing this element has not yet been resolved.
   */
  List<ElementAnnotation> get metadata;

  /**
   * Return the name of this element, or `null` if this element does not have a
   * name.
   */
  String get name;

  /**
   * Return the length of the name of this element in the file that contains the
   * declaration of this element, or `0` if this element does not have a name.
   */
  int get nameLength;

  /**
   * Return the offset of the name of this element in the file that contains the
   * declaration of this element, or `-1` if this element is synthetic, does not
   * have a name, or otherwise does not have an offset.
   */
  int get nameOffset;

  /**
   * **DEPRECATED** Use `computeNode()` instead.
   *
   * Return the resolved [AstNode] node that declares this element, or `null` if
   * this element is synthetic or isn't contained in a compilation unit, such as
   * a [LibraryElement].
   *
   * This method is expensive, because resolved AST might be evicted from cache,
   * so parsing and resolving will be performed.
   *
   * <b>Note:</b> This method cannot be used in an async environment.
   */
  @deprecated
  AstNode get node;

  /**
   * Return the source that contains this element, or `null` if this element is
   * not contained in a source.
   */
  Source get source;

  /**
   * Return the resolved [CompilationUnit] that declares this element, or `null`
   * if this element is synthetic.
   *
   * This method is expensive, because resolved AST might have been already
   * evicted from cache, so parsing and resolving will be performed.
   */
  CompilationUnit get unit;

  /**
   * Use the given [visitor] to visit this element. Return the value returned by
   * the visitor as a result of visiting this element.
   */
  accept(ElementVisitor visitor);

  /**
   * Return the documentation comment for this element as it appears in the
   * original source (complete with the beginning and ending delimiters), or
   * `null` if this element does not have a documentation comment associated
   * with it. This can be a long-running operation if the information needed to
   * access the comment is not cached.
   *
   * Throws [AnalysisException] if the documentation comment could not be
   * determined because the analysis could not be performed
   */
  String computeDocumentationComment();

  /**
   * Return the resolved [AstNode] node that declares this element, or `null` if
   * this element is synthetic or isn't contained in a compilation unit, such as
   * a [LibraryElement].
   *
   * This method is expensive, because resolved AST might be evicted from cache,
   * so parsing and resolving will be performed.
   *
   * <b>Note:</b> This method cannot be used in an async environment.
   */
  AstNode computeNode();

  /**
   * Return the most immediate ancestor of this element for which the
   * [predicate] returns `true`, or `null` if there is no such ancestor. Note
   * that this element will never be returned.
   */
  Element getAncestor(Predicate<Element> predicate);

  /**
   * Return a display name for the given element that includes the path to the
   * compilation unit in which the type is defined. If [shortName] is `null`
   * then [getDisplayName] will be used as the name of this element. Otherwise
   * the provided name will be used.
   */
  // TODO(brianwilkerson) Make the parameter optional.
  String getExtendedDisplayName(String shortName);

  /**
   * Return `true` if this element, assuming that it is within scope, is
   * accessible to code in the given [library]. This is defined by the Dart
   * Language Specification in section 3.2:
   * <blockquote>
   * A declaration <i>m</i> is accessible to library <i>L</i> if <i>m</i> is
   * declared in <i>L</i> or if <i>m</i> is public.
   * </blockquote>
   */
  bool isAccessibleIn(LibraryElement library);

  /**
   * Use the given [visitor] to visit all of the children of this element. There
   * is no guarantee of the order in which the children will be visited.
   */
  void visitChildren(ElementVisitor visitor);
}

/**
 * A single annotation associated with an element.
 */
abstract class ElementAnnotation {
  /**
   * An empty list of annotations.
   */
  static const List<ElementAnnotation> EMPTY_LIST = const <ElementAnnotation>[];

  /**
   * Return a representation of the value of this annotation.
   *
   * Return `null` if the value of this annotation could not be computed because
   * of errors.
   */
  DartObject get constantValue;

  /**
   * Return the element representing the field, variable, or const constructor
   * being used as an annotation.
   */
  Element get element;

  /**
   * Return `true` if this annotation marks the associated element as being
   * deprecated.
   */
  bool get isDeprecated;

  /**
   * Return `true` if this annotation marks the associated method as being
   * expected to override an inherited method.
   */
  bool get isOverride;

  /**
   * Return `true` if this annotation marks the associated class as implementing
   * a proxy object.
   */
  bool get isProxy;
}

/**
 * A concrete implementation of an [ElementAnnotation].
 */
class ElementAnnotationImpl implements ElementAnnotation {
  /**
   * An empty list of annotations.
   */
  @deprecated // Use ElementAnnotation.EMPTY_LIST
  static const List<ElementAnnotationImpl> EMPTY_ARRAY =
      const <ElementAnnotationImpl>[];

  /**
   * The name of the class used to mark an element as being deprecated.
   */
  static String _DEPRECATED_CLASS_NAME = "Deprecated";

  /**
   * The name of the top-level variable used to mark an element as being
   * deprecated.
   */
  static String _DEPRECATED_VARIABLE_NAME = "deprecated";

  /**
   * The name of the top-level variable used to mark a method as being expected
   * to override an inherited method.
   */
  static String _OVERRIDE_VARIABLE_NAME = "override";

  /**
   * The name of the top-level variable used to mark a class as implementing a
   * proxy object.
   */
  static String PROXY_VARIABLE_NAME = "proxy";

  /**
   * The element representing the field, variable, or constructor being used as
   * an annotation.
   */
  final Element element;

  /**
   * The result of evaluating this annotation as a compile-time constant
   * expression, or `null` if the compilation unit containing the variable has
   * not been resolved.
   */
  EvaluationResultImpl evaluationResult;

  /**
   * Initialize a newly created annotation. The given [element] is the element
   * representing the field, variable, or constructor being used as an
   * annotation.
   */
  ElementAnnotationImpl(this.element);

  @override
  DartObject get constantValue => evaluationResult.value;

  @override
  bool get isDeprecated {
    if (element != null) {
      LibraryElement library = element.library;
      if (library != null && library.isDartCore) {
        if (element is ConstructorElement) {
          ConstructorElement constructorElement = element as ConstructorElement;
          if (constructorElement.enclosingElement.name ==
              _DEPRECATED_CLASS_NAME) {
            return true;
          }
        } else if (element is PropertyAccessorElement &&
            element.name == _DEPRECATED_VARIABLE_NAME) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  bool get isOverride {
    if (element != null) {
      LibraryElement library = element.library;
      if (library != null && library.isDartCore) {
        if (element is PropertyAccessorElement &&
            element.name == _OVERRIDE_VARIABLE_NAME) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  bool get isProxy {
    if (element != null) {
      LibraryElement library = element.library;
      if (library != null && library.isDartCore) {
        if (element is PropertyAccessorElement &&
            element.name == PROXY_VARIABLE_NAME) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  String toString() => '@$element';
}

/**
 * A base class for concrete implementations of an [Element].
 */
abstract class ElementImpl implements Element {
  static int _NEXT_ID = 0;

  final int id = _NEXT_ID++;

  /**
   * The enclosing element of this element, or `null` if this element is at the
   * root of the element structure.
   */
  ElementImpl _enclosingElement;

  /**
   * The name of this element.
   */
  String _name;

  /**
   * The offset of the name of this element in the file that contains the
   * declaration of this element.
   */
  int _nameOffset = 0;

  /**
   * A bit-encoded form of the modifiers associated with this element.
   */
  int _modifiers = 0;

  /**
   * A list containing all of the metadata associated with this element.
   */
  List<ElementAnnotation> metadata = ElementAnnotation.EMPTY_LIST;

  /**
   * A cached copy of the calculated hashCode for this element.
   */
  int _cachedHashCode;

  /**
   * A cached copy of the calculated location for this element.
   */
  ElementLocation _cachedLocation;

  /**
   * The offset to the beginning of the documentation comment,
   * or `null` if this element does not have a documentation comment.
   */
  int _docRangeOffset;

  /**
   * The length of the documentation comment range for this element.
   */
  int _docRangeLength;

  /**
   * Initialize a newly created element to have the given [name] at the given
   * [_nameOffset].
   */
  ElementImpl(String name, this._nameOffset) {
    this._name = StringUtilities.intern(name);
  }

  /**
   * Initialize a newly created element to have the given [name].
   */
  ElementImpl.forNode(Identifier name)
      : this(name == null ? "" : name.name, name == null ? -1 : name.offset);

  @override
  AnalysisContext get context {
    if (_enclosingElement == null) {
      return null;
    }
    return _enclosingElement.context;
  }

  @override
  String get displayName => _name;

  @override
  SourceRange get docRange {
    if (_docRangeOffset != null && _docRangeLength != null) {
      return new SourceRange(_docRangeOffset, _docRangeLength);
    }
    return null;
  }

  @override
  Element get enclosingElement => _enclosingElement;

  /**
   * Set the enclosing element of this element to the given [element].
   */
  void set enclosingElement(Element element) {
    _enclosingElement = element as ElementImpl;
    _cachedLocation = null;
    _cachedHashCode = null;
  }

  @override
  int get hashCode {
    // TODO: We might want to re-visit this optimization in the future.
    // We cache the hash code value as this is a very frequently called method.
    if (_cachedHashCode == null) {
      int hashIdentifier = identifier.hashCode;
      Element enclosing = enclosingElement;
      if (enclosing != null) {
        _cachedHashCode = hashIdentifier + enclosing.hashCode;
      } else {
        _cachedHashCode = hashIdentifier;
      }
    }
    return _cachedHashCode;
  }

  /**
   * Return an identifier that uniquely identifies this element among the
   * children of this element's parent.
   */
  String get identifier => name;

  @override
  bool get isDeprecated {
    for (ElementAnnotation annotation in metadata) {
      if (annotation.isDeprecated) {
        return true;
      }
    }
    return false;
  }

  @override
  bool get isOverride {
    for (ElementAnnotation annotation in metadata) {
      if (annotation.isOverride) {
        return true;
      }
    }
    return false;
  }

  @override
  bool get isPrivate {
    String name = displayName;
    if (name == null) {
      return true;
    }
    return Identifier.isPrivateName(name);
  }

  @override
  bool get isPublic => !isPrivate;

  @override
  bool get isSynthetic => hasModifier(Modifier.SYNTHETIC);

  @override
  LibraryElement get library =>
      getAncestor((element) => element is LibraryElement);

  @override
  ElementLocation get location {
    if (_cachedLocation == null) {
      _cachedLocation = new ElementLocationImpl.con1(this);
    }
    return _cachedLocation;
  }

  @override
  String get name => _name;

  void set name(String name) {
    this._name = name;
    _cachedLocation = null;
    _cachedHashCode = null;
  }

  @override
  int get nameLength => displayName != null ? displayName.length : 0;

  @override
  int get nameOffset => _nameOffset;

  /**
   * Sets the offset of the name of this element in the file that contains the
   * declaration of this element.
   */
  void set nameOffset(int offset) {
    _nameOffset = offset;
    _cachedHashCode = null;
    _cachedLocation = null;
  }

  @deprecated
  @override
  AstNode get node => computeNode();

  @override
  Source get source {
    if (_enclosingElement == null) {
      return null;
    }
    return _enclosingElement.source;
  }

  /**
   * Set whether this element is synthetic.
   */
  void set synthetic(bool isSynthetic) {
    setModifier(Modifier.SYNTHETIC, isSynthetic);
  }

  @override
  CompilationUnit get unit => context.resolveCompilationUnit(source, library);

  @override
  bool operator ==(Object object) {
    if (identical(this, object)) {
      return true;
    }
    if (object == null || hashCode != object.hashCode) {
      return false;
    }
    return object.runtimeType == runtimeType &&
        (object as Element).location == location;
  }

  /**
   * Append a textual representation of this element to the given [buffer].
   */
  void appendTo(StringBuffer buffer) {
    if (_name == null) {
      buffer.write("<unnamed ");
      buffer.write(runtimeType.toString());
      buffer.write(">");
    } else {
      buffer.write(_name);
    }
  }

  @override
  String computeDocumentationComment() {
    AnalysisContext context = this.context;
    if (context == null) {
      return null;
    }
    return context.computeDocumentationComment(this);
  }

  @override
  AstNode computeNode() => getNodeMatching((node) => node is AstNode);

  /**
   * Set this element as the enclosing element for given [element].
   */
  void encloseElement(ElementImpl element) {
    element.enclosingElement = this;
  }

  @override
  Element getAncestor(Predicate<Element> predicate) {
    Element ancestor = _enclosingElement;
    while (ancestor != null && !predicate(ancestor)) {
      ancestor = ancestor.enclosingElement;
    }
    return ancestor;
  }

  /**
   * Return the child of this element that is uniquely identified by the given
   * [identifier], or `null` if there is no such child.
   */
  ElementImpl getChild(String identifier) => null;

  @override
  String getExtendedDisplayName(String shortName) {
    if (shortName == null) {
      shortName = displayName;
    }
    Source source = this.source;
    if (source != null) {
      return "$shortName (${source.fullName})";
    }
    return shortName;
  }

  /**
   * Return the resolved [AstNode] of the given type enclosing [getNameOffset].
   */
  AstNode getNodeMatching(Predicate<AstNode> predicate) {
    CompilationUnit unit = this.unit;
    if (unit == null) {
      return null;
    }
    int offset = nameOffset;
    AstNode node = new NodeLocator(offset).searchWithin(unit);
    if (node == null) {
      return null;
    }
    return node.getAncestor(predicate);
  }

  /**
   * Return `true` if this element has the given [modifier] associated with it.
   */
  bool hasModifier(Modifier modifier) =>
      BooleanArray.getEnum(_modifiers, modifier);

  @override
  bool isAccessibleIn(LibraryElement library) {
    if (Identifier.isPrivateName(_name)) {
      return library == this.library;
    }
    return true;
  }

  /**
   * If the given [child] is not `null`, use the given [visitor] to visit it.
   */
  void safelyVisitChild(Element child, ElementVisitor visitor) {
    if (child != null) {
      child.accept(visitor);
    }
  }

  /**
   * Use the given [visitor] to visit all of the [children] in the given array.
   */
  void safelyVisitChildren(List<Element> children, ElementVisitor visitor) {
    if (children != null) {
      for (Element child in children) {
        child.accept(visitor);
      }
    }
  }

  /**
   * Set the documentation comment source range for this element.
   */
  void setDocRange(int offset, int length) {
    _docRangeOffset = offset;
    _docRangeLength = length;
  }

  /**
   * Set whether the given [modifier] is associated with this element to
   * correspond to the given [value].
   */
  void setModifier(Modifier modifier, bool value) {
    _modifiers = BooleanArray.setEnum(_modifiers, modifier, value);
  }

  @override
  String toString() {
    StringBuffer buffer = new StringBuffer();
    appendTo(buffer);
    return buffer.toString();
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    // There are no children to visit
  }
}

/**
 * The enumeration `ElementKind` defines the various kinds of elements in the
 * element model.
 */
class ElementKind extends Enum<ElementKind> {
  static const ElementKind CLASS = const ElementKind('CLASS', 0, "class");

  static const ElementKind COMPILATION_UNIT =
      const ElementKind('COMPILATION_UNIT', 1, "compilation unit");

  static const ElementKind CONSTRUCTOR =
      const ElementKind('CONSTRUCTOR', 2, "constructor");

  static const ElementKind DYNAMIC =
      const ElementKind('DYNAMIC', 3, "<dynamic>");

  static const ElementKind EMBEDDED_HTML_SCRIPT =
      const ElementKind('EMBEDDED_HTML_SCRIPT', 4, "embedded html script");

  static const ElementKind ERROR = const ElementKind('ERROR', 5, "<error>");

  static const ElementKind EXPORT =
      const ElementKind('EXPORT', 6, "export directive");

  static const ElementKind EXTERNAL_HTML_SCRIPT =
      const ElementKind('EXTERNAL_HTML_SCRIPT', 7, "external html script");

  static const ElementKind FIELD = const ElementKind('FIELD', 8, "field");

  static const ElementKind FUNCTION =
      const ElementKind('FUNCTION', 9, "function");

  static const ElementKind GETTER = const ElementKind('GETTER', 10, "getter");

  static const ElementKind HTML = const ElementKind('HTML', 11, "html");

  static const ElementKind IMPORT =
      const ElementKind('IMPORT', 12, "import directive");

  static const ElementKind LABEL = const ElementKind('LABEL', 13, "label");

  static const ElementKind LIBRARY =
      const ElementKind('LIBRARY', 14, "library");

  static const ElementKind LOCAL_VARIABLE =
      const ElementKind('LOCAL_VARIABLE', 15, "local variable");

  static const ElementKind METHOD = const ElementKind('METHOD', 16, "method");

  static const ElementKind NAME = const ElementKind('NAME', 17, "<name>");

  static const ElementKind PARAMETER =
      const ElementKind('PARAMETER', 18, "parameter");

  static const ElementKind PREFIX =
      const ElementKind('PREFIX', 19, "import prefix");

  static const ElementKind SETTER = const ElementKind('SETTER', 20, "setter");

  static const ElementKind TOP_LEVEL_VARIABLE =
      const ElementKind('TOP_LEVEL_VARIABLE', 21, "top level variable");

  static const ElementKind FUNCTION_TYPE_ALIAS =
      const ElementKind('FUNCTION_TYPE_ALIAS', 22, "function type alias");

  static const ElementKind TYPE_PARAMETER =
      const ElementKind('TYPE_PARAMETER', 23, "type parameter");

  static const ElementKind UNIVERSE =
      const ElementKind('UNIVERSE', 24, "<universe>");

  static const List<ElementKind> values = const [
    CLASS,
    COMPILATION_UNIT,
    CONSTRUCTOR,
    DYNAMIC,
    EMBEDDED_HTML_SCRIPT,
    ERROR,
    EXPORT,
    EXTERNAL_HTML_SCRIPT,
    FIELD,
    FUNCTION,
    GETTER,
    HTML,
    IMPORT,
    LABEL,
    LIBRARY,
    LOCAL_VARIABLE,
    METHOD,
    NAME,
    PARAMETER,
    PREFIX,
    SETTER,
    TOP_LEVEL_VARIABLE,
    FUNCTION_TYPE_ALIAS,
    TYPE_PARAMETER,
    UNIVERSE
  ];

  /**
   * The name displayed in the UI for this kind of element.
   */
  final String displayName;

  /**
   * Initialize a newly created element kind to have the given [displayName].
   */
  const ElementKind(String name, int ordinal, this.displayName)
      : super(name, ordinal);

  /**
   * Return the kind of the given [element], or [ERROR] if the element is
   * `null`. This is a utility method that can reduce the need for null checks
   * in other places.
   */
  static ElementKind of(Element element) {
    if (element == null) {
      return ERROR;
    }
    return element.kind;
  }
}

/**
 * The location of an element within the element model.
 */
abstract class ElementLocation {
  /**
   * Return the path to the element whose location is represented by this
   * object. Clients must not modify the returned array.
   */
  List<String> get components;

  /**
   * Return an encoded representation of this location that can be used to
   * create a location that is equal to this location.
   */
  String get encoding;
}

/**
 * A concrete implementation of an [ElementLocation].
 */
class ElementLocationImpl implements ElementLocation {
  /**
   * The character used to separate components in the encoded form.
   */
  static int _SEPARATOR_CHAR = 0x3B;

  /**
   * The path to the element whose location is represented by this object.
   */
  List<String> _components;

  /**
   * The object managing [indexKeyId] and [indexLocationId].
   */
  Object indexOwner;

  /**
   * A cached id of this location in index.
   */
  int indexKeyId;

  /**
   * A cached id of this location in index.
   */
  int indexLocationId;

  /**
   * Initialize a newly created location to represent the given [element].
   */
  ElementLocationImpl.con1(Element element) {
    List<String> components = new List<String>();
    Element ancestor = element;
    while (ancestor != null) {
      components.insert(0, (ancestor as ElementImpl).identifier);
      ancestor = ancestor.enclosingElement;
    }
    this._components = components;
  }

  /**
   * Initialize a newly created location from the given [encoding].
   */
  ElementLocationImpl.con2(String encoding) {
    this._components = _decode(encoding);
  }

  /**
   * Initialize a newly created location from the given [components].
   */
  ElementLocationImpl.con3(List<String> components) {
    this._components = components;
  }

  @override
  List<String> get components => _components;

  @override
  String get encoding {
    StringBuffer buffer = new StringBuffer();
    int length = _components.length;
    for (int i = 0; i < length; i++) {
      if (i > 0) {
        buffer.writeCharCode(_SEPARATOR_CHAR);
      }
      _encode(buffer, _components[i]);
    }
    return buffer.toString();
  }

  @override
  int get hashCode {
    int result = 1;
    for (int i = 0; i < _components.length; i++) {
      String component = _components[i];
      result = 31 * result + component.hashCode;
    }
    return result;
  }

  @override
  bool operator ==(Object object) {
    if (identical(this, object)) {
      return true;
    }
    if (object is! ElementLocationImpl) {
      return false;
    }
    ElementLocationImpl location = object as ElementLocationImpl;
    List<String> otherComponents = location._components;
    int length = _components.length;
    if (otherComponents.length != length) {
      return false;
    }
    for (int i = 0; i < length; i++) {
      if (_components[i] != otherComponents[i]) {
        return false;
      }
    }
    return true;
  }

  @override
  String toString() => encoding;

  /**
   * Decode the [encoding] of a location into a list of components and return
   * the components.
   */
  List<String> _decode(String encoding) {
    List<String> components = new List<String>();
    StringBuffer buffer = new StringBuffer();
    int index = 0;
    int length = encoding.length;
    while (index < length) {
      int currentChar = encoding.codeUnitAt(index);
      if (currentChar == _SEPARATOR_CHAR) {
        if (index + 1 < length &&
            encoding.codeUnitAt(index + 1) == _SEPARATOR_CHAR) {
          buffer.writeCharCode(_SEPARATOR_CHAR);
          index += 2;
        } else {
          components.add(buffer.toString());
          buffer = new StringBuffer();
          index++;
        }
      } else {
        buffer.writeCharCode(currentChar);
        index++;
      }
    }
    components.add(buffer.toString());
    return components;
  }

  /**
   * Append an encoded form of the given [component] to the given [buffer].
   */
  void _encode(StringBuffer buffer, String component) {
    int length = component.length;
    for (int i = 0; i < length; i++) {
      int currentChar = component.codeUnitAt(i);
      if (currentChar == _SEPARATOR_CHAR) {
        buffer.writeCharCode(_SEPARATOR_CHAR);
      }
      buffer.writeCharCode(currentChar);
    }
  }
}

/**
 * An object that can be used to visit an element structure.
 */
abstract class ElementVisitor<R> {
  R visitClassElement(ClassElement element);

  R visitCompilationUnitElement(CompilationUnitElement element);

  R visitConstructorElement(ConstructorElement element);

  @deprecated
  R visitEmbeddedHtmlScriptElement(EmbeddedHtmlScriptElement element);

  R visitExportElement(ExportElement element);

  @deprecated
  R visitExternalHtmlScriptElement(ExternalHtmlScriptElement element);

  R visitFieldElement(FieldElement element);

  R visitFieldFormalParameterElement(FieldFormalParameterElement element);

  R visitFunctionElement(FunctionElement element);

  R visitFunctionTypeAliasElement(FunctionTypeAliasElement element);

  @deprecated
  R visitHtmlElement(HtmlElement element);

  R visitImportElement(ImportElement element);

  R visitLabelElement(LabelElement element);

  R visitLibraryElement(LibraryElement element);

  R visitLocalVariableElement(LocalVariableElement element);

  R visitMethodElement(MethodElement element);

  R visitMultiplyDefinedElement(MultiplyDefinedElement element);

  R visitParameterElement(ParameterElement element);

  R visitPrefixElement(PrefixElement element);

  R visitPropertyAccessorElement(PropertyAccessorElement element);

  R visitTopLevelVariableElement(TopLevelVariableElement element);

  R visitTypeParameterElement(TypeParameterElement element);
}

/**
 * A script tag in an HTML file having content that defines a Dart library.
 */
@deprecated
abstract class EmbeddedHtmlScriptElement implements HtmlScriptElement {
  /**
   * Return the library element defined by the content of the script tag.
   */
  LibraryElement get scriptLibrary;
}

/**
 * A concrete implementation of an [EmbeddedHtmlScriptElement].
 */
@deprecated
class EmbeddedHtmlScriptElementImpl extends HtmlScriptElementImpl
    implements EmbeddedHtmlScriptElement {
  /**
   * The library defined by the script tag's content.
   */
  LibraryElement _scriptLibrary;

  /**
   * Initialize a newly created script element to represent the given [node].
   */
  EmbeddedHtmlScriptElementImpl(XmlTagNode node) : super(node);

  @override
  ElementKind get kind => ElementKind.EMBEDDED_HTML_SCRIPT;

  @override
  LibraryElement get scriptLibrary => _scriptLibrary;

  /**
   * Set the script library defined by the script tag's content to the given
   * [library].
   */
  void set scriptLibrary(LibraryElementImpl library) {
    library.enclosingElement = this;
    _scriptLibrary = library;
  }

  @override
  accept(ElementVisitor visitor) =>
      visitor.visitEmbeddedHtmlScriptElement(this);

  @override
  void visitChildren(ElementVisitor visitor) {
    safelyVisitChild(_scriptLibrary, visitor);
  }
}

/**
 * An element representing an executable object, including functions, methods,
 * constructors, getters, and setters.
 */
abstract class ExecutableElement implements FunctionTypedElement {
  /**
   * An empty list of executable elements.
   */
  static const List<ExecutableElement> EMPTY_LIST = const <ExecutableElement>[];

  /**
   * Return a list containing all of the functions defined within this
   * executable element.
   */
  List<FunctionElement> get functions;

  /**
   * Return `true` if this executable element did not have an explicit return
   * type specified for it in the original source. Note that if there was no
   * explicit return type, and if the element model is fully populated, then
   * the [returnType] will not be `null`.
   */
  bool get hasImplicitReturnType;

  /**
   * Return `true` if this executable element is abstract. Executable elements
   * are abstract if they are not external and have no body.
   */
  bool get isAbstract;

  /**
   * Return `true` if this executable element has body marked as being
   * asynchronous.
   */
  bool get isAsynchronous;

  /**
   * Return `true` if this executable element is external. Executable elements
   * are external if they are explicitly marked as such using the 'external'
   * keyword.
   */
  bool get isExternal;

  /**
   * Return `true` if this executable element has a body marked as being a
   * generator.
   */
  bool get isGenerator;

  /**
   * Return `true` if this executable element is an operator. The test may be
   * based on the name of the executable element, in which case the result will
   * be correct when the name is legal.
   */
  bool get isOperator;

  /**
   * Return `true` if this element is a static element. A static element is an
   * element that is not associated with a particular instance, but rather with
   * an entire library or class.
   */
  bool get isStatic;

  /**
   * Return `true` if this executable element has a body marked as being
   * synchronous.
   */
  bool get isSynchronous;

  /**
   * Return a list containing all of the labels defined within this executable
   * element.
   */
  List<LabelElement> get labels;

  /**
   * Return a list containing all of the local variables defined within this
   * executable element.
   */
  List<LocalVariableElement> get localVariables;
}

/**
 * A base class for concrete implementations of an [ExecutableElement].
 */
abstract class ExecutableElementImpl extends ElementImpl
    implements ExecutableElement {
  /**
   * An empty list of executable elements.
   */
  @deprecated // Use ExecutableElement.EMPTY_LIST
  static const List<ExecutableElement> EMPTY_ARRAY =
      const <ExecutableElement>[];

  /**
   * A list containing all of the functions defined within this executable
   * element.
   */
  List<FunctionElement> _functions = FunctionElement.EMPTY_LIST;

  /**
   * A list containing all of the labels defined within this executable element.
   */
  List<LabelElement> _labels = LabelElement.EMPTY_LIST;

  /**
   * A list containing all of the local variables defined within this executable
   * element.
   */
  List<LocalVariableElement> _localVariables = LocalVariableElement.EMPTY_LIST;

  /**
   * A list containing all of the parameters defined by this executable element.
   */
  List<ParameterElement> _parameters = ParameterElement.EMPTY_LIST;

  /**
   * A list containing all of the type parameters defined for this executable
   * element.
   */
  List<TypeParameterElement> _typeParameters = TypeParameterElement.EMPTY_LIST;

  /**
   * The return type defined by this executable element.
   */
  DartType returnType;

  /**
   * The type of function defined by this executable element.
   */
  FunctionType type;

  /**
   * Initialize a newly created executable element to have the given [name] and
   * [offset].
   */
  ExecutableElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created executable element to have the given [name].
   */
  ExecutableElementImpl.forNode(Identifier name) : super.forNode(name);

  /**
   * Set whether this executable element's body is asynchronous.
   */
  void set asynchronous(bool isAsynchronous) {
    setModifier(Modifier.ASYNCHRONOUS, isAsynchronous);
  }

  /**
   * Set whether this executable element is external.
   */
  void set external(bool isExternal) {
    setModifier(Modifier.EXTERNAL, isExternal);
  }

  @override
  List<FunctionElement> get functions => _functions;

  /**
   * Set the functions defined within this executable element to the given
   * [functions].
   */
  void set functions(List<FunctionElement> functions) {
    for (FunctionElement function in functions) {
      (function as FunctionElementImpl).enclosingElement = this;
    }
    this._functions = functions;
  }

  /**
   * Set whether this method's body is a generator.
   */
  void set generator(bool isGenerator) {
    setModifier(Modifier.GENERATOR, isGenerator);
  }

  @override
  bool get hasImplicitReturnType => hasModifier(Modifier.IMPLICIT_TYPE);

  /**
   * Set whether this executable element has an implicit return type.
   */
  void set hasImplicitReturnType(bool hasImplicitReturnType) {
    setModifier(Modifier.IMPLICIT_TYPE, hasImplicitReturnType);
  }

  @override
  bool get isAbstract => hasModifier(Modifier.ABSTRACT);

  @override
  bool get isAsynchronous => hasModifier(Modifier.ASYNCHRONOUS);

  @override
  bool get isExternal => hasModifier(Modifier.EXTERNAL);

  @override
  bool get isGenerator => hasModifier(Modifier.GENERATOR);

  @override
  bool get isOperator => false;

  @override
  bool get isSynchronous => !hasModifier(Modifier.ASYNCHRONOUS);

  @override
  List<LabelElement> get labels => _labels;

  /**
   * Set the labels defined within this executable element to the given
   * [labels].
   */
  void set labels(List<LabelElement> labels) {
    for (LabelElement label in labels) {
      (label as LabelElementImpl).enclosingElement = this;
    }
    this._labels = labels;
  }

  @override
  List<LocalVariableElement> get localVariables => _localVariables;

  /**
   * Set the local variables defined within this executable element to the given
   * [variables].
   */
  void set localVariables(List<LocalVariableElement> variables) {
    for (LocalVariableElement variable in variables) {
      (variable as LocalVariableElementImpl).enclosingElement = this;
    }
    this._localVariables = variables;
  }

  @override
  List<ParameterElement> get parameters => _parameters;

  /**
   * Set the parameters defined by this executable element to the given
   * [parameters].
   */
  void set parameters(List<ParameterElement> parameters) {
    for (ParameterElement parameter in parameters) {
      (parameter as ParameterElementImpl).enclosingElement = this;
    }
    this._parameters = parameters;
  }

  @override
  List<TypeParameterElement> get typeParameters => _typeParameters;

  /**
   * Set the type parameters defined by this executable element to the given
   * [typeParameters].
   */
  void set typeParameters(List<TypeParameterElement> typeParameters) {
    for (TypeParameterElement parameter in typeParameters) {
      (parameter as TypeParameterElementImpl).enclosingElement = this;
    }
    this._typeParameters = typeParameters;
  }

  @override
  void appendTo(StringBuffer buffer) {
    if (this.kind != ElementKind.GETTER) {
      int typeParameterCount = _typeParameters.length;
      if (typeParameterCount > 0) {
        buffer.write('<');
        for (int i = 0; i < typeParameterCount; i++) {
          if (i > 0) {
            buffer.write(", ");
          }
          (_typeParameters[i] as TypeParameterElementImpl).appendTo(buffer);
        }
        buffer.write('>');
      }
      buffer.write("(");
      String closing = null;
      ParameterKind kind = ParameterKind.REQUIRED;
      int parameterCount = _parameters.length;
      for (int i = 0; i < parameterCount; i++) {
        if (i > 0) {
          buffer.write(", ");
        }
        ParameterElementImpl parameter = _parameters[i] as ParameterElementImpl;
        ParameterKind parameterKind = parameter.parameterKind;
        if (parameterKind != kind) {
          if (closing != null) {
            buffer.write(closing);
          }
          if (parameterKind == ParameterKind.POSITIONAL) {
            buffer.write("[");
            closing = "]";
          } else if (parameterKind == ParameterKind.NAMED) {
            buffer.write("{");
            closing = "}";
          } else {
            closing = null;
          }
        }
        kind = parameterKind;
        parameter.appendToWithoutDelimiters(buffer);
      }
      if (closing != null) {
        buffer.write(closing);
      }
      buffer.write(")");
    }
    if (type != null) {
      buffer.write(Element.RIGHT_ARROW);
      buffer.write(type.returnType);
    }
  }

  @override
  ElementImpl getChild(String identifier) {
    for (ExecutableElement function in _functions) {
      if ((function as ExecutableElementImpl).identifier == identifier) {
        return function as ExecutableElementImpl;
      }
    }
    for (LabelElement label in _labels) {
      if ((label as LabelElementImpl).identifier == identifier) {
        return label as LabelElementImpl;
      }
    }
    for (VariableElement variable in _localVariables) {
      if ((variable as VariableElementImpl).identifier == identifier) {
        return variable as VariableElementImpl;
      }
    }
    for (ParameterElement parameter in _parameters) {
      if ((parameter as ParameterElementImpl).identifier == identifier) {
        return parameter as ParameterElementImpl;
      }
    }
    return null;
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    super.visitChildren(visitor);
    safelyVisitChildren(_functions, visitor);
    safelyVisitChildren(_labels, visitor);
    safelyVisitChildren(_localVariables, visitor);
    safelyVisitChildren(_parameters, visitor);
  }
}

/**
 * An executable element defined in a parameterized type where the values of the
 * type parameters are known.
 */
abstract class ExecutableMember extends Member implements ExecutableElement {
  @override
  final FunctionType type;

  /**
   * Initialize a newly created element to represent a callable element (like a
   * method or function or property), based on the [baseElement], defined by the
   * [definingType]. If [type] is passed, it represents the full type of the
   * member, and will take precedence over the [definingType].
   */
  ExecutableMember(ExecutableElement baseElement, InterfaceType definingType,
      [FunctionType type])
      : type = type ??
            baseElement.type.substitute2(definingType.typeArguments,
                TypeParameterTypeImpl.getTypes(definingType.typeParameters)),
        super(baseElement, definingType);

  @override
  ExecutableElement get baseElement => super.baseElement as ExecutableElement;

  @override
  List<FunctionElement> get functions {
    //
    // Elements within this element should have type parameters substituted,
    // just like this element.
    //
    throw new UnsupportedOperationException();
//    return getBaseElement().getFunctions();
  }

  @override
  bool get hasImplicitReturnType => baseElement.hasImplicitReturnType;

  @override
  bool get isAbstract => baseElement.isAbstract;

  @override
  bool get isAsynchronous => baseElement.isAsynchronous;

  @override
  bool get isExternal => baseElement.isExternal;

  @override
  bool get isGenerator => baseElement.isGenerator;

  @override
  bool get isOperator => baseElement.isOperator;

  @override
  bool get isStatic => baseElement.isStatic;

  @override
  bool get isSynchronous => baseElement.isSynchronous;

  @override
  List<LabelElement> get labels => baseElement.labels;

  @override
  List<LocalVariableElement> get localVariables {
    //
    // Elements within this element should have type parameters substituted,
    // just like this element.
    //
    throw new UnsupportedOperationException();
//    return getBaseElement().getLocalVariables();
  }

  @override
  List<ParameterElement> get parameters => type.parameters;

  @override
  DartType get returnType => type.returnType;

  @override
  List<TypeParameterElement> get typeParameters => baseElement.typeParameters;

  @override
  void visitChildren(ElementVisitor visitor) {
    // TODO(brianwilkerson) We need to finish implementing the accessors used
    // below so that we can safely invoke them.
    super.visitChildren(visitor);
    safelyVisitChildren(baseElement.functions, visitor);
    safelyVisitChildren(labels, visitor);
    safelyVisitChildren(baseElement.localVariables, visitor);
    safelyVisitChildren(parameters, visitor);
  }
}

/**
 * An export directive within a library.
 */
abstract class ExportElement implements Element, UriReferencedElement {
  /**
   * An empty list of export elements.
   */
  @deprecated // Use ExportElement.EMPTY_LIST
  static const List<ExportElement> EMPTY_ARRAY = const <ExportElement>[];

  /**
   * An empty list of export elements.
   */
  static const List<ExportElement> EMPTY_LIST = const <ExportElement>[];

  /**
   * Return a list containing the combinators that were specified as part of the
   * export directive in the order in which they were specified.
   */
  List<NamespaceCombinator> get combinators;

  /**
   * Return the library that is exported from this library by this export
   * directive.
   */
  LibraryElement get exportedLibrary;
}

/**
 * A concrete implementation of an [ExportElement].
 */
class ExportElementImpl extends UriReferencedElementImpl
    implements ExportElement {
  /**
   * The library that is exported from this library by this export directive.
   */
  LibraryElement exportedLibrary;

  /**
   * The combinators that were specified as part of the export directive in the
   * order in which they were specified.
   */
  List<NamespaceCombinator> combinators = NamespaceCombinator.EMPTY_LIST;

  /**
   * Initialize a newly created export element at the given [offset].
   */
  ExportElementImpl(int offset) : super(null, offset);

  @override
  String get identifier => exportedLibrary.name;

  @override
  ElementKind get kind => ElementKind.EXPORT;

  @override
  accept(ElementVisitor visitor) => visitor.visitExportElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    buffer.write("export ");
    (exportedLibrary as LibraryElementImpl).appendTo(buffer);
  }
}

/**
 * A script tag in an HTML file having a `source` attribute that references a
 * Dart library source file.
 */
@deprecated
abstract class ExternalHtmlScriptElement implements HtmlScriptElement {
  /**
   * Return the source referenced by this element, or `null` if this element
   * does not reference a Dart library source file.
   */
  Source get scriptSource;
}

/**
 * A concrete implementation of an [ExternalHtmlScriptElement].
 */
@deprecated
class ExternalHtmlScriptElementImpl extends HtmlScriptElementImpl
    implements ExternalHtmlScriptElement {
  /**
   * The source specified in the `source` attribute or `null` if unspecified.
   */
  Source scriptSource;

  /**
   * Initialize a newly created script element to correspond to the given
   * [node].
   */
  ExternalHtmlScriptElementImpl(XmlTagNode node) : super(node);

  @override
  ElementKind get kind => ElementKind.EXTERNAL_HTML_SCRIPT;

  @override
  accept(ElementVisitor visitor) =>
      visitor.visitExternalHtmlScriptElement(this);
}

/**
 * A field defined within a type.
 */
abstract class FieldElement
    implements ClassMemberElement, PropertyInducingElement {
  /**
   * An empty list of field elements.
   */
  static const List<FieldElement> EMPTY_LIST = const <FieldElement>[];

  /**
   * Return {@code true} if this element is an enum constant.
   */
  bool get isEnumConstant;

  /**
   * Return the resolved [VariableDeclaration] or [EnumConstantDeclaration]
   * node that declares this [FieldElement].
   *
   * This method is expensive, because resolved AST might be evicted from cache,
   * so parsing and resolving will be performed.
   */
  @override
  AstNode computeNode();
}

/**
 * A concrete implementation of a [FieldElement].
 */
class FieldElementImpl extends PropertyInducingElementImpl
    implements FieldElement {
  /**
   * An empty list of field elements.
   */
  @deprecated // Use FieldElement.EMPTY_LIST
  static const List<FieldElement> EMPTY_ARRAY = const <FieldElement>[];

  /**
   * Initialize a newly created synthetic field element to have the given [name]
   * at the given [offset].
   */
  FieldElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created field element to have the given [name].
   */
  FieldElementImpl.forNode(Identifier name) : super.forNode(name);

  @override
  ClassElement get enclosingElement => super.enclosingElement as ClassElement;

  @override
  bool get isEnumConstant =>
      enclosingElement != null ? enclosingElement.isEnum : false;

  @override
  ElementKind get kind => ElementKind.FIELD;

  /**
   * Set whether this field is static.
   */
  void set static(bool isStatic) {
    setModifier(Modifier.STATIC, isStatic);
  }

  @override
  accept(ElementVisitor visitor) => visitor.visitFieldElement(this);

  @override
  AstNode computeNode() {
    if (isEnumConstant) {
      return getNodeMatching((node) => node is EnumConstantDeclaration);
    } else {
      return getNodeMatching((node) => node is VariableDeclaration);
    }
  }
}

/**
 * A field formal parameter defined within a constructor element.
 */
abstract class FieldFormalParameterElement implements ParameterElement {
  /**
   * Return the field element associated with this field formal parameter, or
   * `null` if the parameter references a field that doesn't exist.
   */
  FieldElement get field;
}

/**
 * A [ParameterElementImpl] that has the additional information of the
 * [FieldElement] associated with the parameter.
 */
class FieldFormalParameterElementImpl extends ParameterElementImpl
    implements FieldFormalParameterElement {
  /**
   * The field associated with this field formal parameter.
   */
  FieldElement field;

  /**
   * Initialize a newly created parameter element to have the given [name].
   */
  FieldFormalParameterElementImpl(Identifier name) : super.forNode(name);

  @override
  bool get isInitializingFormal => true;

  @override
  accept(ElementVisitor visitor) =>
      visitor.visitFieldFormalParameterElement(this);
}

/**
 * A parameter element defined in a parameterized type where the values of the
 * type parameters are known.
 */
class FieldFormalParameterMember extends ParameterMember
    implements FieldFormalParameterElement {
  /**
   * Initialize a newly created element to represent a field formal parameter,
   * based on the [baseElement], defined by the [definingType]. If [type]
   * is passed it will be used as the substituted type for this member.
   */
  FieldFormalParameterMember(
      FieldFormalParameterElement baseElement, ParameterizedType definingType,
      [DartType type])
      : super(baseElement, definingType, type);

  @override
  FieldElement get field {
    FieldElement field = (baseElement as FieldFormalParameterElement).field;
    if (field is FieldElement) {
      return FieldMember.from(
          field, substituteFor(field.enclosingElement.type));
    }
    return field;
  }

  @override
  accept(ElementVisitor visitor) =>
      visitor.visitFieldFormalParameterElement(this);
}

/**
 * A field element defined in a parameterized type where the values of the type
 * parameters are known.
 */
class FieldMember extends VariableMember implements FieldElement {
  /**
   * Initialize a newly created element to represent a field, based on the
   * [baseElement], defined by the [definingType].
   */
  FieldMember(FieldElement baseElement, InterfaceType definingType)
      : super(baseElement, definingType);

  @override
  FieldElement get baseElement => super.baseElement as FieldElement;

  @override
  ClassElement get enclosingElement => baseElement.enclosingElement;

  @override
  PropertyAccessorElement get getter =>
      PropertyAccessorMember.from(baseElement.getter, definingType);

  @override
  bool get isEnumConstant => baseElement.isEnumConstant;

  @override
  DartType get propagatedType => substituteFor(baseElement.propagatedType);

  @override
  PropertyAccessorElement get setter =>
      PropertyAccessorMember.from(baseElement.setter, definingType);

  @override
  accept(ElementVisitor visitor) => visitor.visitFieldElement(this);

  @override
  VariableDeclaration computeNode() => baseElement.computeNode();

  @override
  String toString() => '$type $displayName';

  /**
   * If the given [field]'s type is different when any type parameters from the
   * defining type's declaration are replaced with the actual type arguments
   * from the [definingType], create a field member representing the given
   * field. Return the member that was created, or the base field if no member
   * was created.
   */
  static FieldElement from(FieldElement field, ParameterizedType definingType) {
    if (!_isChangedByTypeSubstitution(field, definingType)) {
      return field;
    }
    // TODO(brianwilkerson) Consider caching the substituted type in the
    // instance. It would use more memory but speed up some operations.
    // We need to see how often the type is being re-computed.
    return new FieldMember(field, definingType);
  }

  /**
   * Determine whether the given [field]'s type is changed when type parameters
   * from the [definingType]'s declaration are replaced with the actual type
   * arguments from the defining type.
   */
  static bool _isChangedByTypeSubstitution(
      FieldElement field, ParameterizedType definingType) {
    List<DartType> argumentTypes = definingType.typeArguments;
    if (field != null && argumentTypes.length != 0) {
      DartType baseType = field.type;
      List<DartType> parameterTypes =
          TypeParameterTypeImpl.getTypes(definingType.typeParameters);
      if (baseType != null) {
        DartType substitutedType =
            baseType.substitute2(argumentTypes, parameterTypes);
        if (baseType != substitutedType) {
          return true;
        }
      }
      // If the field has a propagated type, then we need to check whether the
      // propagated type needs substitution.
      DartType basePropagatedType = field.propagatedType;
      if (basePropagatedType != null) {
        DartType substitutedPropagatedType =
            basePropagatedType.substitute2(argumentTypes, parameterTypes);
        if (basePropagatedType != substitutedPropagatedType) {
          return true;
        }
      }
    }
    return false;
  }
}

/**
 * A (non-method) function. This can be either a top-level function, a local
 * function, a closure, or the initialization expression for a field or
 * variable.
 */
abstract class FunctionElement implements ExecutableElement, LocalElement {
  /**
   * An empty list of function elements.
   */
  static const List<FunctionElement> EMPTY_LIST = const <FunctionElement>[];

  /**
   * The name of the method that can be implemented by a class to allow its
   * instances to be invoked as if they were a function.
   */
  static final String CALL_METHOD_NAME = "call";

  /**
   * The name of the synthetic function defined for libraries that are deferred.
   */
  static final String LOAD_LIBRARY_NAME = "loadLibrary";

  /**
   * The name of the function used as an entry point.
   */
  static const String MAIN_FUNCTION_NAME = "main";

  /**
   * The name of the method that will be invoked if an attempt is made to invoke
   * an undefined method on an object.
   */
  static final String NO_SUCH_METHOD_METHOD_NAME = "noSuchMethod";

  /**
   * Return `true` if the function is an entry point, i.e. a top-level function
   * and has the name `main`.
   */
  bool get isEntryPoint;

  /**
   * Return the resolved function declaration node that declares this element.
   *
   * This method is expensive, because resolved AST might be evicted from cache,
   * so parsing and resolving will be performed.
   */
  @override
  FunctionDeclaration computeNode();
}

/**
 * A concrete implementation of a [FunctionElement].
 */
class FunctionElementImpl extends ExecutableElementImpl
    implements FunctionElement {
  /**
   * An empty list of function elements.
   */
  @deprecated // Use FunctionElement.EMPTY_LIST
  static const List<FunctionElement> EMPTY_ARRAY = const <FunctionElement>[];

  /**
   * The offset to the beginning of the visible range for this element.
   */
  int _visibleRangeOffset = 0;

  /**
   * The length of the visible range for this element, or `-1` if this element
   * does not have a visible range.
   */
  int _visibleRangeLength = -1;

  /**
   * Initialize a newly created function element to have the given [name] and
   * [offset].
   */
  FunctionElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created function element to have the given [name].
   */
  FunctionElementImpl.forNode(Identifier name) : super.forNode(name);

  /**
   * Initialize a newly created function element to have no name and the given
   * [offset]. This is used for function expressions, that have no name.
   */
  FunctionElementImpl.forOffset(int nameOffset) : super("", nameOffset);

  @override
  String get identifier {
    String identifier = super.identifier;
    if (!isStatic) {
      identifier += "@$nameOffset";
    }
    return identifier;
  }

  @override
  bool get isEntryPoint {
    return isStatic && displayName == FunctionElement.MAIN_FUNCTION_NAME;
  }

  @override
  bool get isStatic => enclosingElement is CompilationUnitElement;

  @override
  ElementKind get kind => ElementKind.FUNCTION;

  @override
  SourceRange get visibleRange {
    if (_visibleRangeLength < 0) {
      return null;
    }
    return new SourceRange(_visibleRangeOffset, _visibleRangeLength);
  }

  @override
  accept(ElementVisitor visitor) => visitor.visitFunctionElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    String name = displayName;
    if (name != null) {
      buffer.write(name);
    }
    super.appendTo(buffer);
  }

  @override
  FunctionDeclaration computeNode() =>
      getNodeMatching((node) => node is FunctionDeclaration);

  /**
   * Set the visible range for this element to the range starting at the given
   * [offset] with the given [length].
   */
  void setVisibleRange(int offset, int length) {
    _visibleRangeOffset = offset;
    _visibleRangeLength = length;
  }

  /**
   * Set the parameters defined by this type alias to the given [parameters]
   * without becoming the parent of the parameters. This should only be used by
   * the [TypeResolverVisitor] when creating a synthetic type alias.
   */
  void shareParameters(List<ParameterElement> parameters) {
    this._parameters = parameters;
  }
}

/**
 * An element of a generic function, where the type parameters are known.
 */
// TODO(jmesserly): the term "function member" is a bit weird, but it allows
// a certain consistency.
class FunctionMember extends ExecutableMember implements FunctionElement {
  /**
   * Initialize a newly created element to represent a function, based on the
   * [baseElement], with the corresponding function [type].
   */
  FunctionMember(FunctionElement baseElement, [DartType type])
      : super(baseElement, null, type);

  @override
  FunctionElement get baseElement => super.baseElement as FunctionElement;

  @override
  Element get enclosingElement => baseElement.enclosingElement;

  @override
  bool get isEntryPoint => baseElement.isEntryPoint;

  @override
  SourceRange get visibleRange => baseElement.visibleRange;

  @override
  accept(ElementVisitor visitor) => visitor.visitFunctionElement(this);

  @override
  FunctionDeclaration computeNode() => baseElement.computeNode();

  @override
  String toString() {
    StringBuffer buffer = new StringBuffer();
    buffer.write(baseElement.displayName);
    (type as FunctionTypeImpl).appendTo(buffer);
    return buffer.toString();
  }

  /**
   * If the given [method]'s type is different when any type parameters from the
   * defining type's declaration are replaced with the actual type arguments
   * from the [definingType], create a method member representing the given
   * method. Return the member that was created, or the base method if no member
   * was created.
   */
  static MethodElement from(
      MethodElement method, ParameterizedType definingType) {
    if (method == null || definingType.typeArguments.length == 0) {
      return method;
    }
    FunctionType baseType = method.type;
    List<DartType> argumentTypes = definingType.typeArguments;
    List<DartType> parameterTypes =
        TypeParameterTypeImpl.getTypes(definingType.typeParameters);
    FunctionType substitutedType =
        baseType.substitute2(argumentTypes, parameterTypes);
    if (baseType == substitutedType) {
      return method;
    }
    return new MethodMember(method, definingType, substitutedType);
  }
}

/**
 * The type of a function, method, constructor, getter, or setter. Function
 * types come in three variations:
 *
 * * The types of functions that only have required parameters. These have the
 *   general form <i>(T<sub>1</sub>, &hellip;, T<sub>n</sub>) &rarr; T</i>.
 * * The types of functions with optional positional parameters. These have the
 *   general form <i>(T<sub>1</sub>, &hellip;, T<sub>n</sub>, [T<sub>n+1</sub>
 *   &hellip;, T<sub>n+k</sub>]) &rarr; T</i>.
 * * The types of functions with named parameters. These have the general form
 *   <i>(T<sub>1</sub>, &hellip;, T<sub>n</sub>, {T<sub>x1</sub> x1, &hellip;,
 *   T<sub>xk</sub> xk}) &rarr; T</i>.
 */
abstract class FunctionType implements ParameterizedType {
  /**
   * The type parameters of this generic function. For example `<T> T -> T`.
   *
   * These are distinct from the [typeParameters] list, which contains type
   * parameters from surrounding contexts, and thus are free type variables from
   * the perspective of this function type.
   */
  List<TypeParameterElement> get boundTypeParameters;

  /**
   * Return a map from the names of named parameters to the types of the named
   * parameters of this type of function. The entries in the map will be
   * iterated in the same order as the order in which the named parameters were
   * defined. If there were no named parameters declared then the map will be
   * empty.
   */
  Map<String, DartType> get namedParameterTypes;

  /**
   * Return a list containing the types of the normal parameters of this type of
   * function. The parameter types are in the same order as they appear in the
   * declaration of the function.
   */
  List<DartType> get normalParameterTypes;

  /**
   * Return a map from the names of optional (positional) parameters to the
   * types of the optional parameters of this type of function. The entries in
   * the map will be iterated in the same order as the order in which the
   * optional parameters were defined. If there were no optional parameters
   * declared then the map will be empty.
   */
  List<DartType> get optionalParameterTypes;

  /**
   * Return a list containing the parameters elements of this type of function.
   * The parameter types are in the same order as they appear in the declaration
   * of the function.
   */
  List<ParameterElement> get parameters;

  /**
   * Return the type of object returned by this type of function.
   */
  DartType get returnType;

  /**
   * Return the type resulting from instantiating (replacing) the given
   * [argumentTypes] for this function's bound type parameters.
   */
  FunctionType instantiate(List<DartType> argumentTypes);

  /**
   * Return `true` if this type is a subtype of the given [type].
   *
   * A function type <i>(T<sub>1</sub>, &hellip;, T<sub>n</sub>) &rarr; T</i> is
   * a subtype of the function type <i>(S<sub>1</sub>, &hellip;, S<sub>n</sub>)
   * &rarr; S</i>, if all of the following conditions are met:
   *
   * * Either
   *   * <i>S</i> is void, or
   *   * <i>T &hArr; S</i>.
   *
   * * For all <i>i</i>, 1 <= <i>i</i> <= <i>n</i>, <i>T<sub>i</sub> &hArr;
   *   S<sub>i</sub></i>.
   *
   * A function type <i>(T<sub>1</sub>, &hellip;, T<sub>n</sub>,
   * [T<sub>n+1</sub>, &hellip;, T<sub>n+k</sub>]) &rarr; T</i> is a subtype of
   * the function type <i>(S<sub>1</sub>, &hellip;, S<sub>n</sub>,
   * [S<sub>n+1</sub>, &hellip;, S<sub>n+m</sub>]) &rarr; S</i>, if all of the
   * following conditions are met:
   *
   * * Either
   *   * <i>S</i> is void, or
   *   * <i>T &hArr; S</i>.
   *
   * * <i>k</i> >= <i>m</i> and for all <i>i</i>, 1 <= <i>i</i> <= <i>n+m</i>,
   *   <i>T<sub>i</sub> &hArr; S<sub>i</sub></i>.
   *
   * A function type <i>(T<sub>1</sub>, &hellip;, T<sub>n</sub>,
   * {T<sub>x1</sub> x1, &hellip;, T<sub>xk</sub> xk}) &rarr; T</i> is a subtype
   * of the function type <i>(S<sub>1</sub>, &hellip;, S<sub>n</sub>,
   * {S<sub>y1</sub> y1, &hellip;, S<sub>ym</sub> ym}) &rarr; S</i>, if all of
   * the following conditions are met:
   * * Either
   *   * <i>S</i> is void,
   *   * or <i>T &hArr; S</i>.
   *
   * * For all <i>i</i>, 1 <= <i>i</i> <= <i>n</i>, <i>T<sub>i</sub> &hArr;
   *   S<sub>i</sub></i>.
   * * <i>k</i> >= <i>m</i> and <i>y<sub>i</sub></i> in <i>{x<sub>1</sub>,
   *   &hellip;, x<sub>k</sub>}</i>, 1 <= <i>i</i> <= <i>m</i>.
   * * For all <i>y<sub>i</sub></i> in <i>{y<sub>1</sub>, &hellip;,
   *   y<sub>m</sub>}</i>, <i>y<sub>i</sub> = x<sub>j</sub> => Tj &hArr; Si</i>.
   *
   * In addition, the following subtype rules apply:
   *
   * <i>(T<sub>1</sub>, &hellip;, T<sub>n</sub>, []) &rarr; T <: (T<sub>1</sub>,
   * &hellip;, T<sub>n</sub>) &rarr; T.</i><br>
   * <i>(T<sub>1</sub>, &hellip;, T<sub>n</sub>) &rarr; T <: (T<sub>1</sub>,
   * &hellip;, T<sub>n</sub>, {}) &rarr; T.</i><br>
   * <i>(T<sub>1</sub>, &hellip;, T<sub>n</sub>, {}) &rarr; T <: (T<sub>1</sub>,
   * &hellip;, T<sub>n</sub>) &rarr; T.</i><br>
   * <i>(T<sub>1</sub>, &hellip;, T<sub>n</sub>) &rarr; T <: (T<sub>1</sub>,
   * &hellip;, T<sub>n</sub>, []) &rarr; T.</i>
   *
   * All functions implement the class `Function`. However not all function
   * types are a subtype of `Function`. If an interface type <i>I</i> includes a
   * method named `call()`, and the type of `call()` is the function type
   * <i>F</i>, then <i>I</i> is considered to be a subtype of <i>F</i>.
   */
  @override
  bool isSubtypeOf(DartType type);

  @override
  FunctionType substitute2(
      List<DartType> argumentTypes, List<DartType> parameterTypes);

  /**
   * Return the type resulting from substituting the given [argumentTypes] for
   * this type's parameters. This is fully equivalent to
   * `substitute(argumentTypes, getTypeArguments())`.
   */
  @deprecated // use instantiate
  FunctionType substitute3(List<DartType> argumentTypes);
}

/**
 * A function type alias (`typedef`).
 */
abstract class FunctionTypeAliasElement
    implements TypeDefiningElement, FunctionTypedElement {
  /**
   * An empty array of type alias elements.
   */
  static List<FunctionTypeAliasElement> EMPTY_LIST =
      new List<FunctionTypeAliasElement>(0);

  /**
   * Return the compilation unit in which this type alias is defined.
   */
  @override
  CompilationUnitElement get enclosingElement;

  /**
   * Return the resolved function type alias node that declares this element.
   *
   * This method is expensive, because resolved AST might be evicted from cache,
   * so parsing and resolving will be performed.
   */
  @override
  FunctionTypeAlias computeNode();
}

/**
 * A concrete implementation of a [FunctionTypeAliasElement].
 */
class FunctionTypeAliasElementImpl extends ElementImpl
    implements FunctionTypeAliasElement {
  /**
   * An empty array of type alias elements.
   */
  @deprecated // Use FunctionTypeAliasElement.EMPTY_LIST
  static List<FunctionTypeAliasElement> EMPTY_ARRAY =
      new List<FunctionTypeAliasElement>(0);

  /**
   * A list containing all of the parameters defined by this type alias.
   */
  List<ParameterElement> _parameters = ParameterElement.EMPTY_LIST;

  /**
   * The return type defined by this type alias.
   */
  DartType returnType;

  /**
   * The type of function defined by this type alias.
   */
  FunctionType type;

  /**
   * A list containing all of the type parameters defined for this type.
   */
  List<TypeParameterElement> _typeParameters = TypeParameterElement.EMPTY_LIST;

  /**
   * Initialize a newly created type alias element to have the given name.
   *
   * [name] the name of this element
   * [nameOffset] the offset of the name of this element in the file that
   *    contains the declaration of this element
   */
  FunctionTypeAliasElementImpl(String name, int nameOffset)
      : super(name, nameOffset);

  /**
   * Initialize a newly created type alias element to have the given [name].
   */
  FunctionTypeAliasElementImpl.forNode(Identifier name) : super.forNode(name);

  @override
  CompilationUnitElement get enclosingElement =>
      super.enclosingElement as CompilationUnitElement;

  @override
  ElementKind get kind => ElementKind.FUNCTION_TYPE_ALIAS;

  @override
  List<ParameterElement> get parameters => _parameters;

  /**
   * Set the parameters defined by this type alias to the given [parameters].
   */
  void set parameters(List<ParameterElement> parameters) {
    if (parameters != null) {
      for (ParameterElement parameter in parameters) {
        (parameter as ParameterElementImpl).enclosingElement = this;
      }
    }
    this._parameters = parameters;
  }

  @override
  List<TypeParameterElement> get typeParameters => _typeParameters;

  /**
   * Set the type parameters defined for this type to the given
   * [typeParameters].
   */
  void set typeParameters(List<TypeParameterElement> typeParameters) {
    for (TypeParameterElement typeParameter in typeParameters) {
      (typeParameter as TypeParameterElementImpl).enclosingElement = this;
    }
    this._typeParameters = typeParameters;
  }

  @override
  accept(ElementVisitor visitor) => visitor.visitFunctionTypeAliasElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    buffer.write("typedef ");
    buffer.write(displayName);
    int typeParameterCount = _typeParameters.length;
    if (typeParameterCount > 0) {
      buffer.write("<");
      for (int i = 0; i < typeParameterCount; i++) {
        if (i > 0) {
          buffer.write(", ");
        }
        (_typeParameters[i] as TypeParameterElementImpl).appendTo(buffer);
      }
      buffer.write(">");
    }
    buffer.write("(");
    int parameterCount = _parameters.length;
    for (int i = 0; i < parameterCount; i++) {
      if (i > 0) {
        buffer.write(", ");
      }
      (_parameters[i] as ParameterElementImpl).appendTo(buffer);
    }
    buffer.write(")");
    if (type != null) {
      buffer.write(Element.RIGHT_ARROW);
      buffer.write(type.returnType);
    } else if (returnType != null) {
      buffer.write(Element.RIGHT_ARROW);
      buffer.write(returnType);
    }
  }

  @override
  FunctionTypeAlias computeNode() =>
      getNodeMatching((node) => node is FunctionTypeAlias);

  @override
  ElementImpl getChild(String identifier) {
    for (VariableElement parameter in _parameters) {
      if ((parameter as VariableElementImpl).identifier == identifier) {
        return parameter as VariableElementImpl;
      }
    }
    for (TypeParameterElement typeParameter in _typeParameters) {
      if ((typeParameter as TypeParameterElementImpl).identifier ==
          identifier) {
        return typeParameter as TypeParameterElementImpl;
      }
    }
    return null;
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    super.visitChildren(visitor);
    safelyVisitChildren(_parameters, visitor);
    safelyVisitChildren(_typeParameters, visitor);
  }
}

/**
 * An element that has a [FunctionType] as its [type].
 *
 * This also provides convenient access to the parameters and return type.
 */
abstract class FunctionTypedElement implements TypeParameterizedElement {
  /**
   * Return a list containing all of the parameters defined by this executable
   * element.
   */
  List<ParameterElement> get parameters;

  /**
   * Return the return type defined by this element. If the element model is
   * fully populated, then the [returnType] will not be `null`, even
   * if no return type was explicitly specified.
   */
  DartType get returnType;

  /**
   * Return the type of function defined by this element.
   */
  FunctionType get type;
}

/**
 * The type of a function, method, constructor, getter, or setter.
 */
class FunctionTypeImpl extends TypeImpl implements FunctionType {
  /**
   * The list of [typeArguments].
   */
  List<DartType> _typeArguments;

  /**
   * The list of [typeParameters].
   */
  List<TypeParameterElement> _typeParameters;

  /**
   * The list of [boundTypeParameters].
   */
  List<TypeParameterElement> _boundTypeParameters;

  /**
   * The set of typedefs which should not be expanded when exploring this type,
   * to avoid creating infinite types in response to self-referential typedefs.
   */
  final List<FunctionTypeAliasElement> prunedTypedefs;

  /**
   * Initialize a newly created function type to be declared by the given
   * [element], and also initialize [typeArguments] to match the
   * [typeParameters], which permits later substitution.
   */
  FunctionTypeImpl(ExecutableElement element,
      [List<FunctionTypeAliasElement> prunedTypedefs])
      : this._(element, null, prunedTypedefs, null, null, null);

  /**
   * Initialize a newly created function type to be declared by the given
   * [element].
   */
  @deprecated // Use new FunctionTypeImpl(element)
  FunctionTypeImpl.con1(ExecutableElement element) : this(element);

  /**
   * Initialize a newly created function type to be declared by the given
   * [element].
   */
  @deprecated // Use new FunctionTypeImpl.forTypedef(element)
  FunctionTypeImpl.con2(FunctionTypeAliasElement element)
      : this.forTypedef(element);

  /**
   * Initialize a newly created function type to be declared by the given
   * [element].
   */
  FunctionTypeImpl.forTypedef(FunctionTypeAliasElement element,
      [List<FunctionTypeAliasElement> prunedTypedefs])
      : this._(element, element?.name, prunedTypedefs, null, null, null);

  /**
   * Private constructor.
   */
  FunctionTypeImpl._(
      TypeParameterizedElement element,
      String name,
      this.prunedTypedefs,
      List<DartType> typeArguments,
      List<TypeParameterElement> typeParameters,
      List<TypeParameterElement> boundTypeParameters)
      : super(element, name) {
    _boundTypeParameters = boundTypeParameters ??
        element?.typeParameters ??
        TypeParameterElement.EMPTY_LIST;

    if (typeParameters == null) {
      // Combine the generic type variables from all enclosing contexts, except
      // for this generic function's type variables. Those variables are
      // tracked in [boundTypeParameters].
      typeParameters = <TypeParameterElement>[];
      Element e = element?.enclosingElement;
      while (e != null) {
        if (e is TypeParameterizedElement) {
          typeParameters.addAll((e as TypeParameterizedElement).typeParameters);
        }
        e = e.enclosingElement;
      }
    }
    _typeParameters = typeParameters;

    if (typeArguments == null) {
      // TODO(jmesserly): reuse TypeParameterTypeImpl.getTypes once we can
      // make it generic, which will allow it to return List<DartType> instead
      // of List<TypeParameterType>.
      if (typeParameters.isEmpty) {
        typeArguments = DartType.EMPTY_LIST;
      } else {
        typeArguments = new List<DartType>.from(
            typeParameters.map((t) => t.type),
            growable: false);
      }
    }
    _typeArguments = typeArguments;
  }

  /**
   * Return the base parameter elements of this function element.
   */
  List<ParameterElement> get baseParameters => element.parameters;

  /**
   * Return the return type defined by this function's element.
   */
  DartType get baseReturnType => element.returnType;

  @override
  List<TypeParameterElement> get boundTypeParameters => _boundTypeParameters;

  @override
  String get displayName {
    String name = this.name;
    if (name == null || name.length == 0) {
      // Function types have an empty name when they are defined implicitly by
      // either a closure or as part of a parameter declaration.
      List<DartType> normalParameterTypes = this.normalParameterTypes;
      List<DartType> optionalParameterTypes = this.optionalParameterTypes;
      Map<String, DartType> namedParameterTypes = this.namedParameterTypes;
      DartType returnType = this.returnType;
      StringBuffer buffer = new StringBuffer();
      buffer.write("(");
      bool needsComma = false;
      if (normalParameterTypes.length > 0) {
        for (DartType type in normalParameterTypes) {
          if (needsComma) {
            buffer.write(", ");
          } else {
            needsComma = true;
          }
          buffer.write(type.displayName);
        }
      }
      if (optionalParameterTypes.length > 0) {
        if (needsComma) {
          buffer.write(", ");
          needsComma = false;
        }
        buffer.write("[");
        for (DartType type in optionalParameterTypes) {
          if (needsComma) {
            buffer.write(", ");
          } else {
            needsComma = true;
          }
          buffer.write(type.displayName);
        }
        buffer.write("]");
        needsComma = true;
      }
      if (namedParameterTypes.length > 0) {
        if (needsComma) {
          buffer.write(", ");
          needsComma = false;
        }
        buffer.write("{");
        namedParameterTypes.forEach((String name, DartType type) {
          if (needsComma) {
            buffer.write(", ");
          } else {
            needsComma = true;
          }
          buffer.write(name);
          buffer.write(": ");
          buffer.write(type.displayName);
        });
        buffer.write("}");
        needsComma = true;
      }
      buffer.write(")");
      buffer.write(Element.RIGHT_ARROW);
      if (returnType == null) {
        buffer.write("null");
      } else {
        buffer.write(returnType.displayName);
      }
      name = buffer.toString();
    }
    return name;
  }

  @override
  FunctionTypedElement get element => super.element;

  @override
  int get hashCode {
    if (element == null) {
      return 0;
    }
    // Reference the arrays of parameters
    List<DartType> normalParameterTypes = this.normalParameterTypes;
    List<DartType> optionalParameterTypes = this.optionalParameterTypes;
    Iterable<DartType> namedParameterTypes = this.namedParameterTypes.values;
    // Generate the hashCode
    int code = (returnType as TypeImpl).hashCode;
    for (int i = 0; i < normalParameterTypes.length; i++) {
      code = (code << 1) + (normalParameterTypes[i] as TypeImpl).hashCode;
    }
    for (int i = 0; i < optionalParameterTypes.length; i++) {
      code = (code << 1) + (optionalParameterTypes[i] as TypeImpl).hashCode;
    }
    for (DartType type in namedParameterTypes) {
      code = (code << 1) + (type as TypeImpl).hashCode;
    }
    return code;
  }

  /**
   * The type arguments that were used to instantiate this function type, if
   * any, otherwise this will return an empty list.
   *
   * Given a function type `f`:
   *
   *     f == f.originalFunction.instantiate(f.instantiatedTypeArguments)
   *
   * Will always hold.
   */
  List<DartType> get instantiatedTypeArguments {
    int typeParameterCount = element.type.boundTypeParameters.length;
    if (typeParameterCount == 0) {
      return DartType.EMPTY_LIST;
    }
    // The substituted types at the end should be our bound type parameters.
    int skipCount = typeArguments.length - typeParameterCount;
    return new List<DartType>.from(typeArguments.skip(skipCount));
  }

  @override
  Map<String, DartType> get namedParameterTypes {
    LinkedHashMap<String, DartType> namedParameterTypes =
        new LinkedHashMap<String, DartType>();
    List<ParameterElement> parameters = baseParameters;
    if (parameters.length == 0) {
      return namedParameterTypes;
    }
    List<DartType> typeParameters =
        TypeParameterTypeImpl.getTypes(this.typeParameters);
    for (ParameterElement parameter in parameters) {
      if (parameter.parameterKind == ParameterKind.NAMED) {
        DartType type = parameter.type;
        if (typeArguments.length != 0 &&
            typeArguments.length == typeParameters.length) {
          type = (type as TypeImpl)
              .substitute2(typeArguments, typeParameters, newPrune);
        } else {
          type = (type as TypeImpl).pruned(newPrune);
        }
        namedParameterTypes[parameter.name] = type;
      }
    }
    return namedParameterTypes;
  }

  /**
   * Determine the new set of typedefs which should be pruned when expanding
   * this function type.
   */
  List<FunctionTypeAliasElement> get newPrune {
    Element element = this.element;
    if (element is FunctionTypeAliasElement && !element.isSynthetic) {
      // This typedef should be pruned, along with anything that was previously
      // pruned.
      if (prunedTypedefs == null) {
        return <FunctionTypeAliasElement>[element];
      } else {
        return new List<FunctionTypeAliasElement>.from(prunedTypedefs)
          ..add(element);
      }
    } else {
      // This is not a typedef, so nothing additional needs to be pruned.
      return prunedTypedefs;
    }
  }

  @override
  List<DartType> get normalParameterTypes {
    List<ParameterElement> parameters = baseParameters;
    if (parameters.length == 0) {
      return DartType.EMPTY_LIST;
    }
    List<DartType> typeParameters =
        TypeParameterTypeImpl.getTypes(this.typeParameters);
    List<DartType> types = new List<DartType>();
    for (ParameterElement parameter in parameters) {
      if (parameter.parameterKind == ParameterKind.REQUIRED) {
        DartType type = parameter.type;
        if (typeArguments.length != 0 &&
            typeArguments.length == typeParameters.length) {
          type = (type as TypeImpl)
              .substitute2(typeArguments, typeParameters, newPrune);
        } else {
          type = (type as TypeImpl).pruned(newPrune);
        }
        types.add(type);
      }
    }
    return types;
  }

  @override
  List<DartType> get optionalParameterTypes {
    List<ParameterElement> parameters = baseParameters;
    if (parameters.length == 0) {
      return DartType.EMPTY_LIST;
    }
    List<DartType> typeParameters =
        TypeParameterTypeImpl.getTypes(this.typeParameters);
    List<DartType> types = new List<DartType>();
    for (ParameterElement parameter in parameters) {
      if (parameter.parameterKind == ParameterKind.POSITIONAL) {
        DartType type = parameter.type;
        if (typeArguments.length != 0 &&
            typeArguments.length == typeParameters.length) {
          type = (type as TypeImpl)
              .substitute2(typeArguments, typeParameters, newPrune);
        } else {
          type = (type as TypeImpl).pruned(newPrune);
        }
        types.add(type);
      }
    }
    return types;
  }

  /**
   * If this is an instantiation of a generic function type, this will get
   * the original function from which it was instantiated.
   *
   * Otherwise, this will return `this`.
   */
  FunctionTypeImpl get originalFunction {
    if (element.type.boundTypeParameters.isEmpty) {
      return this;
    }
    return (element.type as FunctionTypeImpl).substitute2(typeArguments,
        TypeParameterTypeImpl.getTypes(typeParameters), prunedTypedefs);
  }

  @override
  List<ParameterElement> get parameters {
    List<ParameterElement> baseParameters = this.baseParameters;
    // no parameters, quick return
    int parameterCount = baseParameters.length;
    if (parameterCount == 0) {
      return baseParameters;
    }
    // create specialized parameters
    List<ParameterElement> specializedParameters =
        new List<ParameterElement>(parameterCount);
    for (int i = 0; i < parameterCount; i++) {
      specializedParameters[i] = ParameterMember.from(baseParameters[i], this);
    }
    return specializedParameters;
  }

  @override
  DartType get returnType {
    DartType baseReturnType = this.baseReturnType;
    if (baseReturnType == null) {
      // TODO(brianwilkerson) This is a patch. The return type should never be
      // null and we need to understand why it is and fix it.
      return DynamicTypeImpl.instance;
    }
    // If there are no arguments to substitute, or if the arguments size doesn't
    // match the parameter size, return the base return type.
    if (typeArguments.length == 0 ||
        typeArguments.length != typeParameters.length) {
      return (baseReturnType as TypeImpl).pruned(newPrune);
    }
    return (baseReturnType as TypeImpl).substitute2(typeArguments,
        TypeParameterTypeImpl.getTypes(typeParameters), newPrune);
  }

  /**
   * A list containing the actual types of the type arguments.
   */
  List<DartType> get typeArguments => _typeArguments;

  @override
  List<TypeParameterElement> get typeParameters => _typeParameters;

  @override
  bool operator ==(Object object) {
    if (object is! FunctionTypeImpl) {
      return false;
    }
    FunctionTypeImpl otherType = object as FunctionTypeImpl;
    if (boundTypeParameters.length != otherType.boundTypeParameters.length) {
      return false;
    }
    // `<T>T -> T` should be equal to `<U>U -> U`
    // To test this, we instantiate both types with the same (unique) type
    // variables, and see if the result is equal.
    if (boundTypeParameters.isNotEmpty) {
      List<DartType> instantiateTypeArgs = new List<DartType>();
      for (TypeParameterElement e in boundTypeParameters) {
        instantiateTypeArgs.add(new TypeParameterTypeImpl(
            new TypeParameterElementImpl(e.name, -1)));
      }
      // After instantiation, they will no longer have boundTypeParameters,
      // so we will continue below.
      return this.instantiate(instantiateTypeArgs) ==
          otherType.instantiate(instantiateTypeArgs);
    }

    return returnType == otherType.returnType &&
        TypeImpl.equalArrays(
            normalParameterTypes, otherType.normalParameterTypes) &&
        TypeImpl.equalArrays(
            optionalParameterTypes, otherType.optionalParameterTypes) &&
        _equals(namedParameterTypes, otherType.namedParameterTypes);
  }

  @override
  void appendTo(StringBuffer buffer) {
    if (boundTypeParameters.isNotEmpty) {
      // To print a type with type variables, first make sure we have unique
      // variable names to print.
      Set<TypeParameterType> freeVariables = new HashSet<TypeParameterType>();
      _freeVariablesInFunctionType(this, freeVariables);

      Set<String> namesToAvoid = new HashSet<String>();
      for (DartType arg in freeVariables) {
        if (arg is TypeParameterType) {
          namesToAvoid.add(arg.displayName);
        }
      }

      List<DartType> instantiateTypeArgs = new List<DartType>();
      buffer.write("<");
      for (TypeParameterElement e in boundTypeParameters) {
        if (e != boundTypeParameters[0]) {
          buffer.write(",");
        }
        String name = e.name;
        int counter = 0;
        while (!namesToAvoid.add(name)) {
          // Unicode subscript-zero is U+2080, zero is U+0030. Other digits
          // are sequential from there. Thus +0x2050 will get us the subscript.
          String subscript = new String.fromCharCodes(
              counter.toString().codeUnits.map((n) => n + 0x2050));

          name = e.name + subscript;
          counter++;
        }
        TypeParameterTypeImpl t =
            new TypeParameterTypeImpl(new TypeParameterElementImpl(name, -1));
        t.appendTo(buffer);
        instantiateTypeArgs.add(t);
      }
      buffer.write(">");

      // Instantiate it and print the resulting type. After instantiation, it
      // will no longer have boundTypeParameters, so we will continue below.
      this.instantiate(instantiateTypeArgs).appendTo(buffer);
      return;
    }

    List<DartType> normalParameterTypes = this.normalParameterTypes;
    List<DartType> optionalParameterTypes = this.optionalParameterTypes;
    Map<String, DartType> namedParameterTypes = this.namedParameterTypes;
    DartType returnType = this.returnType;
    buffer.write("(");
    bool needsComma = false;
    if (normalParameterTypes.isNotEmpty) {
      for (DartType type in normalParameterTypes) {
        if (needsComma) {
          buffer.write(", ");
        } else {
          needsComma = true;
        }
        (type as TypeImpl).appendTo(buffer);
      }
    }
    if (optionalParameterTypes.isNotEmpty) {
      if (needsComma) {
        buffer.write(", ");
        needsComma = false;
      }
      buffer.write("[");
      for (DartType type in optionalParameterTypes) {
        if (needsComma) {
          buffer.write(", ");
        } else {
          needsComma = true;
        }
        (type as TypeImpl).appendTo(buffer);
      }
      buffer.write("]");
      needsComma = true;
    }
    if (namedParameterTypes.isNotEmpty) {
      if (needsComma) {
        buffer.write(", ");
        needsComma = false;
      }
      buffer.write("{");
      namedParameterTypes.forEach((String name, DartType type) {
        if (needsComma) {
          buffer.write(", ");
        } else {
          needsComma = true;
        }
        buffer.write(name);
        buffer.write(": ");
        (type as TypeImpl).appendTo(buffer);
      });
      buffer.write("}");
      needsComma = true;
    }
    buffer.write(")");
    buffer.write(Element.RIGHT_ARROW);
    if (returnType == null) {
      buffer.write("null");
    } else {
      (returnType as TypeImpl).appendTo(buffer);
    }
  }

  @override
  FunctionTypeImpl instantiate(List<DartType> argumentTypes) {
    if (argumentTypes.length != boundTypeParameters.length) {
      throw new IllegalArgumentException(
          "argumentTypes.length (${argumentTypes.length}) != "
          "boundTypeParameters.length (${boundTypeParameters.length})");
    }
    if (argumentTypes.isEmpty) {
      return this;
    }

    // Given:
    //     {U/T} <S> T -> S
    // Where {U/T} represents the typeArguments (U) and typeParameters (T) list,
    // and <S> represents the boundTypeParameters.
    //
    // Now instantiate([V]), and the result should be:
    //     {U/T, V/S} T -> S.
    List<TypeParameterElement> newTypeParams = typeParameters.toList();
    List<DartType> newTypeArgs = typeArguments.toList();
    newTypeParams.addAll(boundTypeParameters);
    newTypeArgs.addAll(argumentTypes);

    return new FunctionTypeImpl._(element, name, prunedTypedefs, newTypeArgs,
        newTypeParams, TypeParameterElement.EMPTY_LIST);
  }

  @override
  bool isAssignableTo(DartType type) {
    // A function type T may be assigned to a function type S, written T <=> S,
    // iff T <: S.
    return isSubtypeOf(type);
  }

  @override
  bool isMoreSpecificThan(DartType type,
      [bool withDynamic = false, Set<Element> visitedElements]) {
    // Note: visitedElements is only used for breaking recursion in the type
    // hierarchy; we don't use it when recursing into the function type.

    // trivial base cases
    if (type == null) {
      return false;
    } else if (identical(this, type) ||
        type.isDynamic ||
        type.isDartCoreFunction ||
        type.isObject) {
      return true;
    } else if (type is! FunctionType) {
      return false;
    } else if (this == type) {
      return true;
    }
    FunctionType t = this;
    FunctionType s = type as FunctionType;
    List<DartType> tTypes = t.normalParameterTypes;
    List<DartType> tOpTypes = t.optionalParameterTypes;
    List<DartType> sTypes = s.normalParameterTypes;
    List<DartType> sOpTypes = s.optionalParameterTypes;
    // If one function has positional and the other has named parameters,
    // return false.
    if ((sOpTypes.length > 0 && t.namedParameterTypes.length > 0) ||
        (tOpTypes.length > 0 && s.namedParameterTypes.length > 0)) {
      return false;
    }
    // named parameters case
    if (t.namedParameterTypes.length > 0) {
      // check that the number of required parameters are equal, and check that
      // every t_i is more specific than every s_i
      if (t.normalParameterTypes.length != s.normalParameterTypes.length) {
        return false;
      } else if (t.normalParameterTypes.length > 0) {
        for (int i = 0; i < tTypes.length; i++) {
          if (!(tTypes[i] as TypeImpl)
              .isMoreSpecificThan(sTypes[i], withDynamic)) {
            return false;
          }
        }
      }
      Map<String, DartType> namedTypesT = t.namedParameterTypes;
      Map<String, DartType> namedTypesS = s.namedParameterTypes;
      // if k >= m is false, return false: the passed function type has more
      // named parameter types than this
      if (namedTypesT.length < namedTypesS.length) {
        return false;
      }
      // Loop through each element in S verifying that T has a matching
      // parameter name and that the corresponding type is more specific then
      // the type in S.
      for (String keyS in namedTypesS.keys) {
        DartType typeT = namedTypesT[keyS];
        if (typeT == null) {
          return false;
        }
        if (!(typeT as TypeImpl)
            .isMoreSpecificThan(namedTypesS[keyS], withDynamic)) {
          return false;
        }
      }
    } else if (s.namedParameterTypes.length > 0) {
      return false;
    } else {
      // positional parameter case
      int tArgLength = tTypes.length + tOpTypes.length;
      int sArgLength = sTypes.length + sOpTypes.length;
      // Check that the total number of parameters in t is greater than or equal
      // to the number of parameters in s and that the number of required
      // parameters in s is greater than or equal to the number of required
      // parameters in t.
      if (tArgLength < sArgLength || sTypes.length < tTypes.length) {
        return false;
      }
      if (tOpTypes.length == 0 && sOpTypes.length == 0) {
        // No positional arguments, don't copy contents to new array
        for (int i = 0; i < sTypes.length; i++) {
          if (!(tTypes[i] as TypeImpl)
              .isMoreSpecificThan(sTypes[i], withDynamic)) {
            return false;
          }
        }
      } else {
        // Else, we do have positional parameters, copy required and positional
        // parameter types into arrays to do the compare (for loop below).
        List<DartType> tAllTypes = new List<DartType>(sArgLength);
        for (int i = 0; i < tTypes.length; i++) {
          tAllTypes[i] = tTypes[i];
        }
        for (int i = tTypes.length, j = 0; i < sArgLength; i++, j++) {
          tAllTypes[i] = tOpTypes[j];
        }
        List<DartType> sAllTypes = new List<DartType>(sArgLength);
        for (int i = 0; i < sTypes.length; i++) {
          sAllTypes[i] = sTypes[i];
        }
        for (int i = sTypes.length, j = 0; i < sArgLength; i++, j++) {
          sAllTypes[i] = sOpTypes[j];
        }
        for (int i = 0; i < sAllTypes.length; i++) {
          if (!(tAllTypes[i] as TypeImpl)
              .isMoreSpecificThan(sAllTypes[i], withDynamic)) {
            return false;
          }
        }
      }
    }
    DartType tRetType = t.returnType;
    DartType sRetType = s.returnType;
    return sRetType.isVoid ||
        (tRetType as TypeImpl).isMoreSpecificThan(sRetType, withDynamic);
  }

  @override
  bool isSubtypeOf(DartType type) {
    // trivial base cases
    if (type == null) {
      return false;
    } else if (identical(this, type) ||
        type.isDynamic ||
        type.isDartCoreFunction ||
        type.isObject) {
      return true;
    } else if (type is! FunctionType) {
      return false;
    } else if (this == type) {
      return true;
    }
    FunctionType t = this;
    FunctionType s = type as FunctionType;
    List<DartType> tTypes = t.normalParameterTypes;
    List<DartType> tOpTypes = t.optionalParameterTypes;
    List<DartType> sTypes = s.normalParameterTypes;
    List<DartType> sOpTypes = s.optionalParameterTypes;
    // If one function has positional and the other has named parameters,
    // return false.
    if ((sOpTypes.length > 0 && t.namedParameterTypes.length > 0) ||
        (tOpTypes.length > 0 && s.namedParameterTypes.length > 0)) {
      return false;
    }
    // named parameters case
    if (t.namedParameterTypes.length > 0) {
      // check that the number of required parameters are equal,
      // and check that every t_i is assignable to every s_i
      if (t.normalParameterTypes.length != s.normalParameterTypes.length) {
        return false;
      } else if (t.normalParameterTypes.length > 0) {
        for (int i = 0; i < tTypes.length; i++) {
          if (!(tTypes[i] as TypeImpl).isAssignableTo(sTypes[i])) {
            return false;
          }
        }
      }
      Map<String, DartType> namedTypesT = t.namedParameterTypes;
      Map<String, DartType> namedTypesS = s.namedParameterTypes;
      // if k >= m is false, return false: the passed function type has more
      // named parameter types than this
      if (namedTypesT.length < namedTypesS.length) {
        return false;
      }
      // Loop through each element in S verifying that T has a matching
      // parameter name and that the corresponding type is assignable to the
      // type in S.
      for (String keyS in namedTypesS.keys) {
        DartType typeT = namedTypesT[keyS];
        if (typeT == null) {
          return false;
        }
        if (!(typeT as TypeImpl).isAssignableTo(namedTypesS[keyS])) {
          return false;
        }
      }
    } else if (s.namedParameterTypes.length > 0) {
      return false;
    } else {
      // positional parameter case
      int tArgLength = tTypes.length + tOpTypes.length;
      int sArgLength = sTypes.length + sOpTypes.length;
      // Check that the total number of parameters in t is greater than or
      // equal to the number of parameters in s and that the number of
      // required parameters in s is greater than or equal to the number of
      // required parameters in t.
      if (tArgLength < sArgLength || sTypes.length < tTypes.length) {
        return false;
      }
      if (tOpTypes.length == 0 && sOpTypes.length == 0) {
        // No positional arguments, don't copy contents to new array
        for (int i = 0; i < sTypes.length; i++) {
          if (!(tTypes[i] as TypeImpl).isAssignableTo(sTypes[i])) {
            return false;
          }
        }
      } else {
        // Else, we do have positional parameters, copy required and
        // positional parameter types into arrays to do the compare (for loop
        // below).
        List<DartType> tAllTypes = new List<DartType>(sArgLength);
        for (int i = 0; i < tTypes.length; i++) {
          tAllTypes[i] = tTypes[i];
        }
        for (int i = tTypes.length, j = 0; i < sArgLength; i++, j++) {
          tAllTypes[i] = tOpTypes[j];
        }
        List<DartType> sAllTypes = new List<DartType>(sArgLength);
        for (int i = 0; i < sTypes.length; i++) {
          sAllTypes[i] = sTypes[i];
        }
        for (int i = sTypes.length, j = 0; i < sArgLength; i++, j++) {
          sAllTypes[i] = sOpTypes[j];
        }
        for (int i = 0; i < sAllTypes.length; i++) {
          if (!(tAllTypes[i] as TypeImpl).isAssignableTo(sAllTypes[i])) {
            return false;
          }
        }
      }
    }
    DartType tRetType = t.returnType;
    DartType sRetType = s.returnType;
    return sRetType.isVoid || (tRetType as TypeImpl).isAssignableTo(sRetType);
  }

  @override
  TypeImpl pruned(List<FunctionTypeAliasElement> prune) {
    if (prune == null) {
      return this;
    } else if (prune.contains(element)) {
      // Circularity found.  Prune the type declaration.
      return new CircularTypeImpl();
    } else {
      // There should never be a reason to prune a type that has already been
      // pruned, since pruning is only done when expanding a function type
      // alias, and function type aliases are always expanded by starting with
      // base types.
      assert(this.prunedTypedefs == null);
      List<DartType> typeArgs = typeArguments
          .map((TypeImpl t) => t.pruned(prune))
          .toList(growable: false);
      return new FunctionTypeImpl._(element, name, prune, typeArgs,
          _typeParameters, _boundTypeParameters);
    }
  }

  @override
  DartType substitute2(
      List<DartType> argumentTypes, List<DartType> parameterTypes,
      [List<FunctionTypeAliasElement> prune]) {
    // Pruned types should only ever result from performing type variable
    // substitution, and it doesn't make sense to substitute again after
    // substituting once.
    assert(this.prunedTypedefs == null);
    if (argumentTypes.length != parameterTypes.length) {
      throw new IllegalArgumentException(
          "argumentTypes.length (${argumentTypes.length}) != parameterTypes.length (${parameterTypes.length})");
    }
    Element element = this.element;
    if (prune != null && prune.contains(element)) {
      // Circularity found.  Prune the type declaration.
      return new CircularTypeImpl();
    }
    if (argumentTypes.length == 0) {
      return this.pruned(prune);
    }
    List<DartType> typeArgs =
        TypeImpl.substitute(typeArguments, argumentTypes, parameterTypes);
    return new FunctionTypeImpl._(
        element, name, prune, typeArgs, _typeParameters, _boundTypeParameters);
  }

  @override
  FunctionTypeImpl substitute3(List<DartType> argumentTypes) =>
      substitute2(argumentTypes, typeArguments);

  void _freeVariablesInFunctionType(
      FunctionType type, Set<TypeParameterType> free) {
    // Make some fresh variables to avoid capture.
    List<DartType> typeArgs = DartType.EMPTY_LIST;
    if (type.boundTypeParameters.isNotEmpty) {
      typeArgs = new List<DartType>.from(type.boundTypeParameters.map((e) =>
          new TypeParameterTypeImpl(new TypeParameterElementImpl(e.name, -1))));

      type = type.instantiate(typeArgs);
    }

    for (ParameterElement p in type.parameters) {
      _freeVariablesInType(p.type, free);
    }
    _freeVariablesInType(type.returnType, free);

    // Remove all of our bound variables.
    free.removeAll(typeArgs);
  }

  void _freeVariablesInInterfaceType(
      InterfaceType type, Set<TypeParameterType> free) {
    for (DartType typeArg in type.typeArguments) {
      _freeVariablesInType(typeArg, free);
    }
  }

  void _freeVariablesInType(DartType type, Set<TypeParameterType> free) {
    if (type is TypeParameterType) {
      free.add(type);
    } else if (type is FunctionType) {
      _freeVariablesInFunctionType(type, free);
    } else if (type is InterfaceType) {
      _freeVariablesInInterfaceType(type, free);
    }
  }

  /**
   * Compute the least upper bound of types [f] and [g], both of which are
   * known to be function types.
   *
   * In the event that f and g have different numbers of required parameters,
   * `null` is returned, in which case the least upper bound is the interface
   * type `Function`.
   */
  static FunctionType computeLeastUpperBound(FunctionType f, FunctionType g) {
    // TODO(paulberry): implement this.
    return null;
  }

  /**
   * Return `true` if all of the name/type pairs in the first map ([firstTypes])
   * are equal to the corresponding name/type pairs in the second map
   * ([secondTypes]). The maps are expected to iterate over their entries in the
   * same order in which those entries were added to the map.
   */
  static bool _equals(
      Map<String, DartType> firstTypes, Map<String, DartType> secondTypes) {
    if (secondTypes.length != firstTypes.length) {
      return false;
    }
    Iterator<String> firstKeys = firstTypes.keys.iterator;
    Iterator<String> secondKeys = secondTypes.keys.iterator;
    while (firstKeys.moveNext() && secondKeys.moveNext()) {
      String firstKey = firstKeys.current;
      String secondKey = secondKeys.current;
      TypeImpl firstType = firstTypes[firstKey];
      TypeImpl secondType = secondTypes[secondKey];
      if (firstKey != secondKey || firstType != secondType) {
        return false;
      }
    }
    return true;
  }
}

/**
 * An element visitor that will recursively visit all of the elements in an
 * element model (like instances of the class [RecursiveElementVisitor]). In
 * addition, when an element of a specific type is visited not only will the
 * visit method for that specific type of element be invoked, but additional
 * methods for the supertypes of that element will also be invoked. For example,
 * using an instance of this class to visit a [MethodElement] will cause the
 * method [visitMethodElement] to be invoked but will also cause the methods
 * [visitExecutableElement] and [visitElement] to be subsequently invoked. This
 * allows visitors to be written that visit all executable elements without
 * needing to override the visit method for each of the specific subclasses of
 * [ExecutableElement].
 *
 * Note, however, that unlike many visitors, element visitors visit objects
 * based on the interfaces implemented by those elements. Because interfaces
 * form a graph structure rather than a tree structure the way classes do, and
 * because it is generally undesirable for an object to be visited more than
 * once, this class flattens the interface graph into a pseudo-tree. In
 * particular, this class treats elements as if the element types were
 * structured in the following way:
 *
 * <pre>
 * Element
 *   ClassElement
 *   CompilationUnitElement
 *   ExecutableElement
 *       ConstructorElement
 *       LocalElement
 *           FunctionElement
 *       MethodElement
 *       PropertyAccessorElement
 *   ExportElement
 *   HtmlElement
 *   ImportElement
 *   LabelElement
 *   LibraryElement
 *   MultiplyDefinedElement
 *   PrefixElement
 *   TypeAliasElement
 *   TypeParameterElement
 *   UndefinedElement
 *   VariableElement
 *       PropertyInducingElement
 *           FieldElement
 *           TopLevelVariableElement
 *       LocalElement
 *           LocalVariableElement
 *           ParameterElement
 *               FieldFormalParameterElement
 * </pre>
 *
 * Subclasses that override a visit method must either invoke the overridden
 * visit method or explicitly invoke the more general visit method. Failure to
 * do so will cause the visit methods for superclasses of the element to not be
 * invoked and will cause the children of the visited node to not be visited.
 */
class GeneralizingElementVisitor<R> implements ElementVisitor<R> {
  @override
  R visitClassElement(ClassElement element) => visitElement(element);

  @override
  R visitCompilationUnitElement(CompilationUnitElement element) =>
      visitElement(element);

  @override
  R visitConstructorElement(ConstructorElement element) =>
      visitExecutableElement(element);

  R visitElement(Element element) {
    element.visitChildren(this);
    return null;
  }

  @override
  @deprecated
  R visitEmbeddedHtmlScriptElement(EmbeddedHtmlScriptElement element) =>
      visitHtmlScriptElement(element);

  R visitExecutableElement(ExecutableElement element) => visitElement(element);

  @override
  R visitExportElement(ExportElement element) => visitElement(element);

  @override
  @deprecated
  R visitExternalHtmlScriptElement(ExternalHtmlScriptElement element) =>
      visitHtmlScriptElement(element);

  @override
  R visitFieldElement(FieldElement element) =>
      visitPropertyInducingElement(element);

  @override
  R visitFieldFormalParameterElement(FieldFormalParameterElement element) =>
      visitParameterElement(element);

  @override
  R visitFunctionElement(FunctionElement element) => visitLocalElement(element);

  @override
  R visitFunctionTypeAliasElement(FunctionTypeAliasElement element) =>
      visitElement(element);

  @override
  @deprecated
  R visitHtmlElement(HtmlElement element) => visitElement(element);

  @deprecated
  R visitHtmlScriptElement(HtmlScriptElement element) => visitElement(element);

  @override
  R visitImportElement(ImportElement element) => visitElement(element);

  @override
  R visitLabelElement(LabelElement element) => visitElement(element);

  @override
  R visitLibraryElement(LibraryElement element) => visitElement(element);

  R visitLocalElement(LocalElement element) {
    if (element is LocalVariableElement) {
      return visitVariableElement(element);
    } else if (element is ParameterElement) {
      return visitVariableElement(element);
    } else if (element is FunctionElement) {
      return visitExecutableElement(element);
    }
    return null;
  }

  @override
  R visitLocalVariableElement(LocalVariableElement element) =>
      visitLocalElement(element);

  @override
  R visitMethodElement(MethodElement element) =>
      visitExecutableElement(element);

  @override
  R visitMultiplyDefinedElement(MultiplyDefinedElement element) =>
      visitElement(element);

  @override
  R visitParameterElement(ParameterElement element) =>
      visitLocalElement(element);

  @override
  R visitPrefixElement(PrefixElement element) => visitElement(element);

  @override
  R visitPropertyAccessorElement(PropertyAccessorElement element) =>
      visitExecutableElement(element);

  R visitPropertyInducingElement(PropertyInducingElement element) =>
      visitVariableElement(element);

  @override
  R visitTopLevelVariableElement(TopLevelVariableElement element) =>
      visitPropertyInducingElement(element);

  @override
  R visitTypeParameterElement(TypeParameterElement element) =>
      visitElement(element);

  R visitVariableElement(VariableElement element) => visitElement(element);
}

/**
 * A combinator that causes some of the names in a namespace to be hidden when
 * being imported.
 */
abstract class HideElementCombinator implements NamespaceCombinator {
  /**
   * Return a list containing the names that are not to be made visible in the
   * importing library even if they are defined in the imported library.
   */
  List<String> get hiddenNames;
}

/**
 * A concrete implementation of a [HideElementCombinator].
 */
class HideElementCombinatorImpl implements HideElementCombinator {
  /**
   * The names that are not to be made visible in the importing library even if
   * they are defined in the imported library.
   */
  List<String> hiddenNames = StringUtilities.EMPTY_ARRAY;

  @override
  String toString() {
    StringBuffer buffer = new StringBuffer();
    buffer.write("show ");
    int count = hiddenNames.length;
    for (int i = 0; i < count; i++) {
      if (i > 0) {
        buffer.write(", ");
      }
      buffer.write(hiddenNames[i]);
    }
    return buffer.toString();
  }
}

/**
 * An HTML file.
 */
@deprecated
abstract class HtmlElement implements Element {
  /**
   * An empty list of HTML file elements.
   */
  static const List<HtmlElement> EMPTY_LIST = const <HtmlElement>[];

  /**
   * Return a list containing all of the script elements contained in the HTML
   * file. This includes scripts with libraries that are defined by the content
   * of a script tag as well as libraries that are referenced in the `source`
   * attribute of a script tag.
   */
  List<HtmlScriptElement> get scripts;
}

/**
 * A concrete implementation of an [HtmlElement].
 */
@deprecated
class HtmlElementImpl extends ElementImpl implements HtmlElement {
  /**
   * An empty list of HTML file elements.
   */
  @deprecated // Use HtmlElement.EMPTY_LIST
  static const List<HtmlElement> EMPTY_ARRAY = const <HtmlElement>[];

  /**
   * The analysis context in which this library is defined.
   */
  final AnalysisContext context;

  /**
   * The scripts contained in or referenced from script tags in the HTML file.
   */
  List<HtmlScriptElement> _scripts = HtmlScriptElement.EMPTY_LIST;

  /**
   * The source that corresponds to this HTML file.
   */
  Source source;

  /**
   * Initialize a newly created HTML element in the given [context] to have the
   * given [name].
   */
  HtmlElementImpl(this.context, String name) : super(name, -1);

  @override
  int get hashCode => source.hashCode;

  @override
  String get identifier => source.encoding;

  @override
  ElementKind get kind => ElementKind.HTML;

  @override
  List<HtmlScriptElement> get scripts => _scripts;

  /**
   * Set the scripts contained in the HTML file to the given [scripts].
   */
  void set scripts(List<HtmlScriptElement> scripts) {
    if (scripts.length == 0) {
      this._scripts = HtmlScriptElement.EMPTY_LIST;
      return;
    }
    for (HtmlScriptElement script in scripts) {
      (script as HtmlScriptElementImpl).enclosingElement = this;
    }
    this._scripts = scripts;
  }

  @override
  bool operator ==(Object object) {
    if (identical(object, this)) {
      return true;
    }
    return object is HtmlElementImpl && source == object.source;
  }

  @override
  accept(ElementVisitor visitor) => visitor.visitHtmlElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    if (source == null) {
      buffer.write("{HTML file}");
    } else {
      buffer.write(source.fullName);
    }
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    super.visitChildren(visitor);
    safelyVisitChildren(_scripts, visitor);
  }
}

/**
 * A script tag in an HTML file.
 *
 * See [EmbeddedHtmlScriptElement], and [ExternalHtmlScriptElement].
 */
@deprecated
abstract class HtmlScriptElement implements Element {
  /**
   * An empty list of HTML script elements.
   */
  static const List<HtmlScriptElement> EMPTY_LIST = const <HtmlScriptElement>[];
}

/**
 * A concrete implementation of an [HtmlScriptElement].
 */
@deprecated
abstract class HtmlScriptElementImpl extends ElementImpl
    implements HtmlScriptElement {
  /**
   * An empty list of HTML script elements.
   */
  @deprecated // Use HtmlScriptElement.EMPTY_LIST
  static const List<HtmlScriptElement> EMPTY_ARRAY =
      const <HtmlScriptElement>[];

  /**
   * Initialize a newly created script element corresponding to the given
   * [node].
   */
  HtmlScriptElementImpl(XmlTagNode node)
      : super(node.tag, node.tagToken.offset);
}

/**
 * A single import directive within a library.
 */
abstract class ImportElement implements Element, UriReferencedElement {
  /**
   * An empty list of import elements.
   */
  @deprecated // Use ImportElement.EMPTY_LIST
  static const List<ImportElement> EMPTY_ARRAY = const <ImportElement>[];

  /**
   * An empty list of import elements.
   */
  static const List<ImportElement> EMPTY_LIST = const <ImportElement>[];

  /**
   * Return a list containing the combinators that were specified as part of the
   * import directive in the order in which they were specified.
   */
  List<NamespaceCombinator> get combinators;

  /**
   * Return the library that is imported into this library by this import
   * directive.
   */
  LibraryElement get importedLibrary;

  /**
   * Return `true` if this import is for a deferred library.
   */
  bool get isDeferred;

  /**
   * Return the prefix that was specified as part of the import directive, or
   * `null` if there was no prefix specified.
   */
  PrefixElement get prefix;

  /**
   * Return the offset of the prefix of this import in the file that contains
   * this import directive, or `-1` if this import is synthetic, does not have a
   * prefix, or otherwise does not have an offset.
   */
  int get prefixOffset;
}

/**
 * A concrete implementation of an [ImportElement].
 */
class ImportElementImpl extends UriReferencedElementImpl
    implements ImportElement {
  /**
   * The offset of the prefix of this import in the file that contains the this
   * import directive, or `-1` if this import is synthetic.
   */
  int prefixOffset = 0;

  /**
   * The library that is imported into this library by this import directive.
   */
  LibraryElement importedLibrary;

  /**
   * The combinators that were specified as part of the import directive in the
   * order in which they were specified.
   */
  List<NamespaceCombinator> combinators = NamespaceCombinator.EMPTY_LIST;

  /**
   * The prefix that was specified as part of the import directive, or `null` if
   * there was no prefix specified.
   */
  PrefixElement prefix;

  /**
   * Initialize a newly created import element at the given [offset].
   * The offset may be `-1` if the import is synthetic.
   */
  ImportElementImpl(int offset) : super(null, offset);

  /**
   * Set whether this import is for a deferred library.
   */
  void set deferred(bool isDeferred) {
    setModifier(Modifier.DEFERRED, isDeferred);
  }

  @override
  String get identifier =>
      "${(importedLibrary as LibraryElementImpl).identifier}@$nameOffset";

  @override
  bool get isDeferred => hasModifier(Modifier.DEFERRED);

  @override
  ElementKind get kind => ElementKind.IMPORT;

  @override
  accept(ElementVisitor visitor) => visitor.visitImportElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    buffer.write("import ");
    (importedLibrary as LibraryElementImpl).appendTo(buffer);
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    super.visitChildren(visitor);
    safelyVisitChild(prefix, visitor);
  }
}

/**
 * The type introduced by either a class or an interface, or a reference to such
 * a type.
 */
abstract class InterfaceType implements ParameterizedType {
  /**
   * An empty list of types.
   */
  @deprecated // Use InterfaceType.EMPTY_LIST
  static const List<InterfaceType> EMPTY_ARRAY = const <InterfaceType>[];

  /**
   * An empty list of types.
   */
  static const List<InterfaceType> EMPTY_LIST = const <InterfaceType>[];

  /**
   * Return a list containing all of the accessors (getters and setters)
   * declared in this type.
   */
  List<PropertyAccessorElement> get accessors;

  /**
   * Return a list containing all of the constructors declared in this type.
   */
  List<ConstructorElement> get constructors;

  @override
  ClassElement get element;

  /**
   * Return a list containing all of the interfaces that are implemented by this
   * interface. Note that this is <b>not</b>, in general, equivalent to getting
   * the interfaces from this type's element because the types returned by this
   * method will have had their type parameters replaced.
   */
  List<InterfaceType> get interfaces;

  /**
   * Return a list containing all of the methods declared in this type.
   */
  List<MethodElement> get methods;

  /**
   * Return a list containing all of the mixins that are applied to the class
   * being extended in order to derive the superclass of this class. Note that
   * this is <b>not</b>, in general, equivalent to getting the mixins from this
   * type's element because the types returned by this method will have had
   * their type parameters replaced.
   */
  List<InterfaceType> get mixins;

  /**
   * Return the type representing the superclass of this type, or null if this
   * type represents the class 'Object'. Note that this is <b>not</b>, in
   * general, equivalent to getting the superclass from this type's element
   * because the type returned by this method will have had it's type parameters
   * replaced.
   */
  InterfaceType get superclass;

  /**
   * Return the element representing the getter with the given [name] that is
   * declared in this class, or `null` if this class does not declare a getter
   * with the given name.
   */
  PropertyAccessorElement getGetter(String name);

  /**
   * Return the least upper bound of this type and the given [type], or `null`
   * if there is no least upper bound.
   *
   * Given two interfaces <i>I</i> and <i>J</i>, let <i>S<sub>I</sub></i> be the
   * set of superinterfaces of <i>I<i>, let <i>S<sub>J</sub></i> be the set of
   * superinterfaces of <i>J</i> and let <i>S = (I &cup; S<sub>I</sub>) &cap;
   * (J &cup; S<sub>J</sub>)</i>. Furthermore, we define <i>S<sub>n</sub> =
   * {T | T &isin; S &and; depth(T) = n}</i> for any finite <i>n</i>, where
   * <i>depth(T)</i> is the number of steps in the longest inheritance path from
   * <i>T</i> to <i>Object</i>. Let <i>q</i> be the largest number such that
   * <i>S<sub>q</sub></i> has cardinality one. The least upper bound of <i>I</i>
   * and <i>J</i> is the sole element of <i>S<sub>q</sub></i>.
   */
  @override
  @deprecated
  DartType getLeastUpperBound(DartType type);

  /**
   * Return the element representing the method with the given [name] that is
   * declared in this class, or `null` if this class does not declare a method
   * with the given name.
   */
  MethodElement getMethod(String name);

  /**
   * Return the element representing the setter with the given [name] that is
   * declared in this class, or `null` if this class does not declare a setter
   * with the given name.
   */
  PropertyAccessorElement getSetter(String name);

  /**
   * Return `true` if this type is a direct supertype of the given [type]. The
   * implicit interface of class <i>I</i> is a direct supertype of the implicit
   * interface of class <i>J</i> iff:
   *
   * * <i>I</i> is Object, and <i>J</i> has no extends clause.
   * * <i>I</i> is listed in the extends clause of <i>J</i>.
   * * <i>I</i> is listed in the implements clause of <i>J</i>.
   * * <i>I</i> is listed in the with clause of <i>J</i>.
   * * <i>J</i> is a mixin application of the mixin of <i>I</i>.
   */
  bool isDirectSupertypeOf(InterfaceType type);

  /**
   * Return `true` if this type is more specific than the given [type]. An
   * interface type <i>T</i> is more specific than an interface type <i>S</i>,
   * written <i>T &laquo; S</i>, if one of the following conditions is met:
   *
   * * Reflexivity: <i>T</i> is <i>S</i>.
   * * <i>T</i> is bottom.
   * * <i>S</i> is dynamic.
   * * Direct supertype: <i>S</i> is a direct supertype of <i>T</i>.
   * * <i>T</i> is a type parameter and <i>S</i> is the upper bound of <i>T</i>.
   * * Covariance: <i>T</i> is of the form <i>I&lt;T<sub>1</sub>, &hellip;,
   *   T<sub>n</sub>&gt;</i> and S</i> is of the form <i>I&lt;S<sub>1</sub>,
   *   &hellip;, S<sub>n</sub>&gt;</i> and <i>T<sub>i</sub> &laquo;
   *   S<sub>i</sub></i>, <i>1 <= i <= n</i>.
   * * Transitivity: <i>T &laquo; U</i> and <i>U &laquo; S</i>.
   */
  @override
  bool isMoreSpecificThan(DartType type);

  /**
   * Return `true` if this type is a subtype of the given [type]. An interface
   * type <i>T</i> is a subtype of an interface type <i>S</i>, written <i>T</i>
   * <: <i>S</i>, iff <i>[bottom/dynamic]T</i> &laquo; <i>S</i> (<i>T</i> is
   * more specific than <i>S</i>). If an interface type <i>I</i> includes a
   * method named <i>call()</i>, and the type of <i>call()</i> is the function
   * type <i>F</i>, then <i>I</i> is considered to be a subtype of <i>F</i>.
   */
  @override
  bool isSubtypeOf(DartType type);

  /**
   * Return the element representing the constructor that results from looking
   * up the constructor with the given [name] in this class with respect to the
   * given [library], or `null` if the look up fails. The behavior of this
   * method is defined by the Dart Language Specification in section 12.11.1:
   * <blockquote>
   * If <i>e</i> is of the form <b>new</b> <i>T.id()</i> then let <i>q<i> be the
   * constructor <i>T.id</i>, otherwise let <i>q<i> be the constructor <i>T<i>.
   * Otherwise, if <i>q</i> is not defined or not accessible, a
   * NoSuchMethodException is thrown.
   * </blockquote>
   */
  ConstructorElement lookUpConstructor(String name, LibraryElement library);

  /**
   * Return the element representing the getter that results from looking up the
   * getter with the given [name] in this class with respect to the given
   * [library], or `null` if the look up fails. The behavior of this method is
   * defined by the Dart Language Specification in section 12.15.1:
   * <blockquote>
   * The result of looking up getter (respectively setter) <i>m</i> in class
   * <i>C</i> with respect to library <i>L</i> is:
   * * If <i>C</i> declares an instance getter (respectively setter) named
   *   <i>m</i> that is accessible to <i>L</i>, then that getter (respectively
   *   setter) is the result of the lookup. Otherwise, if <i>C</i> has a
   *   superclass <i>S</i>, then the result of the lookup is the result of
   *   looking up getter (respectively setter) <i>m</i> in <i>S</i> with respect
   *   to <i>L</i>. Otherwise, we say that the lookup has failed.
   * </blockquote>
   */
  PropertyAccessorElement lookUpGetter(String name, LibraryElement library);

  /**
   * Return the element representing the getter that results from looking up the
   * getter with the given [name] in the superclass of this class with respect
   * to the given [library], or `null` if the look up fails. The behavior of
   * this method is defined by the Dart Language Specification in section
   * 12.15.1:
   * <blockquote>
   * The result of looking up getter (respectively setter) <i>m</i> in class
   * <i>C</i> with respect to library <i>L</i> is:
   * * If <i>C</i> declares an instance getter (respectively setter) named
   *   <i>m</i> that is accessible to <i>L</i>, then that getter (respectively
   *   setter) is the result of the lookup. Otherwise, if <i>C</i> has a
   *   superclass <i>S</i>, then the result of the lookup is the result of
   *   looking up getter (respectively setter) <i>m</i> in <i>S</i> with respect
   *   to <i>L</i>. Otherwise, we say that the lookup has failed.
   * </blockquote>
   */
  PropertyAccessorElement lookUpGetterInSuperclass(
      String name, LibraryElement library);

  /**
   * Look up the member with the given [name] in this type and all extended
   * and mixed in classes, and by default including [thisType]. If the search
   * fails, this will then search interfaces.
   *
   * Return the element representing the member that was found, or `null` if
   * there is no getter with the given name.
   *
   * The [library] determines if a private member name is visible, and does not
   * need to be supplied for public names.
   */
  PropertyAccessorElement lookUpInheritedGetter(String name,
      {LibraryElement library, bool thisType: true});

  /**
   * Look up the member with the given [name] in this type and all extended
   * and mixed in classes, starting from this type. If the search fails,
   * search interfaces.
   *
   * Return the element representing the member that was found, or `null` if
   * there is no getter with the given name.
   *
   * The [library] determines if a private member name is visible, and does not
   * need to be supplied for public names.
   */
  ExecutableElement lookUpInheritedGetterOrMethod(String name,
      {LibraryElement library});

  /**
   * Look up the member with the given [name] in this type and all extended
   * and mixed in classes, and by default including [thisType]. If the search
   * fails, this will then search interfaces.
   *
   * Return the element representing the member that was found, or `null` if
   * there is no getter with the given name.
   *
   * The [library] determines if a private member name is visible, and does not
   * need to be supplied for public names.
   */
  MethodElement lookUpInheritedMethod(String name,
      {LibraryElement library, bool thisType: true});

  /**
   * Look up the member with the given [name] in this type and all extended
   * and mixed in classes, and by default including [thisType]. If the search
   * fails, this will then search interfaces.
   *
   * Return the element representing the member that was found, or `null` if
   * there is no getter with the given name.
   *
   * The [library] determines if a private member name is visible, and does not
   * need to be supplied for public names.
   */
  PropertyAccessorElement lookUpInheritedSetter(String name,
      {LibraryElement library, bool thisType: true});

  /**
   * Return the element representing the method that results from looking up the
   * method with the given [name] in this class with respect to the given
   * [library], or `null` if the look up fails. The behavior of this method is
   * defined by the Dart Language Specification in section 12.15.1:
   * <blockquote>
   * The result of looking up method <i>m</i> in class <i>C</i> with respect to
   * library <i>L</i> is:
   * * If <i>C</i> declares an instance method named <i>m</i> that is accessible
   *   to <i>L</i>, then that method is the result of the lookup. Otherwise, if
   *   <i>C</i> has a superclass <i>S</i>, then the result of the lookup is the
   *   result of looking up method <i>m</i> in <i>S</i> with respect to <i>L</i>
   *   Otherwise, we say that the lookup has failed.
   * </blockquote>
   */
  MethodElement lookUpMethod(String name, LibraryElement library);

  /**
   * Return the element representing the method that results from looking up the
   * method with the given [name] in the superclass of this class with respect
   * to the given [library], or `null` if the look up fails. The behavior of
   * this method is defined by the Dart Language Specification in section
   * 12.15.1:
   * <blockquote>
   * The result of looking up method <i>m</i> in class <i>C</i> with respect to
   * library <i>L</i> is:
   * * If <i>C</i> declares an instance method named <i>m</i> that is accessible
   *   to <i>L</i>, then that method is the result of the lookup. Otherwise, if
   * <i>C</i> has a superclass <i>S</i>, then the result of the lookup is the
   * result of looking up method <i>m</i> in <i>S</i> with respect to <i>L</i>.
   * Otherwise, we say that the lookup has failed.
   * </blockquote>
   */
  MethodElement lookUpMethodInSuperclass(String name, LibraryElement library);

  /**
   * Return the element representing the setter that results from looking up the
   * setter with the given [name] in this class with respect to the given
   * [library], or `null` if the look up fails. The behavior of this method is
   * defined by the Dart Language Specification in section 12.16:
   * <blockquote>
   * The result of looking up getter (respectively setter) <i>m</i> in class
   * <i>C</i> with respect to library <i>L</i> is:
   * * If <i>C</i> declares an instance getter (respectively setter) named
   *   <i>m</i> that is accessible to <i>L</i>, then that getter (respectively
   *   setter) is the result of the lookup. Otherwise, if <i>C</i> has a
   *   superclass <i>S</i>, then the result of the lookup is the result of
   *   looking up getter (respectively setter) <i>m</i> in <i>S</i> with respect
   *   to <i>L</i>. Otherwise, we say that the lookup has failed.
   * </blockquote>
   */
  PropertyAccessorElement lookUpSetter(String name, LibraryElement library);

  /**
   * Return the element representing the setter that results from looking up the
   * setter with the given [name] in the superclass of this class with respect
   * to the given [library], or `null` if the look up fails. The behavior of
   * this method is defined by the Dart Language Specification in section 12.16:
   * <blockquote>
   * The result of looking up getter (respectively setter) <i>m</i> in class
   * <i>C</i> with respect to library <i>L</i> is:
   * * If <i>C</i> declares an instance getter (respectively setter) named
   *   <i>m</i> that is accessible to <i>L</i>, then that getter (respectively
   *   setter) is the result of the lookup. Otherwise, if <i>C</i> has a
   *   superclass <i>S</i>, then the result of the lookup is the result of
   *   looking up getter (respectively setter) <i>m</i> in <i>S</i> with respect
   *   to <i>L</i>. Otherwise, we say that the lookup has failed.
   * </blockquote>
   */
  PropertyAccessorElement lookUpSetterInSuperclass(
      String name, LibraryElement library);

  @override
  InterfaceType substitute2(
      List<DartType> argumentTypes, List<DartType> parameterTypes);

  // TODO(jmesserly): introduce a new "instantiate" and deprecate this.
  // The new "instantiate" should work similar to FunctionType.instantiate,
  // which uses [boundTypeParameters] to model type parameters that haven't been
  // filled in yet. Those are kept separate from already-substituted type
  // parameters or free variables from the enclosing scopes, which allows nested
  // generics to work, such as a generic method in a generic class.
  /**
   * Return the type resulting from substituting the given arguments for this
   * type's parameters. This is fully equivalent to `substitute2(argumentTypes,
   * getTypeArguments())`.
   */
  InterfaceType substitute4(List<DartType> argumentTypes);

  /**
   * Returns a "smart" version of the "least upper bound" of the given types.
   *
   * If these types have the same element and differ only in terms of the type
   * arguments, attempts to find a compatible set of type arguments.
   *
   * Otherwise, calls [DartType.getLeastUpperBound].
   */
  static InterfaceType getSmartLeastUpperBound(
      InterfaceType first, InterfaceType second) {
    // TODO(paulberry): this needs to be deprecated and replaced with a method
    // in [TypeSystem], since it relies on the deprecated functionality of
    // [DartType.getLeastUpperBound].
    if (first.element == second.element) {
      return _leastUpperBound(first, second);
    }
    return first.getLeastUpperBound(second);
  }

  /**
   * Return the "least upper bound" of the given types under the assumption that
   * the types have the same element and differ only in terms of the type
   * arguments.
   *
   * The resulting type is composed by comparing the corresponding type
   * arguments, keeping those that are the same, and using 'dynamic' for those
   * that are different.
   */
  static InterfaceType _leastUpperBound(
      InterfaceType firstType, InterfaceType secondType) {
    ClassElement firstElement = firstType.element;
    ClassElement secondElement = secondType.element;
    if (firstElement != secondElement) {
      throw new IllegalArgumentException('The same elements expected, but '
          '$firstElement and $secondElement are given.');
    }
    if (firstType == secondType) {
      return firstType;
    }
    List<DartType> firstArguments = firstType.typeArguments;
    List<DartType> secondArguments = secondType.typeArguments;
    int argumentCount = firstArguments.length;
    if (argumentCount == 0) {
      return firstType;
    }
    List<DartType> lubArguments = new List<DartType>(argumentCount);
    for (int i = 0; i < argumentCount; i++) {
      //
      // Ideally we would take the least upper bound of the two argument types,
      // but this can cause an infinite recursion (such as when finding the
      // least upper bound of String and num).
      //
      if (firstArguments[i] == secondArguments[i]) {
        lubArguments[i] = firstArguments[i];
      }
      if (lubArguments[i] == null) {
        lubArguments[i] = DynamicTypeImpl.instance;
      }
    }
    InterfaceTypeImpl lub = new InterfaceTypeImpl(firstElement);
    lub.typeArguments = lubArguments;
    return lub;
  }
}

/**
 * A concrete implementation of an [InterfaceType].
 */
class InterfaceTypeImpl extends TypeImpl implements InterfaceType {
  /**
   * A list containing the actual types of the type arguments.
   */
  List<DartType> typeArguments = DartType.EMPTY_LIST;

  /**
   * The set of typedefs which should not be expanded when exploring this type,
   * to avoid creating infinite types in response to self-referential typedefs.
   */
  final List<FunctionTypeAliasElement> prunedTypedefs;

  /**
   * Initialize a newly created type to be declared by the given [element].
   */
  InterfaceTypeImpl(ClassElement element, [this.prunedTypedefs])
      : super(element, element.displayName);

  /**
   * Initialize a newly created type to be declared by the given [element].
   */
  @deprecated // Use new InterfaceTypeImpl(element)
  InterfaceTypeImpl.con1(ClassElement element)
      : prunedTypedefs = null,
        super(element, element.displayName);

  /**
   * Initialize a newly created type to have the given [name]. This constructor
   * should only be used in cases where there is no declaration of the type.
   */
  @deprecated // Use new InterfaceTypeImpl.named(name)
  InterfaceTypeImpl.con2(String name)
      : prunedTypedefs = null,
        super(null, name);

  /**
   * Initialize a newly created type to have the given [name]. This constructor
   * should only be used in cases where there is no declaration of the type.
   */
  InterfaceTypeImpl.named(String name)
      : prunedTypedefs = null,
        super(null, name);

  /**
   * Private constructor.
   */
  InterfaceTypeImpl._(Element element, String name, this.prunedTypedefs)
      : super(element, name);

  @override
  List<PropertyAccessorElement> get accessors {
    List<PropertyAccessorElement> accessors = element.accessors;
    List<PropertyAccessorElement> members =
        new List<PropertyAccessorElement>(accessors.length);
    for (int i = 0; i < accessors.length; i++) {
      members[i] = PropertyAccessorMember.from(accessors[i], this);
    }
    return members;
  }

  @override
  List<ConstructorElement> get constructors {
    List<ConstructorElement> constructors = element.constructors;
    List<ConstructorElement> members =
        new List<ConstructorElement>(constructors.length);
    for (int i = 0; i < constructors.length; i++) {
      members[i] = ConstructorMember.from(constructors[i], this);
    }
    return members;
  }

  @override
  String get displayName {
    String name = this.name;
    List<DartType> typeArguments = this.typeArguments;
    bool allDynamic = true;
    for (DartType type in typeArguments) {
      if (type != null && !type.isDynamic) {
        allDynamic = false;
        break;
      }
    }
    // If there is at least one non-dynamic type, then list them out
    if (!allDynamic) {
      StringBuffer buffer = new StringBuffer();
      buffer.write(name);
      buffer.write("<");
      for (int i = 0; i < typeArguments.length; i++) {
        if (i != 0) {
          buffer.write(", ");
        }
        DartType typeArg = typeArguments[i];
        buffer.write(typeArg.displayName);
      }
      buffer.write(">");
      name = buffer.toString();
    }
    return name;
  }

  @override
  ClassElement get element => super.element as ClassElement;

  @override
  int get hashCode {
    ClassElement element = this.element;
    if (element == null) {
      return 0;
    }
    return element.hashCode;
  }

  @override
  List<InterfaceType> get interfaces {
    ClassElement classElement = element;
    List<InterfaceType> interfaces = classElement.interfaces;
    List<TypeParameterElement> typeParameters = classElement.typeParameters;
    List<DartType> parameterTypes = classElement.type.typeArguments;
    if (typeParameters.length == 0) {
      return interfaces;
    }
    int count = interfaces.length;
    List<InterfaceType> typedInterfaces = new List<InterfaceType>(count);
    for (int i = 0; i < count; i++) {
      typedInterfaces[i] =
          interfaces[i].substitute2(typeArguments, parameterTypes);
    }
    return typedInterfaces;
  }

  @override
  bool get isDartCoreFunction {
    ClassElement element = this.element;
    if (element == null) {
      return false;
    }
    return element.name == "Function" && element.library.isDartCore;
  }

  @override
  bool get isObject => element.supertype == null;

  @override
  List<MethodElement> get methods {
    List<MethodElement> methods = element.methods;
    List<MethodElement> members = new List<MethodElement>(methods.length);
    for (int i = 0; i < methods.length; i++) {
      members[i] = MethodMember.from(methods[i], this);
    }
    return members;
  }

  @override
  List<InterfaceType> get mixins {
    ClassElement classElement = element;
    List<InterfaceType> mixins = classElement.mixins;
    List<TypeParameterElement> typeParameters = classElement.typeParameters;
    List<DartType> parameterTypes = classElement.type.typeArguments;
    if (typeParameters.length == 0) {
      return mixins;
    }
    int count = mixins.length;
    List<InterfaceType> typedMixins = new List<InterfaceType>(count);
    for (int i = 0; i < count; i++) {
      typedMixins[i] = mixins[i].substitute2(typeArguments, parameterTypes);
    }
    return typedMixins;
  }

  @override
  InterfaceType get superclass {
    ClassElement classElement = element;
    InterfaceType supertype = classElement.supertype;
    if (supertype == null) {
      return null;
    }
    List<DartType> typeParameters = classElement.type.typeArguments;
    if (typeArguments.length == 0 ||
        typeArguments.length != typeParameters.length) {
      return supertype;
    }
    return supertype.substitute2(typeArguments, typeParameters);
  }

  @override
  List<TypeParameterElement> get typeParameters => element.typeParameters;

  @override
  bool operator ==(Object object) {
    if (identical(object, this)) {
      return true;
    }
    if (object is! InterfaceTypeImpl) {
      return false;
    }
    InterfaceTypeImpl otherType = object as InterfaceTypeImpl;
    return (element == otherType.element) &&
        TypeImpl.equalArrays(typeArguments, otherType.typeArguments);
  }

  @override
  void appendTo(StringBuffer buffer) {
    buffer.write(name);
    int argumentCount = typeArguments.length;
    if (argumentCount > 0) {
      buffer.write("<");
      for (int i = 0; i < argumentCount; i++) {
        if (i > 0) {
          buffer.write(", ");
        }
        (typeArguments[i] as TypeImpl).appendTo(buffer);
      }
      buffer.write(">");
    }
  }

  @override
  PropertyAccessorElement getGetter(String getterName) => PropertyAccessorMember
      .from((element as ClassElementImpl).getGetter(getterName), this);

  @override
  @deprecated
  DartType getLeastUpperBound(DartType type) {
    // quick check for self
    if (identical(type, this)) {
      return this;
    }
    // dynamic
    DartType dynamicType = DynamicTypeImpl.instance;
    if (identical(this, dynamicType) || identical(type, dynamicType)) {
      return dynamicType;
    }
    // TODO (jwren) opportunity here for a better, faster algorithm if this
    // turns out to be a bottle-neck
    if (type is! InterfaceType) {
      return null;
    }
    return computeLeastUpperBound(this, type);
  }

  @override
  MethodElement getMethod(String methodName) => MethodMember.from(
      (element as ClassElementImpl).getMethod(methodName), this);

  @override
  PropertyAccessorElement getSetter(String setterName) => PropertyAccessorMember
      .from((element as ClassElementImpl).getSetter(setterName), this);

  @override
  bool isDirectSupertypeOf(InterfaceType type) {
    InterfaceType i = this;
    InterfaceType j = type;
    ClassElement jElement = j.element;
    InterfaceType supertype = jElement.supertype;
    //
    // If J has no direct supertype then it is Object, and Object has no direct
    // supertypes.
    //
    if (supertype == null) {
      return false;
    }
    //
    // I is listed in the extends clause of J.
    //
    List<DartType> jArgs = j.typeArguments;
    List<DartType> jVars = jElement.type.typeArguments;
    supertype = supertype.substitute2(jArgs, jVars);
    if (supertype == i) {
      return true;
    }
    //
    // I is listed in the implements clause of J.
    //
    for (InterfaceType interfaceType in jElement.interfaces) {
      interfaceType = interfaceType.substitute2(jArgs, jVars);
      if (interfaceType == i) {
        return true;
      }
    }
    //
    // I is listed in the with clause of J.
    //
    for (InterfaceType mixinType in jElement.mixins) {
      mixinType = mixinType.substitute2(jArgs, jVars);
      if (mixinType == i) {
        return true;
      }
    }
    //
    // J is a mixin application of the mixin of I.
    //
    // TODO(brianwilkerson) Determine whether this needs to be implemented or
    // whether it is covered by the case above.
    return false;
  }

  @override
  bool isMoreSpecificThan(DartType type,
      [bool withDynamic = false, Set<Element> visitedElements]) {
    //
    // S is dynamic.
    // The test to determine whether S is dynamic is done here because dynamic
    // is not an instance of InterfaceType.
    //
    if (type.isDynamic) {
      return true;
    }
    //
    // A type T is more specific than a type S, written T << S,
    // if one of the following conditions is met:
    //
    // Reflexivity: T is S.
    //
    if (this == type) {
      return true;
    }
    if (type is InterfaceType) {
      //
      // T is bottom. (This case is handled by the class BottomTypeImpl.)
      //
      // Direct supertype: S is a direct supertype of T.
      //
      if (type.isDirectSupertypeOf(this)) {
        return true;
      }
      //
      // Covariance: T is of the form I<T1, ..., Tn> and S is of the form
      // I<S1, ..., Sn> and Ti << Si, 1 <= i <= n.
      //
      ClassElement tElement = this.element;
      ClassElement sElement = type.element;
      if (tElement == sElement) {
        List<DartType> tArguments = typeArguments;
        List<DartType> sArguments = type.typeArguments;
        if (tArguments.length != sArguments.length) {
          return false;
        }
        for (int i = 0; i < tArguments.length; i++) {
          if (!(tArguments[i] as TypeImpl)
              .isMoreSpecificThan(sArguments[i], withDynamic)) {
            return false;
          }
        }
        return true;
      }
    }
    //
    // Transitivity: T << U and U << S.
    //
    // First check for infinite loops
    if (element == null) {
      return false;
    }
    if (visitedElements == null) {
      visitedElements = new HashSet<ClassElement>();
    } else if (visitedElements.contains(element)) {
      return false;
    }
    visitedElements.add(element);
    try {
      // Iterate over all of the types U that are more specific than T because
      // they are direct supertypes of T and return true if any of them are more
      // specific than S.
      InterfaceTypeImpl supertype = superclass;
      if (supertype != null &&
          supertype.isMoreSpecificThan(type, withDynamic, visitedElements)) {
        return true;
      }
      for (InterfaceType interfaceType in interfaces) {
        if ((interfaceType as InterfaceTypeImpl)
            .isMoreSpecificThan(type, withDynamic, visitedElements)) {
          return true;
        }
      }
      for (InterfaceType mixinType in mixins) {
        if ((mixinType as InterfaceTypeImpl)
            .isMoreSpecificThan(type, withDynamic, visitedElements)) {
          return true;
        }
      }
      // If a type I includes an instance method named `call`, and the type of
      // `call` is the function type F, then I is considered to be more specific
      // than F.
      MethodElement callMethod = getMethod('call');
      if (callMethod != null && !callMethod.isStatic) {
        FunctionTypeImpl callType = callMethod.type;
        if (callType.isMoreSpecificThan(type, withDynamic, visitedElements)) {
          return true;
        }
      }
      return false;
    } finally {
      visitedElements.remove(element);
    }
  }

  @override
  ConstructorElement lookUpConstructor(
      String constructorName, LibraryElement library) {
    // prepare base ConstructorElement
    ConstructorElement constructorElement;
    if (constructorName == null) {
      constructorElement = element.unnamedConstructor;
    } else {
      constructorElement = element.getNamedConstructor(constructorName);
    }
    // not found or not accessible
    if (constructorElement == null ||
        !constructorElement.isAccessibleIn(library)) {
      return null;
    }
    // return member
    return ConstructorMember.from(constructorElement, this);
  }

  @override
  PropertyAccessorElement lookUpGetter(
      String getterName, LibraryElement library) {
    PropertyAccessorElement element = getGetter(getterName);
    if (element != null && element.isAccessibleIn(library)) {
      return element;
    }
    return lookUpGetterInSuperclass(getterName, library);
  }

  @override
  PropertyAccessorElement lookUpGetterInSuperclass(
      String getterName, LibraryElement library) {
    for (InterfaceType mixin in mixins.reversed) {
      PropertyAccessorElement element = mixin.getGetter(getterName);
      if (element != null && element.isAccessibleIn(library)) {
        return element;
      }
    }
    HashSet<ClassElement> visitedClasses = new HashSet<ClassElement>();
    InterfaceType supertype = superclass;
    ClassElement supertypeElement =
        supertype == null ? null : supertype.element;
    while (supertype != null && !visitedClasses.contains(supertypeElement)) {
      visitedClasses.add(supertypeElement);
      PropertyAccessorElement element = supertype.getGetter(getterName);
      if (element != null && element.isAccessibleIn(library)) {
        return element;
      }
      for (InterfaceType mixin in supertype.mixins.reversed) {
        element = mixin.getGetter(getterName);
        if (element != null && element.isAccessibleIn(library)) {
          return element;
        }
      }
      supertype = supertype.superclass;
      supertypeElement = supertype == null ? null : supertype.element;
    }
    return null;
  }

  @override
  PropertyAccessorElement lookUpInheritedGetter(String name,
      {LibraryElement library, bool thisType: true}) {
    PropertyAccessorElement result;
    if (thisType) {
      result = lookUpGetter(name, library);
    } else {
      result = lookUpGetterInSuperclass(name, library);
    }
    if (result != null) {
      return result;
    }
    return _lookUpMemberInInterfaces(this, false, library,
        new HashSet<ClassElement>(), (InterfaceType t) => t.getGetter(name));
  }

  @override
  ExecutableElement lookUpInheritedGetterOrMethod(String name,
      {LibraryElement library}) {
    ExecutableElement result =
        lookUpGetter(name, library) ?? lookUpMethod(name, library);

    if (result != null) {
      return result;
    }
    return _lookUpMemberInInterfaces(
        this,
        false,
        library,
        new HashSet<ClassElement>(),
        (InterfaceType t) => t.getGetter(name) ?? t.getMethod(name));
  }

  @override
  MethodElement lookUpInheritedMethod(String name,
      {LibraryElement library, bool thisType: true}) {
    MethodElement result;
    if (thisType) {
      result = lookUpMethod(name, library);
    } else {
      result = lookUpMethodInSuperclass(name, library);
    }
    if (result != null) {
      return result;
    }
    return _lookUpMemberInInterfaces(this, false, library,
        new HashSet<ClassElement>(), (InterfaceType t) => t.getMethod(name));
  }

  @override
  PropertyAccessorElement lookUpInheritedSetter(String name,
      {LibraryElement library, bool thisType: true}) {
    PropertyAccessorElement result;
    if (thisType) {
      result = lookUpSetter(name, library);
    } else {
      result = lookUpSetterInSuperclass(name, library);
    }
    if (result != null) {
      return result;
    }
    return _lookUpMemberInInterfaces(this, false, library,
        new HashSet<ClassElement>(), (t) => t.getSetter(name));
  }

  @override
  MethodElement lookUpMethod(String methodName, LibraryElement library) {
    MethodElement element = getMethod(methodName);
    if (element != null && element.isAccessibleIn(library)) {
      return element;
    }
    return lookUpMethodInSuperclass(methodName, library);
  }

  @override
  MethodElement lookUpMethodInSuperclass(
      String methodName, LibraryElement library) {
    for (InterfaceType mixin in mixins.reversed) {
      MethodElement element = mixin.getMethod(methodName);
      if (element != null && element.isAccessibleIn(library)) {
        return element;
      }
    }
    HashSet<ClassElement> visitedClasses = new HashSet<ClassElement>();
    InterfaceType supertype = superclass;
    ClassElement supertypeElement =
        supertype == null ? null : supertype.element;
    while (supertype != null && !visitedClasses.contains(supertypeElement)) {
      visitedClasses.add(supertypeElement);
      MethodElement element = supertype.getMethod(methodName);
      if (element != null && element.isAccessibleIn(library)) {
        return element;
      }
      for (InterfaceType mixin in supertype.mixins.reversed) {
        element = mixin.getMethod(methodName);
        if (element != null && element.isAccessibleIn(library)) {
          return element;
        }
      }
      supertype = supertype.superclass;
      supertypeElement = supertype == null ? null : supertype.element;
    }
    return null;
  }

  @override
  PropertyAccessorElement lookUpSetter(
      String setterName, LibraryElement library) {
    PropertyAccessorElement element = getSetter(setterName);
    if (element != null && element.isAccessibleIn(library)) {
      return element;
    }
    return lookUpSetterInSuperclass(setterName, library);
  }

  @override
  PropertyAccessorElement lookUpSetterInSuperclass(
      String setterName, LibraryElement library) {
    for (InterfaceType mixin in mixins.reversed) {
      PropertyAccessorElement element = mixin.getSetter(setterName);
      if (element != null && element.isAccessibleIn(library)) {
        return element;
      }
    }
    HashSet<ClassElement> visitedClasses = new HashSet<ClassElement>();
    InterfaceType supertype = superclass;
    ClassElement supertypeElement =
        supertype == null ? null : supertype.element;
    while (supertype != null && !visitedClasses.contains(supertypeElement)) {
      visitedClasses.add(supertypeElement);
      PropertyAccessorElement element = supertype.getSetter(setterName);
      if (element != null && element.isAccessibleIn(library)) {
        return element;
      }
      for (InterfaceType mixin in supertype.mixins.reversed) {
        element = mixin.getSetter(setterName);
        if (element != null && element.isAccessibleIn(library)) {
          return element;
        }
      }
      supertype = supertype.superclass;
      supertypeElement = supertype == null ? null : supertype.element;
    }
    return null;
  }

  @override
  InterfaceTypeImpl pruned(List<FunctionTypeAliasElement> prune) {
    if (prune == null) {
      return this;
    } else {
      // There should never be a reason to prune a type that has already been
      // pruned, since pruning is only done when expanding a function type
      // alias, and function type aliases are always expanded by starting with
      // base types.
      assert(this.prunedTypedefs == null);
      InterfaceTypeImpl result = new InterfaceTypeImpl._(element, name, prune);
      result.typeArguments =
          typeArguments.map((TypeImpl t) => t.pruned(prune)).toList();
      return result;
    }
  }

  @override
  InterfaceTypeImpl substitute2(
      List<DartType> argumentTypes, List<DartType> parameterTypes,
      [List<FunctionTypeAliasElement> prune]) {
    if (argumentTypes.length != parameterTypes.length) {
      throw new IllegalArgumentException(
          "argumentTypes.length (${argumentTypes.length}) != parameterTypes.length (${parameterTypes.length})");
    }
    if (argumentTypes.length == 0 || typeArguments.length == 0) {
      return this.pruned(prune);
    }
    List<DartType> newTypeArguments = TypeImpl.substitute(
        typeArguments, argumentTypes, parameterTypes, prune);
    if (JavaArrays.equals(newTypeArguments, typeArguments)) {
      return this;
    }
    InterfaceTypeImpl newType = new InterfaceTypeImpl(element, prune);
    newType.typeArguments = newTypeArguments;
    return newType;
  }

  @override
  InterfaceTypeImpl substitute4(List<DartType> argumentTypes) =>
      substitute2(argumentTypes, typeArguments);

  /**
   * Compute the least upper bound of types [i] and [j], both of which are
   * known to be interface types.
   *
   * In the event that the algorithm fails (which might occur due to a bug in
   * the analyzer), `null` is returned.
   */
  static InterfaceType computeLeastUpperBound(
      InterfaceType i, InterfaceType j) {
    // compute set of supertypes
    Set<InterfaceType> si = computeSuperinterfaceSet(i);
    Set<InterfaceType> sj = computeSuperinterfaceSet(j);
    // union si with i and sj with j
    si.add(i);
    sj.add(j);
    // compute intersection, reference as set 's'
    List<InterfaceType> s = _intersection(si, sj);
    // for each element in Set s, compute the largest inheritance path to Object
    List<int> depths = new List<int>.filled(s.length, 0);
    int maxDepth = 0;
    for (int n = 0; n < s.length; n++) {
      depths[n] = computeLongestInheritancePathToObject(s[n]);
      if (depths[n] > maxDepth) {
        maxDepth = depths[n];
      }
    }
    // ensure that the currently computed maxDepth is unique,
    // otherwise, decrement and test for uniqueness again
    for (; maxDepth >= 0; maxDepth--) {
      int indexOfLeastUpperBound = -1;
      int numberOfTypesAtMaxDepth = 0;
      for (int m = 0; m < depths.length; m++) {
        if (depths[m] == maxDepth) {
          numberOfTypesAtMaxDepth++;
          indexOfLeastUpperBound = m;
        }
      }
      if (numberOfTypesAtMaxDepth == 1) {
        return s[indexOfLeastUpperBound];
      }
    }
    // Should be impossible--there should always be exactly one type with the
    // maximum depth.
    assert(false);
    return null;
  }

  /**
   * Return the length of the longest inheritance path from the given [type] to
   * Object.
   *
   * See [computeLeastUpperBound].
   */
  static int computeLongestInheritancePathToObject(InterfaceType type) =>
      _computeLongestInheritancePathToObject(
          type, 0, new HashSet<ClassElement>());

  /**
   * Returns the set of all superinterfaces of the given [type].
   *
   * See [computeLeastUpperBound].
   */
  static Set<InterfaceType> computeSuperinterfaceSet(InterfaceType type) =>
      _computeSuperinterfaceSet(type, new HashSet<InterfaceType>());

  /**
   * Return the length of the longest inheritance path from a subtype of the
   * given [type] to Object, where the given [depth] is the length of the
   * longest path from the subtype to this type. The set of [visitedTypes] is
   * used to prevent infinite recursion in the case of a cyclic type structure.
   *
   * See [computeLongestInheritancePathToObject], and [computeLeastUpperBound].
   */
  static int _computeLongestInheritancePathToObject(
      InterfaceType type, int depth, HashSet<ClassElement> visitedTypes) {
    ClassElement classElement = type.element;
    // Object case
    if (classElement.supertype == null || visitedTypes.contains(classElement)) {
      return depth;
    }
    int longestPath = 1;
    try {
      visitedTypes.add(classElement);
      List<InterfaceType> superinterfaces = classElement.interfaces;
      int pathLength;
      if (superinterfaces.length > 0) {
        // loop through each of the superinterfaces recursively calling this
        // method and keeping track of the longest path to return
        for (InterfaceType superinterface in superinterfaces) {
          pathLength = _computeLongestInheritancePathToObject(
              superinterface, depth + 1, visitedTypes);
          if (pathLength > longestPath) {
            longestPath = pathLength;
          }
        }
      }
      // finally, perform this same check on the super type
      // TODO(brianwilkerson) Does this also need to add in the number of mixin
      // classes?
      InterfaceType supertype = classElement.supertype;
      pathLength = _computeLongestInheritancePathToObject(
          supertype, depth + 1, visitedTypes);
      if (pathLength > longestPath) {
        longestPath = pathLength;
      }
    } finally {
      visitedTypes.remove(classElement);
    }
    return longestPath;
  }

  /**
   * Add all of the superinterfaces of the given [type] to the given [set].
   * Return the [set] as a convenience.
   *
   * See [computeSuperinterfaceSet], and [computeLeastUpperBound].
   */
  static Set<InterfaceType> _computeSuperinterfaceSet(
      InterfaceType type, HashSet<InterfaceType> set) {
    Element element = type.element;
    if (element != null) {
      List<InterfaceType> superinterfaces = type.interfaces;
      for (InterfaceType superinterface in superinterfaces) {
        if (set.add(superinterface)) {
          _computeSuperinterfaceSet(superinterface, set);
        }
      }
      InterfaceType supertype = type.superclass;
      if (supertype != null) {
        if (set.add(supertype)) {
          _computeSuperinterfaceSet(supertype, set);
        }
      }
    }
    return set;
  }

  /**
   * Return the intersection of the [first] and [second] sets of types, where
   * intersection is based on the equality of the types themselves.
   */
  static List<InterfaceType> _intersection(
      Set<InterfaceType> first, Set<InterfaceType> second) {
    Set<InterfaceType> result = new HashSet<InterfaceType>.from(first);
    result.retainAll(second);
    return new List.from(result);
  }

  /**
   * Look up the getter with the given [name] in the interfaces
   * implemented by the given [targetType], either directly or indirectly.
   * Return the element representing the getter that was found, or `null` if
   * there is no getter with the given name. The flag [includeTargetType] should
   * be `true` if the search should include the target type. The
   * [visitedInterfaces] is a set containing all of the interfaces that have
   * been examined, used to prevent infinite recursion and to optimize the
   * search.
   */
  static ExecutableElement _lookUpMemberInInterfaces(
      InterfaceType targetType,
      bool includeTargetType,
      LibraryElement library,
      HashSet<ClassElement> visitedInterfaces,
      ExecutableElement getMember(InterfaceType type)) {
    // TODO(brianwilkerson) This isn't correct. Section 8.1.1 of the
    // specification (titled "Inheritance and Overriding" under "Interfaces")
    // describes a much more complex scheme for finding the inherited member.
    // We need to follow that scheme. The code below should cover the 80% case.
    ClassElement targetClass = targetType.element;
    if (!visitedInterfaces.add(targetClass)) {
      return null;
    }
    if (includeTargetType) {
      ExecutableElement member = getMember(targetType);
      if (member != null && member.isAccessibleIn(library)) {
        return member;
      }
    }
    for (InterfaceType interfaceType in targetType.interfaces) {
      ExecutableElement member = _lookUpMemberInInterfaces(
          interfaceType, true, library, visitedInterfaces, getMember);
      if (member != null) {
        return member;
      }
    }
    for (InterfaceType mixinType in targetType.mixins.reversed) {
      ExecutableElement member = _lookUpMemberInInterfaces(
          mixinType, true, library, visitedInterfaces, getMember);
      if (member != null) {
        return member;
      }
    }
    InterfaceType superclass = targetType.superclass;
    if (superclass == null) {
      return null;
    }
    return _lookUpMemberInInterfaces(
        superclass, true, library, visitedInterfaces, getMember);
  }
}

/**
 * A label associated with a statement.
 */
abstract class LabelElement implements Element {
  /**
   * An empty list of label elements.
   */
  static const List<LabelElement> EMPTY_LIST = const <LabelElement>[];

  /**
   * Return the executable element in which this label is defined.
   */
  @override
  ExecutableElement get enclosingElement;
}

/**
 * A concrete implementation of a [LabelElement].
 */
class LabelElementImpl extends ElementImpl implements LabelElement {
  /**
   * An empty list of label elements.
   */
  @deprecated // Use LabelElement.EMPTY_LIST
  static const List<LabelElement> EMPTY_ARRAY = const <LabelElement>[];

  /**
   * A flag indicating whether this label is associated with a `switch`
   * statement.
   */
  // TODO(brianwilkerson) Make this a modifier.
  final bool _onSwitchStatement;

  /**
   * A flag indicating whether this label is associated with a `switch` member
   * (`case` or `default`).
   */
  // TODO(brianwilkerson) Make this a modifier.
  final bool _onSwitchMember;

  /**
   * Initialize a newly created label element to have the given [name].
   * [onSwitchStatement] should be `true` if this label is associated with a
   * `switch` statement and [onSwitchMember] should be `true` if this label is
   * associated with a `switch` member.
   */
  LabelElementImpl(
      Identifier name, this._onSwitchStatement, this._onSwitchMember)
      : super.forNode(name);

  @override
  ExecutableElement get enclosingElement =>
      super.enclosingElement as ExecutableElement;

  /**
   * Return `true` if this label is associated with a `switch` member (`case` or
   * `default`).
   */
  bool get isOnSwitchMember => _onSwitchMember;

  /**
   * Return `true` if this label is associated with a `switch` statement.
   */
  bool get isOnSwitchStatement => _onSwitchStatement;

  @override
  ElementKind get kind => ElementKind.LABEL;

  @override
  accept(ElementVisitor visitor) => visitor.visitLabelElement(this);
}

/**
 * A library.
 */
abstract class LibraryElement implements Element {
  /**
   * An empty list of library elements.
   */
  static const List<LibraryElement> EMPTY_LIST = const <LibraryElement>[];

  /**
   * Return the compilation unit that defines this library.
   */
  CompilationUnitElement get definingCompilationUnit;

  /**
   * Return the entry point for this library, or `null` if this library does not
   * have an entry point. The entry point is defined to be a zero argument
   * top-level function whose name is `main`.
   */
  FunctionElement get entryPoint;

  /**
   * Return a list containing all of the libraries that are exported from this
   * library.
   */
  List<LibraryElement> get exportedLibraries;

  /**
   * The export [Namespace] of this library, `null` if it has not been
   * computed yet.
   */
  Namespace get exportNamespace;

  /**
   * Return a list containing all of the exports defined in this library.
   */
  List<ExportElement> get exports;

  /**
   * Return `true` if the defining compilation unit of this library contains at
   * least one import directive whose URI uses the "dart-ext" scheme.
   */
  bool get hasExtUri;

  /**
   * Return `true` if this library defines a top-level function named
   * `loadLibrary`.
   */
  bool get hasLoadLibraryFunction;

  /**
   * Return a list containing all of the libraries that are imported into this
   * library. This includes all of the libraries that are imported using a
   * prefix (also available through the prefixes returned by [getPrefixes]) and
   * those that are imported without a prefix.
   */
  List<LibraryElement> get importedLibraries;

  /**
   * Return a list containing all of the imports defined in this library.
   */
  List<ImportElement> get imports;

  /**
   * Return `true` if this library is an application that can be run in the
   * browser.
   */
  bool get isBrowserApplication;

  /**
   * Return `true` if this library is the dart:core library.
   */
  bool get isDartCore;

  /**
   * Return `true` if this library is part of the SDK.
   */
  bool get isInSdk;

  /**
   * Return the element representing the synthetic function `loadLibrary` that
   * is implicitly defined for this library if the library is imported using a
   * deferred import.
   */
  FunctionElement get loadLibraryFunction;

  /**
   * Return a list containing all of the compilation units that are included in
   * this library using a `part` directive. This does not include the defining
   * compilation unit that contains the `part` directives.
   */
  List<CompilationUnitElement> get parts;

  /**
   * Return a list containing elements for each of the prefixes used to `import`
   * libraries into this library. Each prefix can be used in more than one
   * `import` directive.
   */
  List<PrefixElement> get prefixes;

  /**
   * The public [Namespace] of this library, `null` if it has not been
   * computed yet.
   */
  Namespace get publicNamespace;

  /**
   * Return a list containing all of the compilation units this library consists
   * of. This includes the defining compilation unit and units included using
   * the `part` directive.
   */
  List<CompilationUnitElement> get units;

  /**
   * Return a list containing all directly and indirectly imported libraries.
   */
  List<LibraryElement> get visibleLibraries;

  /**
   * Return a list containing all of the imports that share the given [prefix],
   * or an empty array if there are no such imports.
   */
  List<ImportElement> getImportsWithPrefix(PrefixElement prefix);

  /**
   * Return the class defined in this library that has the given [name], or
   * `null` if this library does not define a class with the given name.
   */
  ClassElement getType(String className);

  /**
   * Return `true` if this library is up to date with respect to the given
   * [timeStamp]. If any transitively referenced Source is newer than the time
   * stamp, this method returns false.
   */
  bool isUpToDate(int timeStamp);
}

/**
 * A concrete implementation of a [LibraryElement].
 */
class LibraryElementImpl extends ElementImpl implements LibraryElement {
  /**
   * An empty list of library elements.
   */
  @deprecated // Use LibraryElement.EMPTY_LIST
  static const List<LibraryElement> EMPTY_ARRAY = const <LibraryElement>[];

  /**
   * The analysis context in which this library is defined.
   */
  final AnalysisContext context;

  /**
   * The compilation unit that defines this library.
   */
  CompilationUnitElement _definingCompilationUnit;

  /**
   * The entry point for this library, or `null` if this library does not have
   * an entry point.
   */
  FunctionElement entryPoint;

  /**
   * A list containing specifications of all of the imports defined in this
   * library.
   */
  List<ImportElement> _imports = ImportElement.EMPTY_LIST;

  /**
   * A list containing specifications of all of the exports defined in this
   * library.
   */
  List<ExportElement> _exports = ExportElement.EMPTY_LIST;

  /**
   * A list containing the strongly connected component in the import/export
   * graph in which the current library resides.  Computed on demand, null
   * if not present.  If _libraryCycle is set, then the _libraryCycle field
   * for all libraries reachable from this library in the import/export graph
   * is also set.
   */
  List<LibraryElement> _libraryCycle = null;

  /**
   * A list containing all of the compilation units that are included in this
   * library using a `part` directive.
   */
  List<CompilationUnitElement> _parts = CompilationUnitElement.EMPTY_LIST;

  /**
   * The element representing the synthetic function `loadLibrary` that is
   * defined for this library, or `null` if the element has not yet been created.
   */
  FunctionElement _loadLibraryFunction;

  @override
  final int nameLength;

  /**
   * The export [Namespace] of this library, `null` if it has not been
   * computed yet.
   */
  @override
  Namespace exportNamespace;

  /**
   * The public [Namespace] of this library, `null` if it has not been
   * computed yet.
   */
  @override
  Namespace publicNamespace;

  /**
   * Initialize a newly created library element in the given [context] to have
   * the given [name] and [offset].
   */
  LibraryElementImpl(this.context, String name, int offset, this.nameLength)
      : super(name, offset);

  /**
   * Initialize a newly created library element in the given [context] to have
   * the given [name].
   */
  LibraryElementImpl.forNode(this.context, LibraryIdentifier name)
      : super.forNode(name),
        nameLength = name != null ? name.length : 0;

  @override
  CompilationUnitElement get definingCompilationUnit =>
      _definingCompilationUnit;

  /**
   * Set the compilation unit that defines this library to the given compilation
   * [unit].
   */
  void set definingCompilationUnit(CompilationUnitElement unit) {
    assert((unit as CompilationUnitElementImpl).librarySource == unit.source);
    (unit as CompilationUnitElementImpl).enclosingElement = this;
    this._definingCompilationUnit = unit;
  }

  @override
  List<LibraryElement> get exportedLibraries {
    HashSet<LibraryElement> libraries = new HashSet<LibraryElement>();
    for (ExportElement element in _exports) {
      LibraryElement library = element.exportedLibrary;
      if (library != null) {
        libraries.add(library);
      }
    }
    return new List.from(libraries);
  }

  @override
  List<ExportElement> get exports => _exports;

  /**
   * Set the specifications of all of the exports defined in this library to the
   * given list of [exports].
   */
  void set exports(List<ExportElement> exports) {
    for (ExportElement exportElement in exports) {
      (exportElement as ExportElementImpl).enclosingElement = this;
    }
    this._exports = exports;
  }

  @override
  bool get hasExtUri => hasModifier(Modifier.HAS_EXT_URI);

  /**
   * Set whether this library has an import of a "dart-ext" URI.
   */
  void set hasExtUri(bool hasExtUri) {
    setModifier(Modifier.HAS_EXT_URI, hasExtUri);
  }

  @override
  int get hashCode => _definingCompilationUnit.hashCode;

  @override
  bool get hasLoadLibraryFunction {
    if (_definingCompilationUnit.hasLoadLibraryFunction) {
      return true;
    }
    for (int i = 0; i < _parts.length; i++) {
      if (_parts[i].hasLoadLibraryFunction) {
        return true;
      }
    }
    return false;
  }

  @override
  String get identifier => _definingCompilationUnit.source.encoding;

  @override
  List<LibraryElement> get importedLibraries {
    HashSet<LibraryElement> libraries = new HashSet<LibraryElement>();
    for (ImportElement element in _imports) {
      LibraryElement library = element.importedLibrary;
      if (library != null) {
        libraries.add(library);
      }
    }
    return new List.from(libraries);
  }

  @override
  List<ImportElement> get imports => _imports;

  /**
   * Set the specifications of all of the imports defined in this library to the
   * given list of [imports].
   */
  void set imports(List<ImportElement> imports) {
    for (ImportElement importElement in imports) {
      (importElement as ImportElementImpl).enclosingElement = this;
      PrefixElementImpl prefix = importElement.prefix as PrefixElementImpl;
      if (prefix != null) {
        prefix.enclosingElement = this;
      }
    }
    this._imports = imports;
  }

  @override
  bool get isBrowserApplication =>
      entryPoint != null && isOrImportsBrowserLibrary;

  @override
  bool get isDartCore => name == "dart.core";

  @override
  bool get isInSdk =>
      StringUtilities.startsWith5(name, 0, 0x64, 0x61, 0x72, 0x74, 0x2E);

  /**
   * Return `true` if the receiver directly or indirectly imports the
   * 'dart:html' libraries.
   */
  bool get isOrImportsBrowserLibrary {
    List<LibraryElement> visited = new List<LibraryElement>();
    Source htmlLibSource = context.sourceFactory.forUri(DartSdk.DART_HTML);
    visited.add(this);
    for (int index = 0; index < visited.length; index++) {
      LibraryElement library = visited[index];
      Source source = library.definingCompilationUnit.source;
      if (source == htmlLibSource) {
        return true;
      }
      for (LibraryElement importedLibrary in library.importedLibraries) {
        if (!visited.contains(importedLibrary)) {
          visited.add(importedLibrary);
        }
      }
      for (LibraryElement exportedLibrary in library.exportedLibraries) {
        if (!visited.contains(exportedLibrary)) {
          visited.add(exportedLibrary);
        }
      }
    }
    return false;
  }

  @override
  ElementKind get kind => ElementKind.LIBRARY;

  @override
  LibraryElement get library => this;

  List<LibraryElement> get libraryCycle {
    if (_libraryCycle != null) {
      return _libraryCycle;
    }

    // Global counter for this run of the algorithm
    int counter = 0;
    // The discovery times of each library
    Map<LibraryElementImpl, int> indices = {};
    // The set of scc candidates
    Set<LibraryElementImpl> active = new Set();
    // The stack of discovered elements
    List<LibraryElementImpl> stack = [];
    // For a given library that has not yet been processed by this run of the
    // algorithm, compute the strongly connected components.
    int scc(LibraryElementImpl library) {
      int index = counter++;
      int root = index;
      indices[library] = index;
      active.add(library);
      stack.add(library);
      void recurse(LibraryElementImpl child) {
        if (!indices.containsKey(child)) {
          // We haven't visited this child yet, so recurse on the child,
          // returning the lowest numbered node reachable from the child.  If
          // the child can reach a root which is lower numbered than anything
          // we've reached so far, update the root.
          root = min(root, scc(child));
        } else if (active.contains(child)) {
          // The child has been visited, but has not yet been placed into a
          // component.  If the child is higher than anything we've seen so far
          // update the root appropriately.
          root = min(root, indices[child]);
        }
      }
      // Recurse on all of the children in the import/export graph, filtering
      // out those for which library cycles have already been computed.
      library.exportedLibraries
          .where((l) => l._libraryCycle == null)
          .forEach(recurse);
      library.importedLibraries
          .where((l) => l._libraryCycle == null)
          .forEach(recurse);

      if (root == index) {
        // This is the root of a strongly connected component.
        // Pop the elements, and share the component across all
        // of the elements.
        List<LibraryElement> component = <LibraryElement>[];
        LibraryElementImpl cur = null;
        do {
          cur = stack.removeLast();
          active.remove(cur);
          component.add(cur);
          cur._libraryCycle = component;
        } while (cur != library);
      }
      return root;
    }
    scc(library);
    return _libraryCycle;
  }

  @override
  FunctionElement get loadLibraryFunction {
    assert(_loadLibraryFunction != null);
    return _loadLibraryFunction;
  }

  @override
  List<CompilationUnitElement> get parts => _parts;

  /**
   * Set the compilation units that are included in this library using a `part`
   * directive to the given list of [parts].
   */
  void set parts(List<CompilationUnitElement> parts) {
    for (CompilationUnitElement compilationUnit in parts) {
      assert((compilationUnit as CompilationUnitElementImpl).librarySource ==
          source);
      (compilationUnit as CompilationUnitElementImpl).enclosingElement = this;
    }
    this._parts = parts;
  }

  @override
  List<PrefixElement> get prefixes {
    HashSet<PrefixElement> prefixes = new HashSet<PrefixElement>();
    for (ImportElement element in _imports) {
      PrefixElement prefix = element.prefix;
      if (prefix != null) {
        prefixes.add(prefix);
      }
    }
    return new List.from(prefixes);
  }

  @override
  Source get source {
    if (_definingCompilationUnit == null) {
      return null;
    }
    return _definingCompilationUnit.source;
  }

  @override
  List<CompilationUnitElement> get units {
    List<CompilationUnitElement> units = new List<CompilationUnitElement>();
    units.add(_definingCompilationUnit);
    units.addAll(_parts);
    return units;
  }

  @override
  List<LibraryElement> get visibleLibraries {
    Set<LibraryElement> visibleLibraries = new Set();
    _addVisibleLibraries(visibleLibraries, false);
    return new List.from(visibleLibraries);
  }

  @override
  bool operator ==(Object object) => object is LibraryElementImpl &&
      _definingCompilationUnit == object.definingCompilationUnit;

  @override
  accept(ElementVisitor visitor) => visitor.visitLibraryElement(this);

  /**
   * Create the [FunctionElement] to be returned by [loadLibraryFunction],
   * using types provided by [typeProvider].
   */
  void createLoadLibraryFunction(TypeProvider typeProvider) {
    FunctionElementImpl function =
        new FunctionElementImpl(FunctionElement.LOAD_LIBRARY_NAME, -1);
    function.synthetic = true;
    function.enclosingElement = this;
    function.returnType = typeProvider.futureDynamicType;
    function.type = new FunctionTypeImpl(function);
    _loadLibraryFunction = function;
  }

  @override
  ElementImpl getChild(String identifier) {
    if ((_definingCompilationUnit as CompilationUnitElementImpl).identifier ==
        identifier) {
      return _definingCompilationUnit as CompilationUnitElementImpl;
    }
    for (CompilationUnitElement part in _parts) {
      if ((part as CompilationUnitElementImpl).identifier == identifier) {
        return part as CompilationUnitElementImpl;
      }
    }
    for (ImportElement importElement in _imports) {
      if ((importElement as ImportElementImpl).identifier == identifier) {
        return importElement as ImportElementImpl;
      }
    }
    for (ExportElement exportElement in _exports) {
      if ((exportElement as ExportElementImpl).identifier == identifier) {
        return exportElement as ExportElementImpl;
      }
    }
    return null;
  }

  @override
  List<ImportElement> getImportsWithPrefix(PrefixElement prefixElement) {
    int count = _imports.length;
    List<ImportElement> importList = new List<ImportElement>();
    for (int i = 0; i < count; i++) {
      if (identical(_imports[i].prefix, prefixElement)) {
        importList.add(_imports[i]);
      }
    }
    return importList;
  }

  @override
  ClassElement getType(String className) {
    ClassElement type = _definingCompilationUnit.getType(className);
    if (type != null) {
      return type;
    }
    for (CompilationUnitElement part in _parts) {
      type = part.getType(className);
      if (type != null) {
        return type;
      }
    }
    return null;
  }

  /** Given an update to this library which may have added or deleted edges
   * in the import/export graph originating from this node only, remove any
   * cached library cycles in the element model which may have been invalidated.
   */
  void invalidateLibraryCycles() {
    if (_libraryCycle == null) {
      // We have already invalidated this node, or we have never computed
      // library cycle information for it.  In the former case, we're done. In
      // the latter case, this node cannot be reachable from any node for which
      // we have computed library cycle information.  Therefore, any edges added
      // or deleted in the update causing this invalidation can only be edges to
      // nodes which either have no library cycle information (and hence do not
      // need invalidation), or which do not reach this node by any path.
      // In either case, no further invalidation is needed.
      return;
    }
    // If we have pre-computed library cycle information, then we must
    // invalidate the information both on this element, and on certain
    // other elements.  Edges originating at this node may have been
    // added or deleted.  A deleted edge that points outside of this cycle
    // cannot change the cycle information for anything outside of this cycle,
    // and so it is sufficient to delete the cached library information on this
    // cycle.  An added edge which points to another node within the cycle
    // only invalidates the cycle.  An added edge which points to a node earlier
    // in the topological sort of cycles induces no invalidation (since there
    // are by definition no back edges from earlier cycles in the topological
    // order, and hence no possible cycle can have been introduced.  The only
    // remaining case is that we have added an edge to a node which is later
    // in the topological sort of cycles.  This can induce cycles, since it
    // represents a new back edge.  It would be sufficient to invalidate the
    // cycle information for all nodes that are between the target and the
    // node in the topological order.  For simplicity, we simply invalidate
    // all nodes which are reachable from the the source node.
    // Note that in the invalidation phase, we do not cut off when we encounter
    // a node with no library cycle information, since we do not know whether
    // we are in the case where invalidation has already been performed, or we
    // are in the case where library cycles have simply never been computed from
    // a newly reachable node.
    Set<LibraryElementImpl> active = new HashSet();
    void invalidate(LibraryElementImpl library) {
      if (!active.add(library)) return;
      if (library._libraryCycle != null) {
        library._libraryCycle.forEach(invalidate);
        library._libraryCycle = null;
      }
      library.exportedLibraries.forEach(invalidate);
      library.importedLibraries.forEach(invalidate);
    }
    invalidate(this);
  }

  @override
  bool isUpToDate(int timeStamp) {
    Set<LibraryElement> visitedLibraries = new Set();
    return _safeIsUpToDate(this, timeStamp, visitedLibraries);
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    super.visitChildren(visitor);
    safelyVisitChild(_definingCompilationUnit, visitor);
    safelyVisitChildren(_exports, visitor);
    safelyVisitChildren(_imports, visitor);
    safelyVisitChildren(_parts, visitor);
  }

  /**
   * Recursively fills set of visible libraries for
   * [getVisibleElementsLibraries].
   */
  void _addVisibleLibraries(
      Set<LibraryElement> visibleLibraries, bool includeExports) {
    // maybe already processed
    if (!visibleLibraries.add(this)) {
      return;
    }
    // add imported libraries
    for (ImportElement importElement in _imports) {
      LibraryElement importedLibrary = importElement.importedLibrary;
      if (importedLibrary != null) {
        (importedLibrary as LibraryElementImpl)
            ._addVisibleLibraries(visibleLibraries, true);
      }
    }
    // add exported libraries
    if (includeExports) {
      for (ExportElement exportElement in _exports) {
        LibraryElement exportedLibrary = exportElement.exportedLibrary;
        if (exportedLibrary != null) {
          (exportedLibrary as LibraryElementImpl)
              ._addVisibleLibraries(visibleLibraries, true);
        }
      }
    }
  }

  /**
   * Return `true` if the given [library] is up to date with respect to the
   * given [timeStamp]. The set of [visitedLibraries] is used to prevent
   * infinite recusion in the case of mutually dependent libraries.
   */
  static bool _safeIsUpToDate(LibraryElement library, int timeStamp,
      Set<LibraryElement> visitedLibraries) {
    if (!visitedLibraries.contains(library)) {
      visitedLibraries.add(library);
      AnalysisContext context = library.context;
      // Check the defining compilation unit.
      if (timeStamp <
          context
              .getModificationStamp(library.definingCompilationUnit.source)) {
        return false;
      }
      // Check the parted compilation units.
      for (CompilationUnitElement element in library.parts) {
        if (timeStamp < context.getModificationStamp(element.source)) {
          return false;
        }
      }
      // Check the imported libraries.
      for (LibraryElement importedLibrary in library.importedLibraries) {
        if (!_safeIsUpToDate(importedLibrary, timeStamp, visitedLibraries)) {
          return false;
        }
      }
      // Check the exported libraries.
      for (LibraryElement exportedLibrary in library.exportedLibraries) {
        if (!_safeIsUpToDate(exportedLibrary, timeStamp, visitedLibraries)) {
          return false;
        }
      }
    }
    return true;
  }
}

/**
 * An element that can be (but are not required to be) defined within a method
 * or function (an [ExecutableElement]).
 */
abstract class LocalElement implements Element {
  /**
   * Return a source range that covers the approximate portion of the source in
   * which the name of this element is visible, or `null` if there is no single
   * range of characters within which the element name is visible.
   *
   * * For a local variable, this includes everything from the end of the
   *   variable's initializer to the end of the block that encloses the variable
   *   declaration.
   * * For a parameter, this includes the body of the method or function that
   *   declares the parameter.
   * * For a local function, this includes everything from the beginning of the
   *   function's body to the end of the block that encloses the function
   *   declaration.
   * * For top-level functions, `null` will be returned because they are
   *   potentially visible in multiple sources.
   */
  SourceRange get visibleRange;
}

/**
 * A local variable.
 */
abstract class LocalVariableElement implements LocalElement, VariableElement {
  /**
   * An empty list of field elements.
   */
  static const List<LocalVariableElement> EMPTY_LIST =
      const <LocalVariableElement>[];

  /**
   * Return the resolved [VariableDeclaration] node that declares this
   * [LocalVariableElement].
   *
   * This method is expensive, because resolved AST might be evicted from cache,
   * so parsing and resolving will be performed.
   */
  @override
  VariableDeclaration computeNode();
}

/**
 * A concrete implementation of a [LocalVariableElement].
 */
class LocalVariableElementImpl extends VariableElementImpl
    implements LocalVariableElement {
  /**
   * An empty list of field elements.
   */
  @deprecated // Use LocalVariableElement.EMPTY_LIST
  static const List<LocalVariableElement> EMPTY_ARRAY =
      const <LocalVariableElement>[];

  /**
   * The offset to the beginning of the visible range for this element.
   */
  int _visibleRangeOffset = 0;

  /**
   * The length of the visible range for this element, or `-1` if this element
   * does not have a visible range.
   */
  int _visibleRangeLength = -1;

  /**
   * Initialize a newly created method element to have the given [name] and
   * [offset].
   */
  LocalVariableElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created local variable element to have the given [name].
   */
  LocalVariableElementImpl.forNode(Identifier name) : super.forNode(name);

  @override
  String get identifier {
    int enclosingOffset =
        enclosingElement != null ? enclosingElement.nameOffset : 0;
    int delta = nameOffset - enclosingOffset;
    return '${super.identifier}@$delta';
  }

  @override
  bool get isPotentiallyMutatedInClosure =>
      hasModifier(Modifier.POTENTIALLY_MUTATED_IN_CONTEXT);

  @override
  bool get isPotentiallyMutatedInScope =>
      hasModifier(Modifier.POTENTIALLY_MUTATED_IN_SCOPE);

  @override
  ElementKind get kind => ElementKind.LOCAL_VARIABLE;

  @override
  SourceRange get visibleRange {
    if (_visibleRangeLength < 0) {
      return null;
    }
    return new SourceRange(_visibleRangeOffset, _visibleRangeLength);
  }

  @override
  accept(ElementVisitor visitor) => visitor.visitLocalVariableElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    buffer.write(type);
    buffer.write(" ");
    buffer.write(displayName);
  }

  @override
  VariableDeclaration computeNode() =>
      getNodeMatching((node) => node is VariableDeclaration);

  /**
   * Specifies that this variable is potentially mutated somewhere in closure.
   */
  void markPotentiallyMutatedInClosure() {
    setModifier(Modifier.POTENTIALLY_MUTATED_IN_CONTEXT, true);
  }

  /**
   * Specifies that this variable is potentially mutated somewhere in its scope.
   */
  void markPotentiallyMutatedInScope() {
    setModifier(Modifier.POTENTIALLY_MUTATED_IN_SCOPE, true);
  }

  /**
   * Set the visible range for this element to the range starting at the given
   * [offset] with the given [length].
   */
  void setVisibleRange(int offset, int length) {
    _visibleRangeOffset = offset;
    _visibleRangeLength = length;
  }
}

/**
 * An element defined in a parameterized type where the values of the type
 * parameters are known.
 */
abstract class Member implements Element {
  /**
   * The element on which the parameterized element was created.
   */
  final Element _baseElement;

  /**
   * The type in which the element is defined.
   */
  final ParameterizedType _definingType;

  /**
   * Initialize a newly created element to represent a member, based on the
   * [baseElement], defined by the [definingType].
   */
  Member(this._baseElement, this._definingType);

  /**
   * Return the element on which the parameterized element was created.
   */
  Element get baseElement => _baseElement;

  @override
  AnalysisContext get context => _baseElement.context;

  /**
   * Return the type in which the element is defined.
   */
  ParameterizedType get definingType => _definingType;

  @override
  String get displayName => _baseElement.displayName;

  @override
  SourceRange get docRange => _baseElement.docRange;

  int get id => _baseElement.id;

  @override
  bool get isDeprecated => _baseElement.isDeprecated;

  @override
  bool get isOverride => _baseElement.isOverride;

  @override
  bool get isPrivate => _baseElement.isPrivate;

  @override
  bool get isPublic => _baseElement.isPublic;

  @override
  bool get isSynthetic => _baseElement.isSynthetic;

  @override
  ElementKind get kind => _baseElement.kind;

  @override
  LibraryElement get library => _baseElement.library;

  @override
  ElementLocation get location => _baseElement.location;

  @override
  List<ElementAnnotation> get metadata => _baseElement.metadata;

  @override
  String get name => _baseElement.name;

  @override
  int get nameLength => _baseElement.nameLength;

  @override
  int get nameOffset => _baseElement.nameOffset;

  @deprecated
  @override
  AstNode get node => computeNode();

  @override
  Source get source => _baseElement.source;

  @override
  CompilationUnit get unit => _baseElement.unit;

  @override
  String computeDocumentationComment() =>
      _baseElement.computeDocumentationComment();

  @override
  AstNode computeNode() => _baseElement.computeNode();

  @override
  Element getAncestor(Predicate<Element> predicate) =>
      baseElement.getAncestor(predicate);

  @override
  String getExtendedDisplayName(String shortName) =>
      _baseElement.getExtendedDisplayName(shortName);

  @override
  bool isAccessibleIn(LibraryElement library) =>
      _baseElement.isAccessibleIn(library);

  /**
   * If the given [child] is not `null`, use the given [visitor] to visit it.
   */
  void safelyVisitChild(Element child, ElementVisitor visitor) {
    // TODO(brianwilkerson) Make this private
    if (child != null) {
      child.accept(visitor);
    }
  }

  /**
   * Use the given [visitor] to visit all of the [children].
   */
  void safelyVisitChildren(List<Element> children, ElementVisitor visitor) {
    // TODO(brianwilkerson) Make this private
    if (children != null) {
      for (Element child in children) {
        child.accept(visitor);
      }
    }
  }

  /**
   * Return the type that results from replacing the type parameters in the
   * given [type] with the type arguments associated with this member.
   */
  @deprecated
  DartType substituteFor(DartType type) {
    if (type == null) {
      return null;
    }
    List<DartType> argumentTypes = _definingType.typeArguments;
    List<DartType> parameterTypes =
        TypeParameterTypeImpl.getTypes(_definingType.typeParameters);
    return type.substitute2(argumentTypes, parameterTypes);
  }

  /**
   * Return the list of types that results from replacing the type parameters in
   * the given [types] with the type arguments associated with this member.
   */
  @deprecated
  List<InterfaceType> substituteFor2(List<InterfaceType> types) {
    int count = types.length;
    List<InterfaceType> substitutedTypes = new List<InterfaceType>(count);
    for (int i = 0; i < count; i++) {
      substitutedTypes[i] = substituteFor(types[i]);
    }
    return substitutedTypes;
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    // There are no children to visit
  }
}

/**
 * An element that represents a method defined within a type.
 */
abstract class MethodElement implements ClassMemberElement, ExecutableElement {
  /**
   * An empty list of method elements.
   */
  static const List<MethodElement> EMPTY_LIST = const <MethodElement>[];

  /**
   * Return the resolved [MethodDeclaration] node that declares this
   * [MethodElement].
   *
   * This method is expensive, because resolved AST might be evicted from cache,
   * so parsing and resolving will be performed.
   */
  @override
  MethodDeclaration computeNode();
}

/**
 * A concrete implementation of a [MethodElement].
 */
class MethodElementImpl extends ExecutableElementImpl implements MethodElement {
  /**
   * An empty list of method elements.
   */
  @deprecated // Use MethodElement.EMPTY_LIST
  static const List<MethodElement> EMPTY_ARRAY = const <MethodElement>[];

  /**
   * Initialize a newly created method element to have the given [name] at the
   * given [offset].
   */
  MethodElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created method element to have the given [name].
   */
  MethodElementImpl.forNode(Identifier name) : super.forNode(name);

  /**
   * Set whether this method is abstract.
   */
  void set abstract(bool isAbstract) {
    setModifier(Modifier.ABSTRACT, isAbstract);
  }

  @override
  String get displayName {
    String displayName = super.displayName;
    if ("unary-" == displayName) {
      return "-";
    }
    return displayName;
  }

  @override
  ClassElement get enclosingElement => super.enclosingElement as ClassElement;

  @override
  bool get isOperator {
    String name = displayName;
    if (name.isEmpty) {
      return false;
    }
    int first = name.codeUnitAt(0);
    return !((0x61 <= first && first <= 0x7A) ||
        (0x41 <= first && first <= 0x5A) ||
        first == 0x5F ||
        first == 0x24);
  }

  @override
  bool get isStatic => hasModifier(Modifier.STATIC);

  @override
  ElementKind get kind => ElementKind.METHOD;

  @override
  String get name {
    String name = super.name;
    if (isOperator && name == "-") {
      if (parameters.length == 0) {
        return "unary-";
      }
    }
    return super.name;
  }

  /**
   * Set whether this method is static.
   */
  void set static(bool isStatic) {
    setModifier(Modifier.STATIC, isStatic);
  }

  @override
  accept(ElementVisitor visitor) => visitor.visitMethodElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    buffer.write(displayName);
    super.appendTo(buffer);
  }

  @override
  MethodDeclaration computeNode() =>
      getNodeMatching((node) => node is MethodDeclaration);
}

/**
 * A method element defined in a parameterized type where the values of the type
 * parameters are known.
 */
class MethodMember extends ExecutableMember implements MethodElement {
  /**
   * Initialize a newly created element to represent a method, based on the
   * [baseElement], defined by the [definingType]. If [type] is passed, it
   * represents the full type of the member, and will take precedence over
   * the [definingType].
   */
  MethodMember(MethodElement baseElement, InterfaceType definingType,
      [DartType type])
      : super(baseElement, definingType, type);

  @override
  MethodElement get baseElement => super.baseElement as MethodElement;

  @override
  ClassElement get enclosingElement => baseElement.enclosingElement;

  @override
  accept(ElementVisitor visitor) => visitor.visitMethodElement(this);

  @override
  MethodDeclaration computeNode() => baseElement.computeNode();

  @override
  String toString() {
    MethodElement baseElement = this.baseElement;
    List<ParameterElement> parameters = this.parameters;
    FunctionType type = this.type;
    StringBuffer buffer = new StringBuffer();
    buffer.write(baseElement.enclosingElement.displayName);
    buffer.write(".");
    buffer.write(baseElement.displayName);
    buffer.write("(");
    int parameterCount = parameters.length;
    for (int i = 0; i < parameterCount; i++) {
      if (i > 0) {
        buffer.write(", ");
      }
      buffer.write(parameters[i]);
    }
    buffer.write(")");
    if (type != null) {
      buffer.write(Element.RIGHT_ARROW);
      buffer.write(type.returnType);
    }
    return buffer.toString();
  }

  /**
   * If the given [method]'s type is different when any type parameters from the
   * defining type's declaration are replaced with the actual type arguments
   * from the [definingType], create a method member representing the given
   * method. Return the member that was created, or the base method if no member
   * was created.
   */
  static MethodElement from(MethodElement method, InterfaceType definingType) {
    if (method == null || definingType.typeArguments.length == 0) {
      return method;
    }
    FunctionType baseType = method.type;
    List<DartType> argumentTypes = definingType.typeArguments;
    List<DartType> parameterTypes = definingType.element.type.typeArguments;
    FunctionType substitutedType =
        baseType.substitute2(argumentTypes, parameterTypes);
    if (baseType == substitutedType) {
      return method;
    }
    return new MethodMember(method, definingType, substitutedType);
  }
}

/**
 * The enumeration `Modifier` defines constants for all of the modifiers defined
 * by the Dart language and for a few additional flags that are useful.
 */
class Modifier extends Enum<Modifier> {
  /**
   * Indicates that the modifier 'abstract' was applied to the element.
   */
  static const Modifier ABSTRACT = const Modifier('ABSTRACT', 0);

  /**
   * Indicates that an executable element has a body marked as being
   * asynchronous.
   */
  static const Modifier ASYNCHRONOUS = const Modifier('ASYNCHRONOUS', 1);

  /**
   * Indicates that the modifier 'const' was applied to the element.
   */
  static const Modifier CONST = const Modifier('CONST', 2);

  /**
   * Indicates that the import element represents a deferred library.
   */
  static const Modifier DEFERRED = const Modifier('DEFERRED', 3);

  /**
   * Indicates that a class element was defined by an enum declaration.
   */
  static const Modifier ENUM = const Modifier('ENUM', 4);

  /**
   * Indicates that a class element was defined by an enum declaration.
   */
  static const Modifier EXTERNAL = const Modifier('EXTERNAL', 5);

  /**
   * Indicates that the modifier 'factory' was applied to the element.
   */
  static const Modifier FACTORY = const Modifier('FACTORY', 6);

  /**
   * Indicates that the modifier 'final' was applied to the element.
   */
  static const Modifier FINAL = const Modifier('FINAL', 7);

  /**
   * Indicates that an executable element has a body marked as being a
   * generator.
   */
  static const Modifier GENERATOR = const Modifier('GENERATOR', 8);

  /**
   * Indicates that the pseudo-modifier 'get' was applied to the element.
   */
  static const Modifier GETTER = const Modifier('GETTER', 9);

  /**
   * A flag used for libraries indicating that the defining compilation unit
   * contains at least one import directive whose URI uses the "dart-ext"
   * scheme.
   */
  static const Modifier HAS_EXT_URI = const Modifier('HAS_EXT_URI', 10);

  /**
   * Indicates that the associated element did not have an explicit type
   * associated with it. If the element is an [ExecutableElement], then the
   * type being referred to is the return type.
   */
  static const Modifier IMPLICIT_TYPE = const Modifier('IMPLICIT_TYPE', 11);

  /**
   * Indicates that a class can validly be used as a mixin.
   */
  static const Modifier MIXIN = const Modifier('MIXIN', 12);

  /**
   * Indicates that a class is a mixin application.
   */
  static const Modifier MIXIN_APPLICATION =
      const Modifier('MIXIN_APPLICATION', 13);

  /**
   * Indicates that the value of a parameter or local variable might be mutated
   * within the context.
   */
  static const Modifier POTENTIALLY_MUTATED_IN_CONTEXT =
      const Modifier('POTENTIALLY_MUTATED_IN_CONTEXT', 14);

  /**
   * Indicates that the value of a parameter or local variable might be mutated
   * within the scope.
   */
  static const Modifier POTENTIALLY_MUTATED_IN_SCOPE =
      const Modifier('POTENTIALLY_MUTATED_IN_SCOPE', 15);

  /**
   * Indicates that a class contains an explicit reference to 'super'.
   */
  static const Modifier REFERENCES_SUPER =
      const Modifier('REFERENCES_SUPER', 16);

  /**
   * Indicates that the pseudo-modifier 'set' was applied to the element.
   */
  static const Modifier SETTER = const Modifier('SETTER', 17);

  /**
   * Indicates that the modifier 'static' was applied to the element.
   */
  static const Modifier STATIC = const Modifier('STATIC', 18);

  /**
   * Indicates that the element does not appear in the source code but was
   * implicitly created. For example, if a class does not define any
   * constructors, an implicit zero-argument constructor will be created and it
   * will be marked as being synthetic.
   */
  static const Modifier SYNTHETIC = const Modifier('SYNTHETIC', 19);

  static const List<Modifier> values = const [
    ABSTRACT,
    ASYNCHRONOUS,
    CONST,
    DEFERRED,
    ENUM,
    EXTERNAL,
    FACTORY,
    FINAL,
    GENERATOR,
    GETTER,
    HAS_EXT_URI,
    IMPLICIT_TYPE,
    MIXIN,
    MIXIN_APPLICATION,
    POTENTIALLY_MUTATED_IN_CONTEXT,
    POTENTIALLY_MUTATED_IN_SCOPE,
    REFERENCES_SUPER,
    SETTER,
    STATIC,
    SYNTHETIC
  ];

  const Modifier(String name, int ordinal) : super(name, ordinal);
}

/**
 * A pseudo-element that represents multiple elements defined within a single
 * scope that have the same name. This situation is not allowed by the language,
 * so objects implementing this interface always represent an error. As a
 * result, most of the normal operations on elements do not make sense and will
 * return useless results.
 */
abstract class MultiplyDefinedElement implements Element {
  /**
   * Return a list containing all of the elements that were defined within the
   * scope to have the same name.
   */
  List<Element> get conflictingElements;

  /**
   * Return the type of this element as the dynamic type.
   */
  DartType get type;
}

/**
 * A concrete implementation of a [MultiplyDefinedElement].
 */
class MultiplyDefinedElementImpl implements MultiplyDefinedElement {
  /**
   * The unique integer identifier of this element.
   */
  final int id = ElementImpl._NEXT_ID++;

  /**
   * The analysis context in which the multiply defined elements are defined.
   */
  final AnalysisContext context;

  /**
   * The name of the conflicting elements.
   */
  String _name;

  /**
   * A list containing all of the elements that conflict.
   */
  final List<Element> conflictingElements;

  /**
   * Initialize a newly created element in the given [context] to represent a
   * list of [conflictingElements].
   */
  MultiplyDefinedElementImpl(this.context, this.conflictingElements) {
    _name = conflictingElements[0].name;
  }

  @override
  String get displayName => _name;

  @override
  SourceRange get docRange => null;

  @override
  Element get enclosingElement => null;

  @override
  bool get isDeprecated => false;

  @override
  bool get isOverride => false;

  @override
  bool get isPrivate {
    String name = displayName;
    if (name == null) {
      return false;
    }
    return Identifier.isPrivateName(name);
  }

  @override
  bool get isPublic => !isPrivate;

  @override
  bool get isSynthetic => true;

  @override
  ElementKind get kind => ElementKind.ERROR;

  @override
  LibraryElement get library => null;

  @override
  ElementLocation get location => null;

  @override
  List<ElementAnnotation> get metadata => ElementAnnotation.EMPTY_LIST;

  @override
  String get name => _name;

  @override
  int get nameLength => displayName != null ? displayName.length : 0;

  @override
  int get nameOffset => -1;

  @deprecated
  @override
  AstNode get node => null;

  @override
  Source get source => null;

  @override
  DartType get type => DynamicTypeImpl.instance;

  @override
  CompilationUnit get unit => null;

  @override
  accept(ElementVisitor visitor) => visitor.visitMultiplyDefinedElement(this);

  @override
  String computeDocumentationComment() => null;

  @override
  AstNode computeNode() => null;

  @override
  Element getAncestor(Predicate<Element> predicate) => null;

  @override
  String getExtendedDisplayName(String shortName) {
    if (shortName != null) {
      return shortName;
    }
    return displayName;
  }

  @override
  bool isAccessibleIn(LibraryElement library) {
    for (Element element in conflictingElements) {
      if (element.isAccessibleIn(library)) {
        return true;
      }
    }
    return false;
  }

  @override
  String toString() {
    StringBuffer buffer = new StringBuffer();
    buffer.write("[");
    int count = conflictingElements.length;
    for (int i = 0; i < count; i++) {
      if (i > 0) {
        buffer.write(", ");
      }
      (conflictingElements[i] as ElementImpl).appendTo(buffer);
    }
    buffer.write("]");
    return buffer.toString();
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    // There are no children to visit
  }

  /**
   * Return an element in the given [context] that represents the fact that the
   * [firstElement] and [secondElement] conflict. (If the elements are the same,
   * then one of the two will be returned directly.)
   */
  static Element fromElements(
      AnalysisContext context, Element firstElement, Element secondElement) {
    List<Element> conflictingElements =
        _computeConflictingElements(firstElement, secondElement);
    int length = conflictingElements.length;
    if (length == 0) {
      return null;
    } else if (length == 1) {
      return conflictingElements[0];
    }
    return new MultiplyDefinedElementImpl(context, conflictingElements);
  }

  /**
   * Add the given [element] to the list of [elements]. If the element is a
   * multiply-defined element, add all of the conflicting elements that it
   * represents.
   */
  static void _add(HashSet<Element> elements, Element element) {
    if (element is MultiplyDefinedElementImpl) {
      for (Element conflictingElement in element.conflictingElements) {
        elements.add(conflictingElement);
      }
    } else {
      elements.add(element);
    }
  }

  /**
   * Use the given elements to construct a list of conflicting elements. If
   * either the [firstElement] or [secondElement] are multiply-defined elements
   * then the conflicting elements they represent will be included in the array.
   * Otherwise, the element itself will be included.
   */
  static List<Element> _computeConflictingElements(
      Element firstElement, Element secondElement) {
    HashSet<Element> elements = new HashSet<Element>();
    _add(elements, firstElement);
    _add(elements, secondElement);
    return new List.from(elements);
  }
}

/**
 * An [ExecutableElement], with the additional information of a list of
 * [ExecutableElement]s from which this element was composed.
 */
abstract class MultiplyInheritedExecutableElement implements ExecutableElement {
  /**
   * Return a list containing all of the executable elements defined within this
   * executable element.
   */
  List<ExecutableElement> get inheritedElements;
}

/**
 * A [MethodElementImpl], with the additional information of a list of
 * [ExecutableElement]s from which this element was composed.
 */
class MultiplyInheritedMethodElementImpl extends MethodElementImpl
    implements MultiplyInheritedExecutableElement {
  /**
   * A list the array of executable elements that were used to compose this
   * element.
   */
  List<ExecutableElement> _elements = MethodElement.EMPTY_LIST;

  MultiplyInheritedMethodElementImpl(Identifier name) : super.forNode(name) {
    synthetic = true;
  }

  @override
  List<ExecutableElement> get inheritedElements => _elements;

  void set inheritedElements(List<ExecutableElement> elements) {
    this._elements = elements;
  }
}

/**
 * A [PropertyAccessorElementImpl], with the additional information of a list of
 * [ExecutableElement]s from which this element was composed.
 */
class MultiplyInheritedPropertyAccessorElementImpl
    extends PropertyAccessorElementImpl
    implements MultiplyInheritedExecutableElement {
  /**
   * A list the array of executable elements that were used to compose this
   * element.
   */
  List<ExecutableElement> _elements = PropertyAccessorElement.EMPTY_LIST;

  MultiplyInheritedPropertyAccessorElementImpl(Identifier name)
      : super.forNode(name) {
    synthetic = true;
  }

  @override
  List<ExecutableElement> get inheritedElements => _elements;

  void set inheritedElements(List<ExecutableElement> elements) {
    this._elements = elements;
  }
}

/**
 * An object that controls how namespaces are combined.
 */
abstract class NamespaceCombinator {
  /**
   * An empty list of namespace combinators.
   */
  @deprecated // Use NamespaceCombinator.EMPTY_LIST
  static const List<NamespaceCombinator> EMPTY_ARRAY =
      const <NamespaceCombinator>[];

  /**
   * An empty list of namespace combinators.
   */
  static const List<NamespaceCombinator> EMPTY_LIST =
      const <NamespaceCombinator>[];
}

/**
 * A parameter defined within an executable element.
 */
abstract class ParameterElement
    implements LocalElement, VariableElement, ConstantEvaluationTarget {
  /**
   * An empty list of parameter elements.
   */
  static const List<ParameterElement> EMPTY_LIST = const <ParameterElement>[];

  /**
   * Return the Dart code of the default value, or `null` if no default value.
   */
  String get defaultValueCode;

  /**
   * Return `true` if this parameter is an initializing formal parameter.
   */
  bool get isInitializingFormal;

  /**
   * Return the kind of this parameter.
   */
  ParameterKind get parameterKind;

  /**
   * Return a list containing all of the parameters defined by this parameter.
   * A parameter will only define other parameters if it is a function typed
   * parameter.
   */
  List<ParameterElement> get parameters;

  /**
   * Return a list containing all of the type parameters defined by this
   * parameter. A parameter will only define other parameters if it is a
   * function typed parameter.
   */
  List<TypeParameterElement> get typeParameters;

  /**
   * Append the type, name and possibly the default value of this parameter to
   * the given [buffer].
   */
  void appendToWithoutDelimiters(StringBuffer buffer);

  @override
  FormalParameter computeNode();
}

/**
 * A concrete implementation of a [ParameterElement].
 */
class ParameterElementImpl extends VariableElementImpl
    with ParameterElementMixin
    implements ParameterElement {
  /**
   * An empty list of parameter elements.
   */
  @deprecated // Use ParameterElement.EMPTY_LIST
  static const List<ParameterElement> EMPTY_ARRAY = const <ParameterElement>[];

  /**
   * A list containing all of the parameters defined by this parameter element.
   * There will only be parameters if this parameter is a function typed
   * parameter.
   */
  List<ParameterElement> _parameters = ParameterElement.EMPTY_LIST;

  /**
   * A list containing all of the type parameters defined for this parameter
   * element. There will only be parameters if this parameter is a function
   * typed parameter.
   */
  List<TypeParameterElement> _typeParameters = TypeParameterElement.EMPTY_LIST;

  /**
   * The kind of this parameter.
   */
  ParameterKind parameterKind;

  /**
   * The Dart code of the default value.
   */
  String _defaultValueCode;

  /**
   * The offset to the beginning of the visible range for this element.
   */
  int _visibleRangeOffset = 0;

  /**
   * The length of the visible range for this element, or `-1` if this element
   * does not have a visible range.
   */
  int _visibleRangeLength = -1;

  /**
   * Initialize a newly created parameter element to have the given [name] and
   * [offset].
   */
  ParameterElementImpl(String name, int nameOffset) : super(name, nameOffset);

  /**
   * Initialize a newly created parameter element to have the given [name].
   */
  ParameterElementImpl.forNode(Identifier name) : super.forNode(name);

  @override
  String get defaultValueCode => _defaultValueCode;

  /**
   * Set Dart code of the default value.
   */
  void set defaultValueCode(String defaultValueCode) {
    this._defaultValueCode = StringUtilities.intern(defaultValueCode);
  }

  @override
  bool get isInitializingFormal => false;

  @override
  bool get isPotentiallyMutatedInClosure =>
      hasModifier(Modifier.POTENTIALLY_MUTATED_IN_CONTEXT);

  @override
  bool get isPotentiallyMutatedInScope =>
      hasModifier(Modifier.POTENTIALLY_MUTATED_IN_SCOPE);

  @override
  ElementKind get kind => ElementKind.PARAMETER;

  @override
  List<ParameterElement> get parameters => _parameters;

  /**
   * Set the parameters defined by this executable element to the given
   * [parameters].
   */
  void set parameters(List<ParameterElement> parameters) {
    for (ParameterElement parameter in parameters) {
      (parameter as ParameterElementImpl).enclosingElement = this;
    }
    this._parameters = parameters;
  }

  @override
  List<TypeParameterElement> get typeParameters => _typeParameters;

  /**
   * Set the type parameters defined by this parameter element to the given
   * [typeParameters].
   */
  void set typeParameters(List<TypeParameterElement> typeParameters) {
    for (TypeParameterElement parameter in typeParameters) {
      (parameter as TypeParameterElementImpl).enclosingElement = this;
    }
    this._typeParameters = typeParameters;
  }

  @override
  SourceRange get visibleRange {
    if (_visibleRangeLength < 0) {
      return null;
    }
    return new SourceRange(_visibleRangeOffset, _visibleRangeLength);
  }

  @override
  accept(ElementVisitor visitor) => visitor.visitParameterElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    String left = "";
    String right = "";
    while (true) {
      if (parameterKind == ParameterKind.NAMED) {
        left = "{";
        right = "}";
      } else if (parameterKind == ParameterKind.POSITIONAL) {
        left = "[";
        right = "]";
      } else if (parameterKind == ParameterKind.REQUIRED) {}
      break;
    }
    buffer.write(left);
    appendToWithoutDelimiters(buffer);
    buffer.write(right);
  }

  @override
  FormalParameter computeNode() =>
      getNodeMatching((node) => node is FormalParameter);

  @override
  ElementImpl getChild(String identifier) {
    for (ParameterElement parameter in _parameters) {
      if ((parameter as ParameterElementImpl).identifier == identifier) {
        return parameter as ParameterElementImpl;
      }
    }
    return null;
  }

  /**
   * Specifies that this variable is potentially mutated somewhere in closure.
   */
  void markPotentiallyMutatedInClosure() {
    setModifier(Modifier.POTENTIALLY_MUTATED_IN_CONTEXT, true);
  }

  /**
   * Specifies that this variable is potentially mutated somewhere in its scope.
   */
  void markPotentiallyMutatedInScope() {
    setModifier(Modifier.POTENTIALLY_MUTATED_IN_SCOPE, true);
  }

  /**
   * Set the visible range for this element to the range starting at the given
   * [offset] with the given [length].
   */
  void setVisibleRange(int offset, int length) {
    _visibleRangeOffset = offset;
    _visibleRangeLength = length;
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    super.visitChildren(visitor);
    safelyVisitChildren(_parameters, visitor);
  }
}

/**
 * A mixin that provides a common implementation for methods defined in
 * [ParameterElement].
 */
abstract class ParameterElementMixin implements ParameterElement {
  @override
  void appendToWithoutDelimiters(StringBuffer buffer) {
    buffer.write(type);
    buffer.write(" ");
    buffer.write(displayName);
    if (defaultValueCode != null) {
      if (parameterKind == ParameterKind.NAMED) {
        buffer.write(": ");
      }
      if (parameterKind == ParameterKind.POSITIONAL) {
        buffer.write(" = ");
      }
      buffer.write(defaultValueCode);
    }
  }
}

/**
 * A type with type parameters, such as a class or function type alias.
 */
abstract class ParameterizedType implements DartType {
  /**
   * Return a list containing the actual types of the type arguments. If this
   * type's element does not have type parameters, then the array should be
   * empty (although it is possible for type arguments to be erroneously
   * declared). If the element has type parameters and the actual type does not
   * explicitly include argument values, then the type "dynamic" will be
   * automatically provided.
   */
  List<DartType> get typeArguments;

  /**
   * Return a list containing all of the type parameters declared for this type.
   */
  List<TypeParameterElement> get typeParameters;
}

/**
 * A parameter element defined in a parameterized type where the values of the
 * type parameters are known.
 */
class ParameterMember extends VariableMember
    with ParameterElementMixin
    implements ParameterElement {
  /**
   * Initialize a newly created element to represent a parameter, based on the
   * [baseElement], defined by the [definingType]. If [type] is passed it will
   * represent the already substituted type.
   */
  ParameterMember(ParameterElement baseElement, ParameterizedType definingType,
      [DartType type])
      : super._(baseElement, definingType, type);

  @override
  ParameterElement get baseElement => super.baseElement as ParameterElement;

  @override
  String get defaultValueCode => baseElement.defaultValueCode;

  @override
  Element get enclosingElement => baseElement.enclosingElement;

  @override
  int get hashCode => baseElement.hashCode;

  @override
  bool get isInitializingFormal => baseElement.isInitializingFormal;

  @override
  ParameterKind get parameterKind => baseElement.parameterKind;

  @override
  List<ParameterElement> get parameters {
    DartType type = this.type;
    if (type is FunctionType) {
      return type.parameters;
    }
    return ParameterElement.EMPTY_LIST;
  }

  @override
  List<TypeParameterElement> get typeParameters => baseElement.typeParameters;

  @override
  SourceRange get visibleRange => baseElement.visibleRange;

  // TODO(jmesserly): this equality is broken. It should consider the defining
  // type as well, otherwise we're dropping the substitution.
  @override
  bool operator ==(Object object) =>
      object is ParameterMember && baseElement == object.baseElement;

  @override
  accept(ElementVisitor visitor) => visitor.visitParameterElement(this);

  @override
  FormalParameter computeNode() => baseElement.computeNode();

  @override
  Element getAncestor(Predicate<Element> predicate) {
    Element element = baseElement.getAncestor(predicate);
    ParameterizedType definingType = this.definingType;
    if (definingType is InterfaceType) {
      InterfaceType definingInterfaceType = definingType;
      if (element is ConstructorElement) {
        return ConstructorMember.from(element, definingInterfaceType);
      } else if (element is MethodElement) {
        return MethodMember.from(element, definingInterfaceType);
      } else if (element is PropertyAccessorElement) {
        return PropertyAccessorMember.from(element, definingInterfaceType);
      }
    }
    return element;
  }

  @override
  String toString() {
    ParameterElement baseElement = this.baseElement;
    String left = "";
    String right = "";
    while (true) {
      if (baseElement.parameterKind == ParameterKind.NAMED) {
        left = "{";
        right = "}";
      } else if (baseElement.parameterKind == ParameterKind.POSITIONAL) {
        left = "[";
        right = "]";
      } else if (baseElement.parameterKind == ParameterKind.REQUIRED) {}
      break;
    }
    return '$left$type ${baseElement.displayName}$right';
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    super.visitChildren(visitor);
    safelyVisitChildren(parameters, visitor);
  }

  /**
   * If the given [parameter]'s type is different when any type parameters from
   * the defining type's declaration are replaced with the actual type
   * arguments from the [definingType], create a parameter member representing
   * the given parameter. Return the member that was created, or the base
   * parameter if no member was created.
   */
  static ParameterElement from(
      ParameterElement parameter, ParameterizedType definingType) {
    if (parameter == null || definingType.typeArguments.length == 0) {
      return parameter;
    }
    // Check if parameter type depends on defining type type arguments.
    // It is possible that we did not resolve field formal parameter yet,
    // so skip this check for it.
    if (parameter is FieldFormalParameterElement) {
      return new FieldFormalParameterMember(parameter, definingType);
    } else {
      DartType baseType = parameter.type;
      List<DartType> argumentTypes = definingType.typeArguments;
      List<DartType> parameterTypes =
          TypeParameterTypeImpl.getTypes(definingType.typeParameters);
      DartType substitutedType =
          baseType.substitute2(argumentTypes, parameterTypes);
      if (baseType == substitutedType) {
        return parameter;
      }
      return new ParameterMember(parameter, definingType, substitutedType);
    }
  }
}

/**
 * A prefix used to import one or more libraries into another library.
 */
abstract class PrefixElement implements Element {
  /**
   * An empty list of prefix elements.
   */
  static const List<PrefixElement> EMPTY_LIST = const <PrefixElement>[];

  /**
   * Return the library into which other libraries are imported using this
   * prefix.
   */
  @override
  LibraryElement get enclosingElement;

  /**
   * Return a list containing all of the libraries that are imported using this
   * prefix.
   */
  List<LibraryElement> get importedLibraries;
}

/**
 * A concrete implementation of a [PrefixElement].
 */
class PrefixElementImpl extends ElementImpl implements PrefixElement {
  /**
   * An empty list of prefix elements.
   */
  @deprecated // Use PrefixElement.EMPTY_LIST
  static const List<PrefixElement> EMPTY_ARRAY = const <PrefixElement>[];

  /**
   * A list containing all of the libraries that are imported using this prefix.
   */
  List<LibraryElement> _importedLibraries = LibraryElement.EMPTY_LIST;

  /**
   * Initialize a newly created method element to have the given [name] and
   * [offset].
   */
  PrefixElementImpl(String name, int nameOffset) : super(name, nameOffset);

  /**
   * Initialize a newly created prefix element to have the given [name].
   */
  PrefixElementImpl.forNode(Identifier name) : super.forNode(name);

  @override
  LibraryElement get enclosingElement =>
      super.enclosingElement as LibraryElement;

  @override
  String get identifier => "_${super.identifier}";

  @override
  List<LibraryElement> get importedLibraries => _importedLibraries;

  /**
   * Set the libraries that are imported using this prefix to the given
   * [libraries].
   */
  void set importedLibraries(List<LibraryElement> libraries) {
    for (LibraryElement library in libraries) {
      (library as LibraryElementImpl).enclosingElement = this;
    }
    _importedLibraries = libraries;
  }

  @override
  ElementKind get kind => ElementKind.PREFIX;

  @override
  accept(ElementVisitor visitor) => visitor.visitPrefixElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    buffer.write("as ");
    super.appendTo(buffer);
  }
}

/**
 * A getter or a setter. Note that explicitly defined property accessors
 * implicitly define a synthetic field. Symmetrically, synthetic accessors are
 * implicitly created for explicitly defined fields. The following rules apply:
 *
 * * Every explicit field is represented by a non-synthetic [FieldElement].
 * * Every explicit field induces a getter and possibly a setter, both of which
 *   are represented by synthetic [PropertyAccessorElement]s.
 * * Every explicit getter or setter is represented by a non-synthetic
 *   [PropertyAccessorElement].
 * * Every explicit getter or setter (or pair thereof if they have the same
 *   name) induces a field that is represented by a synthetic [FieldElement].
 */
abstract class PropertyAccessorElement implements ExecutableElement {
  /**
   * An empty list of property accessor elements.
   */
  static const List<PropertyAccessorElement> EMPTY_LIST =
      const <PropertyAccessorElement>[];

  /**
   * Return the accessor representing the getter that corresponds to (has the
   * same name as) this setter, or `null` if this accessor is not a setter or if
   * there is no corresponding getter.
   */
  PropertyAccessorElement get correspondingGetter;

  /**
   * Return the accessor representing the setter that corresponds to (has the
   * same name as) this getter, or `null` if this accessor is not a getter or if
   * there is no corresponding setter.
   */
  PropertyAccessorElement get correspondingSetter;

  /**
   * Return `true` if this accessor represents a getter.
   */
  bool get isGetter;

  /**
   * Return `true` if this accessor represents a setter.
   */
  bool get isSetter;

  /**
   * Return the field or top-level variable associated with this accessor. If
   * this accessor was explicitly defined (is not synthetic) then the variable
   * associated with it will be synthetic.
   */
  PropertyInducingElement get variable;
}

/**
 * A concrete implementation of a [PropertyAccessorElement].
 */
class PropertyAccessorElementImpl extends ExecutableElementImpl
    implements PropertyAccessorElement {
  /**
   * An empty list of property accessor elements.
   */
  @deprecated // Use PropertyAccessorElement.EMPTY_LIST
  static const List<PropertyAccessorElement> EMPTY_ARRAY =
      const <PropertyAccessorElement>[];

  /**
   * The variable associated with this accessor.
   */
  PropertyInducingElement variable;

  /**
   * Initialize a newly created property accessor element to have the given
   * [name].
   */
  PropertyAccessorElementImpl.forNode(Identifier name) : super.forNode(name);

  /**
   * Initialize a newly created synthetic property accessor element to be
   * associated with the given [variable].
   */
  PropertyAccessorElementImpl.forVariable(PropertyInducingElementImpl variable)
      : super(variable.name, variable.nameOffset) {
    this.variable = variable;
    static = variable.isStatic;
    synthetic = true;
  }

  /**
   * Set whether this accessor is abstract.
   */
  void set abstract(bool isAbstract) {
    setModifier(Modifier.ABSTRACT, isAbstract);
  }

  @override
  PropertyAccessorElement get correspondingGetter {
    if (isGetter || variable == null) {
      return null;
    }
    return variable.getter;
  }

  @override
  PropertyAccessorElement get correspondingSetter {
    if (isSetter || variable == null) {
      return null;
    }
    return variable.setter;
  }

  /**
   * Set whether this accessor is a getter.
   */
  void set getter(bool isGetter) {
    setModifier(Modifier.GETTER, isGetter);
  }

  @override
  int get hashCode => JenkinsSmiHash.hash2(super.hashCode, isGetter ? 1 : 2);

  @override
  String get identifier {
    String name = displayName;
    String suffix = isGetter ? "?" : "=";
    return "$name$suffix";
  }

  @override
  bool get isGetter => hasModifier(Modifier.GETTER);

  @override
  bool get isSetter => hasModifier(Modifier.SETTER);

  @override
  bool get isStatic => hasModifier(Modifier.STATIC);

  @override
  ElementKind get kind {
    if (isGetter) {
      return ElementKind.GETTER;
    }
    return ElementKind.SETTER;
  }

  @override
  String get name {
    if (isSetter) {
      return "${super.name}=";
    }
    return super.name;
  }

  /**
   * Set whether this accessor is a setter.
   */
  void set setter(bool isSetter) {
    setModifier(Modifier.SETTER, isSetter);
  }

  /**
   * Set whether this accessor is static.
   */
  void set static(bool isStatic) {
    setModifier(Modifier.STATIC, isStatic);
  }

  @override
  bool operator ==(Object object) => super == object &&
      isGetter == (object as PropertyAccessorElement).isGetter;

  @override
  accept(ElementVisitor visitor) => visitor.visitPropertyAccessorElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    buffer.write(isGetter ? "get " : "set ");
    buffer.write(variable.displayName);
    super.appendTo(buffer);
  }

  @override
  AstNode computeNode() {
    if (isSynthetic) {
      return null;
    }
    if (enclosingElement is ClassElement) {
      return getNodeMatching((node) => node is MethodDeclaration);
    }
    if (enclosingElement is CompilationUnitElement) {
      return getNodeMatching((node) => node is FunctionDeclaration);
    }
    return null;
  }
}

/**
 * A property accessor element defined in a parameterized type where the values
 * of the type parameters are known.
 */
class PropertyAccessorMember extends ExecutableMember
    implements PropertyAccessorElement {
  /**
   * Initialize a newly created element to represent a property, based on the
   * [baseElement], defined by the [definingType].
   */
  PropertyAccessorMember(
      PropertyAccessorElement baseElement, InterfaceType definingType)
      : super(baseElement, definingType);

  @override
  PropertyAccessorElement get baseElement =>
      super.baseElement as PropertyAccessorElement;

  @override
  PropertyAccessorElement get correspondingGetter =>
      from(baseElement.correspondingGetter, definingType);

  @override
  PropertyAccessorElement get correspondingSetter =>
      from(baseElement.correspondingSetter, definingType);

  @override
  InterfaceType get definingType => super.definingType as InterfaceType;

  @override
  Element get enclosingElement => baseElement.enclosingElement;

  @override
  bool get isGetter => baseElement.isGetter;

  @override
  bool get isSetter => baseElement.isSetter;

  @override
  PropertyInducingElement get variable {
    PropertyInducingElement variable = baseElement.variable;
    if (variable is FieldElement) {
      return FieldMember.from(variable, definingType);
    }
    return variable;
  }

  @override
  accept(ElementVisitor visitor) => visitor.visitPropertyAccessorElement(this);

  @override
  String toString() {
    PropertyAccessorElement baseElement = this.baseElement;
    List<ParameterElement> parameters = this.parameters;
    FunctionType type = this.type;
    StringBuffer builder = new StringBuffer();
    if (isGetter) {
      builder.write("get ");
    } else {
      builder.write("set ");
    }
    builder.write(baseElement.enclosingElement.displayName);
    builder.write(".");
    builder.write(baseElement.displayName);
    builder.write("(");
    int parameterCount = parameters.length;
    for (int i = 0; i < parameterCount; i++) {
      if (i > 0) {
        builder.write(", ");
      }
      builder.write(parameters[i]);
    }
    builder.write(")");
    if (type != null) {
      builder.write(Element.RIGHT_ARROW);
      builder.write(type.returnType);
    }
    return builder.toString();
  }

  /**
   * If the given [accessor]'s type is different when any type parameters from
   * the defining type's declaration are replaced with the actual type
   * arguments from the [definingType], create an accessor member representing
   * the given accessor. Return the member that was created, or the base
   * accessor if no member was created.
   */
  static PropertyAccessorElement from(
      PropertyAccessorElement accessor, InterfaceType definingType) {
    if (!_isChangedByTypeSubstitution(accessor, definingType)) {
      return accessor;
    }
    // TODO(brianwilkerson) Consider caching the substituted type in the
    // instance. It would use more memory but speed up some operations.
    // We need to see how often the type is being re-computed.
    return new PropertyAccessorMember(accessor, definingType);
  }

  /**
   * Determine whether the given property [accessor]'s type is changed when type
   * parameters from the defining type's declaration are replaced with the
   * actual type arguments from the [definingType].
   */
  static bool _isChangedByTypeSubstitution(
      PropertyAccessorElement accessor, InterfaceType definingType) {
    List<DartType> argumentTypes = definingType.typeArguments;
    if (accessor != null && argumentTypes.length != 0) {
      FunctionType baseType = accessor.type;
      if (baseType == null) {
        AnalysisEngine.instance.logger.logInformation(
            'Type of $accessor is null in PropertyAccessorMember._isChangedByTypeSubstitution');
        return false;
      }
      List<DartType> parameterTypes = definingType.element.type.typeArguments;
      FunctionType substitutedType =
          baseType.substitute2(argumentTypes, parameterTypes);
      if (baseType != substitutedType) {
        return true;
      }
      // If this property accessor is based on a field, that field might have a
      // propagated type. In which case we need to check whether the propagated
      // type of the field needs substitution.
      PropertyInducingElement field = accessor.variable;
      if (!field.isSynthetic) {
        DartType baseFieldType = field.propagatedType;
        if (baseFieldType != null) {
          DartType substitutedFieldType =
              baseFieldType.substitute2(argumentTypes, parameterTypes);
          if (baseFieldType != substitutedFieldType) {
            return true;
          }
        }
      }
    }
    return false;
  }
}

/**
 * A variable that has an associated getter and possibly a setter. Note that
 * explicitly defined variables implicitly define a synthetic getter and that
 * non-`final` explicitly defined variables implicitly define a synthetic
 * setter. Symmetrically, synthetic fields are implicitly created for explicitly
 * defined getters and setters. The following rules apply:
 *
 * * Every explicit variable is represented by a non-synthetic
 *   [PropertyInducingElement].
 * * Every explicit variable induces a getter and possibly a setter, both of
 *   which are represented by synthetic [PropertyAccessorElement]s.
 * * Every explicit getter or setter is represented by a non-synthetic
 *   [PropertyAccessorElement].
 * * Every explicit getter or setter (or pair thereof if they have the same
 *   name) induces a variable that is represented by a synthetic
 *   [PropertyInducingElement].
 */
abstract class PropertyInducingElement implements VariableElement {
  /**
   * An empty list of elements.
   */
  static const List<PropertyInducingElement> EMPTY_LIST =
      const <PropertyInducingElement>[];

  /**
   * Return the getter associated with this variable. If this variable was
   * explicitly defined (is not synthetic) then the getter associated with it
   * will be synthetic.
   */
  PropertyAccessorElement get getter;

  /**
   * Return the propagated type of this variable, or `null` if type propagation
   * has not been performed, for example because the variable is not final.
   */
  DartType get propagatedType;

  /**
   * Return the setter associated with this variable, or `null` if the variable
   * is effectively `final` and therefore does not have a setter associated with
   * it. (This can happen either because the variable is explicitly defined as
   * being `final` or because the variable is induced by an explicit getter that
   * does not have a corresponding setter.) If this variable was explicitly
   * defined (is not synthetic) then the setter associated with it will be
   * synthetic.
   */
  PropertyAccessorElement get setter;
}

/**
 * A concrete implementation of a [PropertyInducingElement].
 */
abstract class PropertyInducingElementImpl extends VariableElementImpl
    implements PropertyInducingElement {
  /**
   * An empty list of elements.
   */
  @deprecated // Use PropertyInducingElement.EMPTY_LIST
  static const List<PropertyInducingElement> EMPTY_ARRAY =
      const <PropertyInducingElement>[];

  /**
   * The getter associated with this element.
   */
  PropertyAccessorElement getter;

  /**
   * The setter associated with this element, or `null` if the element is
   * effectively `final` and therefore does not have a setter associated with
   * it.
   */
  PropertyAccessorElement setter;

  /**
   * The propagated type of this variable, or `null` if type propagation has not
   * been performed.
   */
  DartType propagatedType;

  /**
   * Initialize a newly created synthetic element to have the given [name] and
   * [offset].
   */
  PropertyInducingElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created element to have the given [name].
   */
  PropertyInducingElementImpl.forNode(Identifier name) : super.forNode(name);
}

/**
 * A visitor that will recursively visit all of the element in an element model.
 * For example, using an instance of this class to visit a
 * [CompilationUnitElement] will also cause all of the types in the compilation
 * unit to be visited.
 *
 * Subclasses that override a visit method must either invoke the overridden
 * visit method or must explicitly ask the visited element to visit its
 * children. Failure to do so will cause the children of the visited element to
 * not be visited.
 */
class RecursiveElementVisitor<R> implements ElementVisitor<R> {
  @override
  R visitClassElement(ClassElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitCompilationUnitElement(CompilationUnitElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitConstructorElement(ConstructorElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  @deprecated
  R visitEmbeddedHtmlScriptElement(EmbeddedHtmlScriptElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitExportElement(ExportElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  @deprecated
  R visitExternalHtmlScriptElement(ExternalHtmlScriptElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitFieldElement(FieldElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitFieldFormalParameterElement(FieldFormalParameterElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitFunctionElement(FunctionElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitFunctionTypeAliasElement(FunctionTypeAliasElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  @deprecated
  R visitHtmlElement(HtmlElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitImportElement(ImportElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitLabelElement(LabelElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitLibraryElement(LibraryElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitLocalVariableElement(LocalVariableElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitMethodElement(MethodElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitMultiplyDefinedElement(MultiplyDefinedElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitParameterElement(ParameterElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitPrefixElement(PrefixElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitPropertyAccessorElement(PropertyAccessorElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitTopLevelVariableElement(TopLevelVariableElement element) {
    element.visitChildren(this);
    return null;
  }

  @override
  R visitTypeParameterElement(TypeParameterElement element) {
    element.visitChildren(this);
    return null;
  }
}

/**
 * A combinator that cause some of the names in a namespace to be visible (and
 * the rest hidden) when being imported.
 */
abstract class ShowElementCombinator implements NamespaceCombinator {
  /**
   * Return the offset of the character immediately following the last character
   * of this node.
   */
  int get end;

  /**
   * Return the offset of the 'show' keyword of this element.
   */
  int get offset;

  /**
   * Return a list containing the names that are to be made visible in the
   * importing library if they are defined in the imported library.
   */
  List<String> get shownNames;
}

/**
 * A concrete implementation of a [ShowElementCombinator].
 */
class ShowElementCombinatorImpl implements ShowElementCombinator {
  /**
   * The names that are to be made visible in the importing library if they are
   * defined in the imported library.
   */
  List<String> shownNames = StringUtilities.EMPTY_ARRAY;

  /**
   * The offset of the character immediately following the last character of
   * this node.
   */
  int end = -1;

  /**
   * The offset of the 'show' keyword of this element.
   */
  int offset = 0;

  @override
  String toString() {
    StringBuffer buffer = new StringBuffer();
    buffer.write("show ");
    int count = shownNames.length;
    for (int i = 0; i < count; i++) {
      if (i > 0) {
        buffer.write(", ");
      }
      buffer.write(shownNames[i]);
    }
    return buffer.toString();
  }
}

/**
 * A visitor that will do nothing when visiting an element. It is intended to be
 * a superclass for classes that use the visitor pattern primarily as a dispatch
 * mechanism (and hence don't need to recursively visit a whole structure) and
 * that only need to visit a small number of element types.
 */
class SimpleElementVisitor<R> implements ElementVisitor<R> {
  @override
  R visitClassElement(ClassElement element) => null;

  @override
  R visitCompilationUnitElement(CompilationUnitElement element) => null;

  @override
  R visitConstructorElement(ConstructorElement element) => null;

  @override
  @deprecated
  R visitEmbeddedHtmlScriptElement(EmbeddedHtmlScriptElement element) => null;

  @override
  R visitExportElement(ExportElement element) => null;

  @override
  @deprecated
  R visitExternalHtmlScriptElement(ExternalHtmlScriptElement element) => null;

  @override
  R visitFieldElement(FieldElement element) => null;

  @override
  R visitFieldFormalParameterElement(FieldFormalParameterElement element) =>
      null;

  @override
  R visitFunctionElement(FunctionElement element) => null;

  @override
  R visitFunctionTypeAliasElement(FunctionTypeAliasElement element) => null;

  @override
  @deprecated
  R visitHtmlElement(HtmlElement element) => null;

  @override
  R visitImportElement(ImportElement element) => null;

  @override
  R visitLabelElement(LabelElement element) => null;

  @override
  R visitLibraryElement(LibraryElement element) => null;

  @override
  R visitLocalVariableElement(LocalVariableElement element) => null;

  @override
  R visitMethodElement(MethodElement element) => null;

  @override
  R visitMultiplyDefinedElement(MultiplyDefinedElement element) => null;

  @override
  R visitParameterElement(ParameterElement element) => null;

  @override
  R visitPrefixElement(PrefixElement element) => null;

  @override
  R visitPropertyAccessorElement(PropertyAccessorElement element) => null;

  @override
  R visitTopLevelVariableElement(TopLevelVariableElement element) => null;

  @override
  R visitTypeParameterElement(TypeParameterElement element) => null;
}

/**
 * A top-level variable.
 */
abstract class TopLevelVariableElement implements PropertyInducingElement {
  /**
   * An empty list of top-level variable elements.
   */
  static const List<TopLevelVariableElement> EMPTY_LIST =
      const <TopLevelVariableElement>[];

  @override
  VariableDeclaration computeNode();
}

/**
 * A concrete implementation of a [TopLevelVariableElement].
 */
class TopLevelVariableElementImpl extends PropertyInducingElementImpl
    implements TopLevelVariableElement {
  /**
   * An empty list of top-level variable elements.
   */
  @deprecated // Use TopLevelVariableElement.EMPTY_LIST
  static const List<TopLevelVariableElement> EMPTY_ARRAY =
      const <TopLevelVariableElement>[];

  /**
   * Initialize a newly created synthetic top-level variable element to have the
   * given [name] and [offset].
   */
  TopLevelVariableElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created top-level variable element to have the given
   * [name].
   */
  TopLevelVariableElementImpl.forNode(Identifier name) : super.forNode(name);

  @override
  bool get isStatic => true;

  @override
  ElementKind get kind => ElementKind.TOP_LEVEL_VARIABLE;

  @override
  accept(ElementVisitor visitor) => visitor.visitTopLevelVariableElement(this);

  @override
  VariableDeclaration computeNode() =>
      getNodeMatching((node) => node is VariableDeclaration);
}

/**
 * An element that defines a type.
 */
abstract class TypeDefiningElement implements Element {
  /**
   * Return the type defined by this element.
   */
  DartType get type;
}

/**
 * The abstract class `TypeImpl` implements the behavior common to objects
 * representing the declared type of elements in the element model.
 */
abstract class TypeImpl implements DartType {
  /**
   * An empty list of types.
   */
  @deprecated // Use DartType.EMPTY_LIST
  static const List<DartType> EMPTY_ARRAY = const <DartType>[];

  /**
   * The element representing the declaration of this type, or `null` if the
   * type has not, or cannot, be associated with an element.
   */
  final Element _element;

  /**
   * The name of this type, or `null` if the type does not have a name.
   */
  final String name;

  /**
   * Initialize a newly created type to be declared by the given [element] and
   * to have the given [name].
   */
  TypeImpl(this._element, this.name);

  @override
  String get displayName => name;

  @override
  Element get element => _element;

  @override
  bool get isBottom => false;

  @override
  bool get isDartCoreFunction => false;

  @override
  bool get isDynamic => false;

  @override
  bool get isObject => false;

  @override
  bool get isUndefined => false;

  @override
  bool get isVoid => false;

  /**
   * Append a textual representation of this type to the given [buffer]. The set
   * of [visitedTypes] is used to prevent infinite recusion.
   */
  void appendTo(StringBuffer buffer) {
    if (name == null) {
      buffer.write("<unnamed type>");
    } else {
      buffer.write(name);
    }
  }

  @override
  DartType getLeastUpperBound(DartType type) => null;

  /**
   * Return `true` if this type is assignable to the given [type] (written in
   * the spec as "T <=> S", where T=[this] and S=[type]).
   *
   * The sets [thisExpansions] and [typeExpansions], if given, are the sets of
   * function type aliases that have been expanded so far in the process of
   * reaching [this] and [type], respectively.  These are used to avoid
   * infinite regress when analyzing invalid code; since the language spec
   * forbids a typedef from referring to itself directly or indirectly, we can
   * use these as sets of function type aliases that don't need to be expanded.
   */
  @override
  bool isAssignableTo(DartType type) {
    // An interface type T may be assigned to a type S, written T <=> S, iff
    // either T <: S or S <: T.
    return isSubtypeOf(type) || (type as TypeImpl).isSubtypeOf(this);
  }

  /**
   * Return `true` if this type is more specific than the given [type] (written
   * in the spec as "T << S", where T=[this] and S=[type]).
   *
   * If [withDynamic] is `true`, then "dynamic" should be considered as a
   * subtype of any type (as though "dynamic" had been replaced with bottom).
   *
   * The set [visitedElements], if given, is the set of classes and type
   * parameters that have been visited so far while examining the class
   * hierarchy of [this].  This is used to avoid infinite regress when
   * analyzing invalid code; since the language spec forbids loops in the class
   * hierarchy, we can use this as a set of classes that don't need to be
   * examined when walking the class hierarchy.
   */
  @override
  bool isMoreSpecificThan(DartType type,
      [bool withDynamic = false, Set<Element> visitedElements]);

  /**
   * Return `true` if this type is a subtype of the given [type] (written in
   * the spec as "T <: S", where T=[this] and S=[type]).
   *
   * The sets [thisExpansions] and [typeExpansions], if given, are the sets of
   * function type aliases that have been expanded so far in the process of
   * reaching [this] and [type], respectively.  These are used to avoid
   * infinite regress when analyzing invalid code; since the language spec
   * forbids a typedef from referring to itself directly or indirectly, we can
   * use these as sets of function type aliases that don't need to be expanded.
   */
  @override
  bool isSubtypeOf(DartType type) {
    // For non-function types, T <: S iff [_|_/dynamic]T << S.
    return isMoreSpecificThan(type, true);
  }

  @override
  bool isSupertypeOf(DartType type) => type.isSubtypeOf(this);

  /**
   * Create a new [TypeImpl] that is identical to [this] except that when
   * visiting type parameters, function parameter types, and function return
   * types, function types listed in [prune] will not be expanded.  This is
   * used to avoid creating infinite types in the presence of circular
   * typedefs.
   *
   * If [prune] is null, then [this] is returned unchanged.
   *
   * Only legal to call on a [TypeImpl] that is not already subject to pruning.
   */
  TypeImpl pruned(List<FunctionTypeAliasElement> prune);

  /**
   * Return the type resulting from substituting the given [argumentTypes] for
   * the given [parameterTypes] in this type.
   *
   * In all classes derived from [TypeImpl], a new optional argument
   * [prune] is added.  If specified, it is a list of function typdefs
   * which should not be expanded.  This is used to avoid creating infinite
   * types in response to self-referential typedefs.
   */
  @override
  DartType substitute2(
      List<DartType> argumentTypes, List<DartType> parameterTypes,
      [List<FunctionTypeAliasElement> prune]);

  @override
  String toString() {
    StringBuffer buffer = new StringBuffer();
    appendTo(buffer);
    return buffer.toString();
  }

  /**
   * Return `true` if corresponding elements of the [first] and [second] lists
   * of type arguments are all equal.
   */
  static bool equalArrays(List<DartType> first, List<DartType> second) {
    if (first.length != second.length) {
      return false;
    }
    for (int i = 0; i < first.length; i++) {
      if (first[i] == null) {
        AnalysisEngine.instance.logger
            .logInformation('Found null type argument in TypeImpl.equalArrays');
        return second[i] == null;
      } else if (second[i] == null) {
        AnalysisEngine.instance.logger
            .logInformation('Found null type argument in TypeImpl.equalArrays');
        return false;
      }
      if (first[i] != second[i]) {
        return false;
      }
    }
    return true;
  }

  /**
   * Return a list containing the results of using the given [argumentTypes] and
   * [parameterTypes] to perform a substitution on all of the given [types].
   *
   * If [prune] is specified, it is a list of function typdefs which should not
   * be expanded.  This is used to avoid creating infinite types in response to
   * self-referential typedefs.
   */
  static List<DartType> substitute(List<DartType> types,
      List<DartType> argumentTypes, List<DartType> parameterTypes,
      [List<FunctionTypeAliasElement> prune]) {
    int length = types.length;
    if (length == 0) {
      return types;
    }
    List<DartType> newTypes = new List<DartType>(length);
    for (int i = 0; i < length; i++) {
      newTypes[i] = (types[i] as TypeImpl)
          .substitute2(argumentTypes, parameterTypes, prune);
    }
    return newTypes;
  }
}

/**
 * A type parameter.
 */
abstract class TypeParameterElement implements TypeDefiningElement {
  /**
   * An empty list of type parameter elements.
   */
  static const List<TypeParameterElement> EMPTY_LIST =
      const <TypeParameterElement>[];

  /**
   * Return the type representing the bound associated with this parameter, or
   * `null` if this parameter does not have an explicit bound.
   */
  DartType get bound;

  /**
   * Return the type defined by this type parameter.
   */
  TypeParameterType get type;
}

/**
 * A concrete implementation of a [TypeParameterElement].
 */
class TypeParameterElementImpl extends ElementImpl
    implements TypeParameterElement {
  /**
   * An empty list of type parameter elements.
   */
  @deprecated // Use TypeParameterElement.EMPTY_LIST
  static const List<TypeParameterElement> EMPTY_ARRAY =
      const <TypeParameterElement>[];

  /**
   * The type defined by this type parameter.
   */
  TypeParameterType type;

  /**
   * The type representing the bound associated with this parameter, or `null`
   * if this parameter does not have an explicit bound.
   */
  DartType bound;

  /**
   * Initialize a newly created method element to have the given [name] and
   * [offset].
   */
  TypeParameterElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created type parameter element to have the given [name].
   */
  TypeParameterElementImpl.forNode(Identifier name) : super.forNode(name);

  @override
  ElementKind get kind => ElementKind.TYPE_PARAMETER;

  @override
  accept(ElementVisitor visitor) => visitor.visitTypeParameterElement(this);

  @override
  void appendTo(StringBuffer buffer) {
    buffer.write(displayName);
    if (bound != null) {
      buffer.write(" extends ");
      buffer.write(bound);
    }
  }
}

/**
 * An element that has type parameters.
 *
 * For example, a class or a typedef. This also includes functions and methods
 * if support for generic methods is enabled.
 */
abstract class TypeParameterizedElement implements Element {
  /**
   * Return a list containing all of the type parameters declared for this
   * class.
   */
  List<TypeParameterElement> get typeParameters;
}

/**
 * The type introduced by a type parameter.
 */
abstract class TypeParameterType implements DartType {
  /**
   * An empty list of type parameter types.
   */
  static const List<TypeParameterType> EMPTY_LIST = const <TypeParameterType>[];

  @override
  TypeParameterElement get element;
}

/**
 * A concrete implementation of a [TypeParameterType].
 */
class TypeParameterTypeImpl extends TypeImpl implements TypeParameterType {
  /**
   * An empty list of type parameter types.
   */
  @deprecated // Use TypeParameterType.EMPTY_LIST
  static const List<TypeParameterType> EMPTY_ARRAY =
      const <TypeParameterType>[];

  /**
   * Initialize a newly created type parameter type to be declared by the given
   * [element] and to have the given name.
   */
  TypeParameterTypeImpl(TypeParameterElement element)
      : super(element, element.name);

  @override
  TypeParameterElement get element => super.element as TypeParameterElement;

  @override
  int get hashCode => element.hashCode;

  @override
  bool operator ==(Object object) =>
      object is TypeParameterTypeImpl && (element == object.element);

  @override
  bool isMoreSpecificThan(DartType s,
      [bool withDynamic = false, Set<Element> visitedElements]) {
    //
    // A type T is more specific than a type S, written T << S,
    // if one of the following conditions is met:
    //
    // Reflexivity: T is S.
    //
    if (this == s) {
      return true;
    }
    // S is dynamic.
    //
    if (s.isDynamic) {
      return true;
    }
    //
    // T is a type parameter and S is the upper bound of T.
    //
    TypeImpl bound = element.bound;
    if (s == bound) {
      return true;
    }
    //
    // T is a type parameter and S is Object.
    //
    if (s.isObject) {
      return true;
    }
    // We need upper bound to continue.
    if (bound == null) {
      return false;
    }
    //
    // Transitivity: T << U and U << S.
    //
    // First check for infinite loops
    if (element == null) {
      return false;
    }
    if (visitedElements == null) {
      visitedElements = new HashSet<Element>();
    } else if (visitedElements.contains(element)) {
      return false;
    }
    visitedElements.add(element);
    try {
      return bound.isMoreSpecificThan(s, withDynamic, visitedElements);
    } finally {
      visitedElements.remove(element);
    }
  }

  @override
  bool isSubtypeOf(DartType type) => isMoreSpecificThan(type, true);

  @override
  TypeImpl pruned(List<FunctionTypeAliasElement> prune) => this;

  @override
  DartType substitute2(
      List<DartType> argumentTypes, List<DartType> parameterTypes,
      [List<FunctionTypeAliasElement> prune]) {
    int length = parameterTypes.length;
    for (int i = 0; i < length; i++) {
      if (parameterTypes[i] == this) {
        return argumentTypes[i];
      }
    }
    return this;
  }

  /**
   * Return a list containing the type parameter types defined by the given
   * array of type parameter elements ([typeParameters]).
   */
  static List<TypeParameterType> getTypes(
      List<TypeParameterElement> typeParameters) {
    int count = typeParameters.length;
    if (count == 0) {
      return TypeParameterType.EMPTY_LIST;
    }
    List<TypeParameterType> types = new List<TypeParameterType>(count);
    for (int i = 0; i < count; i++) {
      types[i] = typeParameters[i].type;
    }
    return types;
  }
}

/**
 * A pseudo-elements that represents names that are undefined. This situation is
 * not allowed by the language, so objects implementing this interface always
 * represent an error. As a result, most of the normal operations on elements do
 * not make sense and will return useless results.
 */
abstract class UndefinedElement implements Element {}

/**
 * The unique instance of the class `UndefinedTypeImpl` implements the type of
 * typenames that couldn't be resolved.
 *
 * This class behaves like DynamicTypeImpl in almost every respect, to reduce
 * cascading errors.
 */
class UndefinedTypeImpl extends TypeImpl {
  /**
   * The unique instance of this class.
   */
  static UndefinedTypeImpl _INSTANCE = new UndefinedTypeImpl._();

  /**
   * Return the unique instance of this class.
   */
  static UndefinedTypeImpl get instance => _INSTANCE;

  /**
   * Prevent the creation of instances of this class.
   */
  UndefinedTypeImpl._()
      : super(DynamicElementImpl.instance, Keyword.DYNAMIC.syntax);

  @override
  int get hashCode => 1;

  @override
  bool get isDynamic => true;

  @override
  bool get isUndefined => true;

  @override
  bool operator ==(Object object) => identical(object, this);

  @override
  bool isMoreSpecificThan(DartType type,
      [bool withDynamic = false, Set<Element> visitedElements]) {
    // T is S
    if (identical(this, type)) {
      return true;
    }
    // else
    return withDynamic;
  }

  @override
  bool isSubtypeOf(DartType type) => true;

  @override
  bool isSupertypeOf(DartType type) => true;

  @override
  TypeImpl pruned(List<FunctionTypeAliasElement> prune) => this;

  @override
  DartType substitute2(
      List<DartType> argumentTypes, List<DartType> parameterTypes,
      [List<FunctionTypeAliasElement> prune]) {
    int length = parameterTypes.length;
    for (int i = 0; i < length; i++) {
      if (parameterTypes[i] == this) {
        return argumentTypes[i];
      }
    }
    return this;
  }
}

/**
 * An element included into a library using some URI.
 */
abstract class UriReferencedElement implements Element {
  /**
   * Return the URI that is used to include this element into the enclosing
   * library, or `null` if this is the defining compilation unit of a library.
   */
  String get uri;

  /**
   * Return the offset of the character immediately following the last character
   * of this node's URI, or `-1` for synthetic import.
   */
  int get uriEnd;

  /**
   * Return the offset of the URI in the file, or `-1` if this element is
   * synthetic.
   */
  int get uriOffset;
}

/**
 * A concrete implementation of a [UriReferencedElement].
 */
abstract class UriReferencedElementImpl extends ElementImpl
    implements UriReferencedElement {
  /**
   * The offset of the URI in the file, may be `-1` if synthetic.
   */
  int uriOffset = -1;

  /**
   * The offset of the character immediately following the last character of
   * this node's URI, may be `-1` if synthetic.
   */
  int uriEnd = -1;

  /**
   * The URI that is specified by this directive.
   */
  String uri;

  /**
   * Initialize a newly created import element to heve the given [name] and
   * [offset]. The offset may be `-1` if the element is synthetic.
   */
  UriReferencedElementImpl(String name, int offset) : super(name, offset);
}

/**
 * A variable. There are concrete subclasses for different kinds of variables.
 */
abstract class VariableElement implements Element, ConstantEvaluationTarget {
  /**
   * An empty list of variable elements.
   */
  static const List<VariableElement> EMPTY_LIST = const <VariableElement>[];

  /**
   * Return a representation of the value of this variable.
   *
   * Return `null` if either this variable was not declared with the 'const'
   * modifier or if the value of this variable could not be computed because of
   * errors.
   */
  DartObject get constantValue;

  /**
   * Return `true` if this variable element did not have an explicit type
   * specified for it.
   */
  bool get hasImplicitType;

  /**
   * Return a synthetic function representing this variable's initializer, or
   * `null` if this variable does not have an initializer. The function will
   * have no parameters. The return type of the function will be the
   * compile-time type of the initialization expression.
   */
  FunctionElement get initializer;

  /**
   * Return `true` if this variable was declared with the 'const' modifier.
   */
  bool get isConst;

  /**
   * Return `true` if this variable was declared with the 'final' modifier.
   * Variables that are declared with the 'const' modifier will return `false`
   * even though they are implicitly final.
   */
  bool get isFinal;

  /**
   * Return `true` if this variable is potentially mutated somewhere in a
   * closure. This information is only available for local variables (including
   * parameters) and only after the compilation unit containing the variable has
   * been resolved.
   */
  bool get isPotentiallyMutatedInClosure;

  /**
   * Return `true` if this variable is potentially mutated somewhere in its
   * scope. This information is only available for local variables (including
   * parameters) and only after the compilation unit containing the variable has
   * been resolved.
   */
  bool get isPotentiallyMutatedInScope;

  /**
   * Return `true` if this element is a static variable, as per section 8 of the
   * Dart Language Specification:
   *
   * > A static variable is a variable that is not associated with a particular
   * > instance, but rather with an entire library or class. Static variables
   * > include library variables and class variables. Class variables are
   * > variables whose declaration is immediately nested inside a class
   * > declaration and includes the modifier static. A library variable is
   * > implicitly static.
   */
  bool get isStatic;

  /**
   * Return the declared type of this variable, or `null` if the variable did
   * not have a declared type (such as if it was declared using the keyword
   * 'var').
   */
  DartType get type;
}

/**
 * A concrete implementation of a [VariableElement].
 */
abstract class VariableElementImpl extends ElementImpl
    implements VariableElement {
  /**
   * An empty list of variable elements.
   */
  @deprecated // Use VariableElement.EMPTY_LIST
  static const List<VariableElement> EMPTY_ARRAY = const <VariableElement>[];

  /**
   * The declared type of this variable.
   */
  DartType type;

  /**
   * A synthetic function representing this variable's initializer, or `null` if
   * this variable does not have an initializer.
   */
  FunctionElement _initializer;

  /**
   * Initialize a newly created variable element to have the given [name] and
   * [offset].
   */
  VariableElementImpl(String name, int offset) : super(name, offset);

  /**
   * Initialize a newly created variable element to have the given [name].
   */
  VariableElementImpl.forNode(Identifier name) : super.forNode(name);

  /**
   * Set whether this variable is const.
   */
  void set const3(bool isConst) {
    setModifier(Modifier.CONST, isConst);
  }

  /**
   * If this element represents a constant variable, and it has an initializer,
   * a copy of the initializer for the constant.  Otherwise `null`.
   *
   * Note that in correct Dart code, all constant variables must have
   * initializers.  However, analyzer also needs to handle incorrect Dart code,
   * in which case there might be some constant variables that lack
   * initializers.
   */
  Expression get constantInitializer => null;

  @override
  DartObject get constantValue => null;

  /**
   * Return the result of evaluating this variable's initializer as a
   * compile-time constant expression, or `null` if this variable is not a
   * 'const' variable, if it does not have an initializer, or if the compilation
   * unit containing the variable has not been resolved.
   */
  EvaluationResultImpl get evaluationResult => null;

  /**
   * Set the result of evaluating this variable's initializer as a compile-time
   * constant expression to the given [result].
   */
  void set evaluationResult(EvaluationResultImpl result) {
    throw new IllegalStateException(
        "Invalid attempt to set a compile-time constant result");
  }

  /**
   * Set whether this variable is final.
   */
  void set final2(bool isFinal) {
    setModifier(Modifier.FINAL, isFinal);
  }

  @override
  bool get hasImplicitType => hasModifier(Modifier.IMPLICIT_TYPE);

  /**
   * Set whether this variable element has an implicit type.
   */
  void set hasImplicitType(bool hasImplicitType) {
    setModifier(Modifier.IMPLICIT_TYPE, hasImplicitType);
  }

  @override
  FunctionElement get initializer => _initializer;

  /**
   * Set the function representing this variable's initializer to the given
   * [function].
   */
  void set initializer(FunctionElement function) {
    if (function != null) {
      (function as FunctionElementImpl).enclosingElement = this;
    }
    this._initializer = function;
  }

  @override
  bool get isConst => hasModifier(Modifier.CONST);

  @override
  bool get isFinal => hasModifier(Modifier.FINAL);

  @override
  bool get isPotentiallyMutatedInClosure => false;

  @override
  bool get isPotentiallyMutatedInScope => false;

  @override
  bool get isStatic => hasModifier(Modifier.STATIC);

  @override
  void appendTo(StringBuffer buffer) {
    buffer.write(type);
    buffer.write(" ");
    buffer.write(displayName);
  }

  @override
  void visitChildren(ElementVisitor visitor) {
    super.visitChildren(visitor);
    safelyVisitChild(_initializer, visitor);
  }
}

/**
 * A variable element defined in a parameterized type where the values of the
 * type parameters are known.
 */
abstract class VariableMember extends Member implements VariableElement {
  @override
  final DartType type;

  /**
   * Initialize a newly created element to represent a variable, based on the
   * [baseElement], defined by the [definingType].
   */
  VariableMember(VariableElement baseElement, ParameterizedType definingType,
      [DartType type])
      : type = type ??
            baseElement.type.substitute2(definingType.typeArguments,
                TypeParameterTypeImpl.getTypes(definingType.typeParameters)),
        super(baseElement, definingType);

  // TODO(jmesserly): this is temporary to allow the ParameterMember subclass.
  // Apparently mixins don't work with optional params.
  VariableMember._(VariableElement baseElement, ParameterizedType definingType,
      DartType type)
      : this(baseElement, definingType, type);

  @override
  VariableElement get baseElement => super.baseElement as VariableElement;

  @override
  DartObject get constantValue => baseElement.constantValue;

  @override
  bool get hasImplicitType => baseElement.hasImplicitType;

  @override
  FunctionElement get initializer {
    //
    // Elements within this element should have type parameters substituted,
    // just like this element.
    //
    throw new UnsupportedOperationException();
    //    return getBaseElement().getInitializer();
  }

  @override
  bool get isConst => baseElement.isConst;

  @override
  bool get isFinal => baseElement.isFinal;

  @override
  bool get isPotentiallyMutatedInClosure =>
      baseElement.isPotentiallyMutatedInClosure;

  @override
  bool get isPotentiallyMutatedInScope =>
      baseElement.isPotentiallyMutatedInScope;

  @override
  bool get isStatic => baseElement.isStatic;

  @override
  void visitChildren(ElementVisitor visitor) {
    // TODO(brianwilkerson) We need to finish implementing the accessors used
    // below so that we can safely invoke them.
    super.visitChildren(visitor);
    safelyVisitChild(baseElement.initializer, visitor);
  }
}

/**
 * The type `void`.
 */
abstract class VoidType implements DartType {
  @override
  VoidType substitute2(
      List<DartType> argumentTypes, List<DartType> parameterTypes);
}

/**
 * A concrete implementation of a [VoidType].
 */
class VoidTypeImpl extends TypeImpl implements VoidType {
  /**
   * The unique instance of this class.
   */
  static VoidTypeImpl _INSTANCE = new VoidTypeImpl();

  /**
   * Return the unique instance of this class.
   */
  static VoidTypeImpl get instance => _INSTANCE;

  /**
   * Prevent the creation of instances of this class.
   */
  VoidTypeImpl() : super(null, Keyword.VOID.syntax);

  @override
  int get hashCode => 2;

  @override
  bool get isVoid => true;

  @override
  bool operator ==(Object object) => identical(object, this);

  @override
  bool isMoreSpecificThan(DartType type,
          [bool withDynamic = false, Set<Element> visitedElements]) =>
      isSubtypeOf(type);

  @override
  bool isSubtypeOf(DartType type) {
    // The only subtype relations that pertain to void are therefore:
    // void <: void (by reflexivity)
    // bottom <: void (as bottom is a subtype of all types).
    // void <: dynamic (as dynamic is a supertype of all types)
    return identical(type, this) || type.isDynamic;
  }

  @override
  TypeImpl pruned(List<FunctionTypeAliasElement> prune) => this;

  @override
  VoidTypeImpl substitute2(
          List<DartType> argumentTypes, List<DartType> parameterTypes,
          [List<FunctionTypeAliasElement> prune]) =>
      this;
}

/**
 * A visitor that visit all the elements recursively and fill the given [map].
 */
class _BuildOffsetToElementMap extends GeneralizingElementVisitor {
  final Map<int, Element> map;

  _BuildOffsetToElementMap(this.map);

  @override
  void visitElement(Element element) {
    int offset = element.nameOffset;
    if (offset != -1) {
      map[offset] = element;
    }
    super.visitElement(element);
  }
}
