// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_data_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginDataModel _$LoginDataModelFromJson(Map<String, dynamic> json) {
  return _LoginDataModel.fromJson(json);
}

/// @nodoc
mixin _$LoginDataModel {
  String get accessToken => throw _privateConstructorUsedError;
  String get refreshToken => throw _privateConstructorUsedError;
  UserModel get user => throw _privateConstructorUsedError;

  /// Serializes this LoginDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginDataModelCopyWith<LoginDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginDataModelCopyWith<$Res> {
  factory $LoginDataModelCopyWith(
          LoginDataModel value, $Res Function(LoginDataModel) then) =
      _$LoginDataModelCopyWithImpl<$Res, LoginDataModel>;
  @useResult
  $Res call({String accessToken, String refreshToken, UserModel user});

  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class _$LoginDataModelCopyWithImpl<$Res, $Val extends LoginDataModel>
    implements $LoginDataModelCopyWith<$Res> {
  _$LoginDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? user = null,
  }) {
    return _then(_value.copyWith(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ) as $Val);
  }

  /// Create a copy of LoginDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginDataModelImplCopyWith<$Res>
    implements $LoginDataModelCopyWith<$Res> {
  factory _$$LoginDataModelImplCopyWith(_$LoginDataModelImpl value,
          $Res Function(_$LoginDataModelImpl) then) =
      __$$LoginDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String accessToken, String refreshToken, UserModel user});

  @override
  $UserModelCopyWith<$Res> get user;
}

/// @nodoc
class __$$LoginDataModelImplCopyWithImpl<$Res>
    extends _$LoginDataModelCopyWithImpl<$Res, _$LoginDataModelImpl>
    implements _$$LoginDataModelImplCopyWith<$Res> {
  __$$LoginDataModelImplCopyWithImpl(
      _$LoginDataModelImpl _value, $Res Function(_$LoginDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accessToken = null,
    Object? refreshToken = null,
    Object? user = null,
  }) {
    return _then(_$LoginDataModelImpl(
      accessToken: null == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String,
      refreshToken: null == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String,
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginDataModelImpl implements _LoginDataModel {
  const _$LoginDataModelImpl(
      {required this.accessToken,
      required this.refreshToken,
      required this.user});

  factory _$LoginDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginDataModelImplFromJson(json);

  @override
  final String accessToken;
  @override
  final String refreshToken;
  @override
  final UserModel user;

  @override
  String toString() {
    return 'LoginDataModel(accessToken: $accessToken, refreshToken: $refreshToken, user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginDataModelImpl &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.user, user) || other.user == user));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, accessToken, refreshToken, user);

  /// Create a copy of LoginDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginDataModelImplCopyWith<_$LoginDataModelImpl> get copyWith =>
      __$$LoginDataModelImplCopyWithImpl<_$LoginDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginDataModelImplToJson(
      this,
    );
  }
}

abstract class _LoginDataModel implements LoginDataModel {
  const factory _LoginDataModel(
      {required final String accessToken,
      required final String refreshToken,
      required final UserModel user}) = _$LoginDataModelImpl;

  factory _LoginDataModel.fromJson(Map<String, dynamic> json) =
      _$LoginDataModelImpl.fromJson;

  @override
  String get accessToken;
  @override
  String get refreshToken;
  @override
  UserModel get user;

  /// Create a copy of LoginDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginDataModelImplCopyWith<_$LoginDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
