///
//  Generated code. Do not modify.
///
library angular2.src.transform.common.model.proto_annotation_model;

import 'package:protobuf/protobuf.dart';

class NamedParameter extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('NamedParameter')
    ..a(1, 'name', PbFieldType.QS)
    ..a(2, 'value', PbFieldType.QS);

  NamedParameter() : super();
  NamedParameter.fromBuffer(List<int> i,
      [ExtensionRegistry r = ExtensionRegistry.EMPTY])
      : super.fromBuffer(i, r);
  NamedParameter.fromJson(String i,
      [ExtensionRegistry r = ExtensionRegistry.EMPTY])
      : super.fromJson(i, r);
  NamedParameter clone() => new NamedParameter()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static NamedParameter create() => new NamedParameter();
  static PbList<NamedParameter> createRepeated() =>
      new PbList<NamedParameter>();
  static NamedParameter getDefault() {
    if (_defaultInstance == null) _defaultInstance =
        new _ReadonlyNamedParameter();
    return _defaultInstance;
  }

  static NamedParameter _defaultInstance;
  static void $checkItem(NamedParameter v) {
    if (v is! NamedParameter) checkItemFailed(v, 'NamedParameter');
  }

  String get name => $_get(0, 1, '');
  void set name(String v) {
    $_setString(0, 1, v);
  }

  bool hasName() => $_has(0, 1);
  void clearName() => clearField(1);

  String get value => $_get(1, 2, '');
  void set value(String v) {
    $_setString(1, 2, v);
  }

  bool hasValue() => $_has(1, 2);
  void clearValue() => clearField(2);
}

class _ReadonlyNamedParameter extends NamedParameter with ReadonlyMessageMixin {
}

class AnnotationModel extends GeneratedMessage {
  static final BuilderInfo _i = new BuilderInfo('AnnotationModel')
    ..a(1, 'name', PbFieldType.QS)
    ..p(2, 'parameters', PbFieldType.PS)
    ..pp(3, 'namedParameters', PbFieldType.PM, NamedParameter.$checkItem,
        NamedParameter.create)
    ..a(4, 'isView', PbFieldType.OB)
    ..a(5, 'isDirective', PbFieldType.OB)
    ..a(6, 'isComponent', PbFieldType.OB)
    ..a(7, 'isInjectable', PbFieldType.OB)
    ..a(8, 'isConstObject', PbFieldType.OB);

  AnnotationModel() : super();
  AnnotationModel.fromBuffer(List<int> i,
      [ExtensionRegistry r = ExtensionRegistry.EMPTY])
      : super.fromBuffer(i, r);
  AnnotationModel.fromJson(String i,
      [ExtensionRegistry r = ExtensionRegistry.EMPTY])
      : super.fromJson(i, r);
  AnnotationModel clone() => new AnnotationModel()..mergeFromMessage(this);
  BuilderInfo get info_ => _i;
  static AnnotationModel create() => new AnnotationModel();
  static PbList<AnnotationModel> createRepeated() =>
      new PbList<AnnotationModel>();
  static AnnotationModel getDefault() {
    if (_defaultInstance == null) _defaultInstance =
        new _ReadonlyAnnotationModel();
    return _defaultInstance;
  }

  static AnnotationModel _defaultInstance;
  static void $checkItem(AnnotationModel v) {
    if (v is! AnnotationModel) checkItemFailed(v, 'AnnotationModel');
  }

  String get name => $_get(0, 1, '');
  void set name(String v) {
    $_setString(0, 1, v);
  }

  bool hasName() => $_has(0, 1);
  void clearName() => clearField(1);

  List<String> get parameters => $_get(1, 2, null);

  List<NamedParameter> get namedParameters => $_get(2, 3, null);

  bool get isView => $_get(3, 4, false);
  void set isView(bool v) {
    $_setBool(3, 4, v);
  }

  bool hasIsView() => $_has(3, 4);
  void clearIsView() => clearField(4);

  bool get isDirective => $_get(4, 5, false);
  void set isDirective(bool v) {
    $_setBool(4, 5, v);
  }

  bool hasIsDirective() => $_has(4, 5);
  void clearIsDirective() => clearField(5);

  bool get isComponent => $_get(5, 6, false);
  void set isComponent(bool v) {
    $_setBool(5, 6, v);
  }

  bool hasIsComponent() => $_has(5, 6);
  void clearIsComponent() => clearField(6);

  bool get isInjectable => $_get(6, 7, false);
  void set isInjectable(bool v) {
    $_setBool(6, 7, v);
  }

  bool hasIsInjectable() => $_has(6, 7);
  void clearIsInjectable() => clearField(7);

  bool get isConstObject => $_get(7, 8, false);
  void set isConstObject(bool v) {
    $_setBool(7, 8, v);
  }

  bool hasIsConstObject() => $_has(7, 8);
  void clearIsConstObject() => clearField(8);
}

class _ReadonlyAnnotationModel extends AnnotationModel
    with ReadonlyMessageMixin {}

const NamedParameter$json = const {
  '1': 'NamedParameter',
  '2': const [
    const {'1': 'name', '3': 1, '4': 2, '5': 9},
    const {'1': 'value', '3': 2, '4': 2, '5': 9},
  ],
};

const AnnotationModel$json = const {
  '1': 'AnnotationModel',
  '2': const [
    const {'1': 'name', '3': 1, '4': 2, '5': 9},
    const {'1': 'parameters', '3': 2, '4': 3, '5': 9},
    const {
      '1': 'named_parameters',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.angular2.src.transform.common.model.proto.NamedParameter'
    },
    const {'1': 'is_view', '3': 4, '4': 1, '5': 8},
    const {'1': 'is_directive', '3': 5, '4': 1, '5': 8},
    const {'1': 'is_component', '3': 6, '4': 1, '5': 8},
    const {'1': 'is_injectable', '3': 7, '4': 1, '5': 8},
    const {'1': 'is_const_object', '3': 8, '4': 1, '5': 8},
  ],
};

/**
 * Generated with:
 * annotation_model.proto (93cb7c1fba2e56d937fec054b6e119a2a2b9afe7)
 * libprotoc 2.6.1
 * dart-protoc-plugin (af5fc2bf1de367a434c3b1847ab260510878ffc0)
 */
