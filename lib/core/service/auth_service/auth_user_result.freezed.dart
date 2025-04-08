// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_user_result.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuthUserResult _$AuthUserResultFromJson(Map<String, dynamic> json) {
  return _AuthUserResult.fromJson(json);
}

/// @nodoc
mixin _$AuthUserResult {
  String? get firebaseIdToken => throw _privateConstructorUsedError;
  String? get accessToken => throw _privateConstructorUsedError;
  String? get idToken => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;

  /// Serializes this AuthUserResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuthUserResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuthUserResultCopyWith<AuthUserResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthUserResultCopyWith<$Res> {
  factory $AuthUserResultCopyWith(
          AuthUserResult value, $Res Function(AuthUserResult) then) =
      _$AuthUserResultCopyWithImpl<$Res, AuthUserResult>;
  @useResult
  $Res call(
      {String? firebaseIdToken,
      String? accessToken,
      String? idToken,
      String? email,
      String? avatar,
      String? displayName});
}

/// @nodoc
class _$AuthUserResultCopyWithImpl<$Res, $Val extends AuthUserResult>
    implements $AuthUserResultCopyWith<$Res> {
  _$AuthUserResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuthUserResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseIdToken = freezed,
    Object? accessToken = freezed,
    Object? idToken = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_value.copyWith(
      firebaseIdToken: freezed == firebaseIdToken
          ? _value.firebaseIdToken
          : firebaseIdToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuthUserResultImplCopyWith<$Res>
    implements $AuthUserResultCopyWith<$Res> {
  factory _$$AuthUserResultImplCopyWith(_$AuthUserResultImpl value,
          $Res Function(_$AuthUserResultImpl) then) =
      __$$AuthUserResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? firebaseIdToken,
      String? accessToken,
      String? idToken,
      String? email,
      String? avatar,
      String? displayName});
}

/// @nodoc
class __$$AuthUserResultImplCopyWithImpl<$Res>
    extends _$AuthUserResultCopyWithImpl<$Res, _$AuthUserResultImpl>
    implements _$$AuthUserResultImplCopyWith<$Res> {
  __$$AuthUserResultImplCopyWithImpl(
      _$AuthUserResultImpl _value, $Res Function(_$AuthUserResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuthUserResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firebaseIdToken = freezed,
    Object? accessToken = freezed,
    Object? idToken = freezed,
    Object? email = freezed,
    Object? avatar = freezed,
    Object? displayName = freezed,
  }) {
    return _then(_$AuthUserResultImpl(
      firebaseIdToken: freezed == firebaseIdToken
          ? _value.firebaseIdToken
          : firebaseIdToken // ignore: cast_nullable_to_non_nullable
              as String?,
      accessToken: freezed == accessToken
          ? _value.accessToken
          : accessToken // ignore: cast_nullable_to_non_nullable
              as String?,
      idToken: freezed == idToken
          ? _value.idToken
          : idToken // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuthUserResultImpl implements _AuthUserResult {
  const _$AuthUserResultImpl(
      {this.firebaseIdToken,
      this.accessToken,
      this.idToken,
      this.email,
      this.avatar,
      this.displayName});

  factory _$AuthUserResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuthUserResultImplFromJson(json);

  @override
  final String? firebaseIdToken;
  @override
  final String? accessToken;
  @override
  final String? idToken;
  @override
  final String? email;
  @override
  final String? avatar;
  @override
  final String? displayName;

  @override
  String toString() {
    return 'AuthUserResult(firebaseIdToken: $firebaseIdToken, accessToken: $accessToken, idToken: $idToken, email: $email, avatar: $avatar, displayName: $displayName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuthUserResultImpl &&
            (identical(other.firebaseIdToken, firebaseIdToken) ||
                other.firebaseIdToken == firebaseIdToken) &&
            (identical(other.accessToken, accessToken) ||
                other.accessToken == accessToken) &&
            (identical(other.idToken, idToken) || other.idToken == idToken) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firebaseIdToken, accessToken,
      idToken, email, avatar, displayName);

  /// Create a copy of AuthUserResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuthUserResultImplCopyWith<_$AuthUserResultImpl> get copyWith =>
      __$$AuthUserResultImplCopyWithImpl<_$AuthUserResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuthUserResultImplToJson(
      this,
    );
  }
}

abstract class _AuthUserResult implements AuthUserResult {
  const factory _AuthUserResult(
      {final String? firebaseIdToken,
      final String? accessToken,
      final String? idToken,
      final String? email,
      final String? avatar,
      final String? displayName}) = _$AuthUserResultImpl;

  factory _AuthUserResult.fromJson(Map<String, dynamic> json) =
      _$AuthUserResultImpl.fromJson;

  @override
  String? get firebaseIdToken;
  @override
  String? get accessToken;
  @override
  String? get idToken;
  @override
  String? get email;
  @override
  String? get avatar;
  @override
  String? get displayName;

  /// Create a copy of AuthUserResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuthUserResultImplCopyWith<_$AuthUserResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
