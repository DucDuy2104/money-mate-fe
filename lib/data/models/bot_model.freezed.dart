// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BotModel _$BotModelFromJson(Map<String, dynamic> json) {
  return _BotModel.fromJson(json);
}

/// @nodoc
mixin _$BotModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  /// Serializes this BotModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BotModelCopyWith<BotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BotModelCopyWith<$Res> {
  factory $BotModelCopyWith(BotModel value, $Res Function(BotModel) then) =
      _$BotModelCopyWithImpl<$Res, BotModel>;
  @useResult
  $Res call({String id, String name, String description});
}

/// @nodoc
class _$BotModelCopyWithImpl<$Res, $Val extends BotModel>
    implements $BotModelCopyWith<$Res> {
  _$BotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BotModelImplCopyWith<$Res>
    implements $BotModelCopyWith<$Res> {
  factory _$$BotModelImplCopyWith(
          _$BotModelImpl value, $Res Function(_$BotModelImpl) then) =
      __$$BotModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String description});
}

/// @nodoc
class __$$BotModelImplCopyWithImpl<$Res>
    extends _$BotModelCopyWithImpl<$Res, _$BotModelImpl>
    implements _$$BotModelImplCopyWith<$Res> {
  __$$BotModelImplCopyWithImpl(
      _$BotModelImpl _value, $Res Function(_$BotModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of BotModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
  }) {
    return _then(_$BotModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BotModelImpl implements _BotModel {
  const _$BotModelImpl(
      {required this.id, required this.name, required this.description});

  factory _$BotModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BotModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;

  @override
  String toString() {
    return 'BotModel(id: $id, name: $name, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BotModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, description);

  /// Create a copy of BotModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BotModelImplCopyWith<_$BotModelImpl> get copyWith =>
      __$$BotModelImplCopyWithImpl<_$BotModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BotModelImplToJson(
      this,
    );
  }
}

abstract class _BotModel implements BotModel {
  const factory _BotModel(
      {required final String id,
      required final String name,
      required final String description}) = _$BotModelImpl;

  factory _BotModel.fromJson(Map<String, dynamic> json) =
      _$BotModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;

  /// Create a copy of BotModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BotModelImplCopyWith<_$BotModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
