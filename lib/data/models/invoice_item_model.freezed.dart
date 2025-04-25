// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'invoice_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

InvoiceItemModel _$InvoiceItemModelFromJson(Map<String, dynamic> json) {
  return _InvoiceItemModel.fromJson(json);
}

/// @nodoc
mixin _$InvoiceItemModel {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'enum')
  String get enumValue => throw _privateConstructorUsedError;
  String get unit => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double get total => throw _privateConstructorUsedError;

  /// Serializes this InvoiceItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InvoiceItemModelCopyWith<InvoiceItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InvoiceItemModelCopyWith<$Res> {
  factory $InvoiceItemModelCopyWith(
          InvoiceItemModel value, $Res Function(InvoiceItemModel) then) =
      _$InvoiceItemModelCopyWithImpl<$Res, InvoiceItemModel>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'enum') String enumValue,
      String unit,
      String name,
      double quantity,
      double total});
}

/// @nodoc
class _$InvoiceItemModelCopyWithImpl<$Res, $Val extends InvoiceItemModel>
    implements $InvoiceItemModelCopyWith<$Res> {
  _$InvoiceItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? enumValue = null,
    Object? unit = null,
    Object? name = null,
    Object? quantity = null,
    Object? total = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      enumValue: null == enumValue
          ? _value.enumValue
          : enumValue // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InvoiceItemModelImplCopyWith<$Res>
    implements $InvoiceItemModelCopyWith<$Res> {
  factory _$$InvoiceItemModelImplCopyWith(_$InvoiceItemModelImpl value,
          $Res Function(_$InvoiceItemModelImpl) then) =
      __$$InvoiceItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'enum') String enumValue,
      String unit,
      String name,
      double quantity,
      double total});
}

/// @nodoc
class __$$InvoiceItemModelImplCopyWithImpl<$Res>
    extends _$InvoiceItemModelCopyWithImpl<$Res, _$InvoiceItemModelImpl>
    implements _$$InvoiceItemModelImplCopyWith<$Res> {
  __$$InvoiceItemModelImplCopyWithImpl(_$InvoiceItemModelImpl _value,
      $Res Function(_$InvoiceItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of InvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? enumValue = null,
    Object? unit = null,
    Object? name = null,
    Object? quantity = null,
    Object? total = null,
  }) {
    return _then(_$InvoiceItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      enumValue: null == enumValue
          ? _value.enumValue
          : enumValue // ignore: cast_nullable_to_non_nullable
              as String,
      unit: null == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InvoiceItemModelImpl implements _InvoiceItemModel {
  const _$InvoiceItemModelImpl(
      {required this.id,
      @JsonKey(name: 'enum') required this.enumValue,
      required this.unit,
      required this.name,
      required this.quantity,
      required this.total});

  factory _$InvoiceItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InvoiceItemModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'enum')
  final String enumValue;
  @override
  final String unit;
  @override
  final String name;
  @override
  final double quantity;
  @override
  final double total;

  @override
  String toString() {
    return 'InvoiceItemModel(id: $id, enumValue: $enumValue, unit: $unit, name: $name, quantity: $quantity, total: $total)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvoiceItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.enumValue, enumValue) ||
                other.enumValue == enumValue) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.total, total) || other.total == total));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, enumValue, unit, name, quantity, total);

  /// Create a copy of InvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvoiceItemModelImplCopyWith<_$InvoiceItemModelImpl> get copyWith =>
      __$$InvoiceItemModelImplCopyWithImpl<_$InvoiceItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InvoiceItemModelImplToJson(
      this,
    );
  }
}

abstract class _InvoiceItemModel implements InvoiceItemModel {
  const factory _InvoiceItemModel(
      {required final String id,
      @JsonKey(name: 'enum') required final String enumValue,
      required final String unit,
      required final String name,
      required final double quantity,
      required final double total}) = _$InvoiceItemModelImpl;

  factory _InvoiceItemModel.fromJson(Map<String, dynamic> json) =
      _$InvoiceItemModelImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'enum')
  String get enumValue;
  @override
  String get unit;
  @override
  String get name;
  @override
  double get quantity;
  @override
  double get total;

  /// Create a copy of InvoiceItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvoiceItemModelImplCopyWith<_$InvoiceItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
