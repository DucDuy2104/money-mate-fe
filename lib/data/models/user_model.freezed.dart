// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isSetup => throw _privateConstructorUsedError;
  double get budget => throw _privateConstructorUsedError;
  String? get avatarUrl => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  int get categoriesCount => throw _privateConstructorUsedError;
  int get transactionsCount => throw _privateConstructorUsedError;
  int get reportsCount => throw _privateConstructorUsedError;
  String? get refreshToken => throw _privateConstructorUsedError;
  String? get verificationCode => throw _privateConstructorUsedError;
  DateTime? get verificationCodeExpire => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String email,
      String? phoneNumber,
      bool isActive,
      bool isSetup,
      double budget,
      String? avatarUrl,
      String role,
      int categoriesCount,
      int transactionsCount,
      int reportsCount,
      String? refreshToken,
      String? verificationCode,
      DateTime? verificationCodeExpire,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? email = null,
    Object? phoneNumber = freezed,
    Object? isActive = null,
    Object? isSetup = null,
    Object? budget = null,
    Object? avatarUrl = freezed,
    Object? role = null,
    Object? categoriesCount = null,
    Object? transactionsCount = null,
    Object? reportsCount = null,
    Object? refreshToken = freezed,
    Object? verificationCode = freezed,
    Object? verificationCodeExpire = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isSetup: null == isSetup
          ? _value.isSetup
          : isSetup // ignore: cast_nullable_to_non_nullable
              as bool,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      categoriesCount: null == categoriesCount
          ? _value.categoriesCount
          : categoriesCount // ignore: cast_nullable_to_non_nullable
              as int,
      transactionsCount: null == transactionsCount
          ? _value.transactionsCount
          : transactionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      reportsCount: null == reportsCount
          ? _value.reportsCount
          : reportsCount // ignore: cast_nullable_to_non_nullable
              as int,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationCodeExpire: freezed == verificationCodeExpire
          ? _value.verificationCodeExpire
          : verificationCodeExpire // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? name,
      String email,
      String? phoneNumber,
      bool isActive,
      bool isSetup,
      double budget,
      String? avatarUrl,
      String role,
      int categoriesCount,
      int transactionsCount,
      int reportsCount,
      String? refreshToken,
      String? verificationCode,
      DateTime? verificationCodeExpire,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = freezed,
    Object? email = null,
    Object? phoneNumber = freezed,
    Object? isActive = null,
    Object? isSetup = null,
    Object? budget = null,
    Object? avatarUrl = freezed,
    Object? role = null,
    Object? categoriesCount = null,
    Object? transactionsCount = null,
    Object? reportsCount = null,
    Object? refreshToken = freezed,
    Object? verificationCode = freezed,
    Object? verificationCodeExpire = freezed,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      isActive: null == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool,
      isSetup: null == isSetup
          ? _value.isSetup
          : isSetup // ignore: cast_nullable_to_non_nullable
              as bool,
      budget: null == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as double,
      avatarUrl: freezed == avatarUrl
          ? _value.avatarUrl
          : avatarUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as String,
      categoriesCount: null == categoriesCount
          ? _value.categoriesCount
          : categoriesCount // ignore: cast_nullable_to_non_nullable
              as int,
      transactionsCount: null == transactionsCount
          ? _value.transactionsCount
          : transactionsCount // ignore: cast_nullable_to_non_nullable
              as int,
      reportsCount: null == reportsCount
          ? _value.reportsCount
          : reportsCount // ignore: cast_nullable_to_non_nullable
              as int,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationCode: freezed == verificationCode
          ? _value.verificationCode
          : verificationCode // ignore: cast_nullable_to_non_nullable
              as String?,
      verificationCodeExpire: freezed == verificationCodeExpire
          ? _value.verificationCodeExpire
          : verificationCodeExpire // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
      {required this.id,
      this.name,
      required this.email,
      this.phoneNumber,
      this.isActive = false,
      this.isSetup = false,
      this.budget = 0.0,
      this.avatarUrl,
      this.role = 'user',
      this.categoriesCount = 0,
      this.transactionsCount = 0,
      this.reportsCount = 0,
      this.refreshToken,
      this.verificationCode,
      this.verificationCodeExpire,
      required this.createdAt,
      required this.updatedAt});

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String id;
  @override
  final String? name;
  @override
  final String email;
  @override
  final String? phoneNumber;
  @override
  @JsonKey()
  final bool isActive;
  @override
  @JsonKey()
  final bool isSetup;
  @override
  @JsonKey()
  final double budget;
  @override
  final String? avatarUrl;
  @override
  @JsonKey()
  final String role;
  @override
  @JsonKey()
  final int categoriesCount;
  @override
  @JsonKey()
  final int transactionsCount;
  @override
  @JsonKey()
  final int reportsCount;
  @override
  final String? refreshToken;
  @override
  final String? verificationCode;
  @override
  final DateTime? verificationCodeExpire;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, isActive: $isActive, isSetup: $isSetup, budget: $budget, avatarUrl: $avatarUrl, role: $role, categoriesCount: $categoriesCount, transactionsCount: $transactionsCount, reportsCount: $reportsCount, refreshToken: $refreshToken, verificationCode: $verificationCode, verificationCodeExpire: $verificationCodeExpire, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSetup, isSetup) || other.isSetup == isSetup) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.avatarUrl, avatarUrl) ||
                other.avatarUrl == avatarUrl) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.categoriesCount, categoriesCount) ||
                other.categoriesCount == categoriesCount) &&
            (identical(other.transactionsCount, transactionsCount) ||
                other.transactionsCount == transactionsCount) &&
            (identical(other.reportsCount, reportsCount) ||
                other.reportsCount == reportsCount) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.verificationCode, verificationCode) ||
                other.verificationCode == verificationCode) &&
            (identical(other.verificationCodeExpire, verificationCodeExpire) ||
                other.verificationCodeExpire == verificationCodeExpire) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      email,
      phoneNumber,
      isActive,
      isSetup,
      budget,
      avatarUrl,
      role,
      categoriesCount,
      transactionsCount,
      reportsCount,
      refreshToken,
      verificationCode,
      verificationCodeExpire,
      createdAt,
      updatedAt);

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
      {required final String id,
      final String? name,
      required final String email,
      final String? phoneNumber,
      final bool isActive,
      final bool isSetup,
      final double budget,
      final String? avatarUrl,
      final String role,
      final int categoriesCount,
      final int transactionsCount,
      final int reportsCount,
      final String? refreshToken,
      final String? verificationCode,
      final DateTime? verificationCodeExpire,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get id;
  @override
  String? get name;
  @override
  String get email;
  @override
  String? get phoneNumber;
  @override
  bool get isActive;
  @override
  bool get isSetup;
  @override
  double get budget;
  @override
  String? get avatarUrl;
  @override
  String get role;
  @override
  int get categoriesCount;
  @override
  int get transactionsCount;
  @override
  int get reportsCount;
  @override
  String? get refreshToken;
  @override
  String? get verificationCode;
  @override
  DateTime? get verificationCodeExpire;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
