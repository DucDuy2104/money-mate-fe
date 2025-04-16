// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool get isActive => throw _privateConstructorUsedError;
  bool get isSetup => throw _privateConstructorUsedError;
  double get budget => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  String get role => throw _privateConstructorUsedError;
  int get categoriesCount => throw _privateConstructorUsedError;
  int get transactionsCount => throw _privateConstructorUsedError;
  int get reportsCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {String id,
      String? name,
      String email,
      String? phoneNumber,
      bool isActive,
      bool isSetup,
      double budget,
      String? avatar,
      String role,
      int categoriesCount,
      int transactionsCount,
      int reportsCount,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of User
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
    Object? avatar = freezed,
    Object? role = null,
    Object? categoriesCount = null,
    Object? transactionsCount = null,
    Object? reportsCount = null,
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
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
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
abstract class _$$UserImplCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$UserImplCopyWith(
          _$UserImpl value, $Res Function(_$UserImpl) then) =
      __$$UserImplCopyWithImpl<$Res>;
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
      String? avatar,
      String role,
      int categoriesCount,
      int transactionsCount,
      int reportsCount,
      DateTime createdAt,
      DateTime updatedAt});
}

/// @nodoc
class __$$UserImplCopyWithImpl<$Res>
    extends _$UserCopyWithImpl<$Res, _$UserImpl>
    implements _$$UserImplCopyWith<$Res> {
  __$$UserImplCopyWithImpl(_$UserImpl _value, $Res Function(_$UserImpl) _then)
      : super(_value, _then);

  /// Create a copy of User
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
    Object? avatar = freezed,
    Object? role = null,
    Object? categoriesCount = null,
    Object? transactionsCount = null,
    Object? reportsCount = null,
    Object? createdAt = null,
    Object? updatedAt = null,
  }) {
    return _then(_$UserImpl(
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
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
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

class _$UserImpl implements _User {
  const _$UserImpl(
      {required this.id,
      this.name,
      required this.email,
      required this.phoneNumber,
      required this.isActive,
      required this.isSetup,
      required this.budget,
      this.avatar,
      required this.role,
      required this.categoriesCount,
      required this.transactionsCount,
      required this.reportsCount,
      required this.createdAt,
      required this.updatedAt});

  @override
  final String id;
  @override
  final String? name;
  @override
  final String email;
  @override
  final String? phoneNumber;
  @override
  final bool isActive;
  @override
  final bool isSetup;
  @override
  final double budget;
  @override
  final String? avatar;
  @override
  final String role;
  @override
  final int categoriesCount;
  @override
  final int transactionsCount;
  @override
  final int reportsCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;

  @override
  String toString() {
    return 'User(id: $id, name: $name, email: $email, phoneNumber: $phoneNumber, isActive: $isActive, isSetup: $isSetup, budget: $budget, avatar: $avatar, role: $role, categoriesCount: $categoriesCount, transactionsCount: $transactionsCount, reportsCount: $reportsCount, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isSetup, isSetup) || other.isSetup == isSetup) &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.categoriesCount, categoriesCount) ||
                other.categoriesCount == categoriesCount) &&
            (identical(other.transactionsCount, transactionsCount) ||
                other.transactionsCount == transactionsCount) &&
            (identical(other.reportsCount, reportsCount) ||
                other.reportsCount == reportsCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

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
      avatar,
      role,
      categoriesCount,
      transactionsCount,
      reportsCount,
      createdAt,
      updatedAt);

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      __$$UserImplCopyWithImpl<_$UserImpl>(this, _$identity);
}

abstract class _User implements User {
  const factory _User(
      {required final String id,
      final String? name,
      required final String email,
      required final String? phoneNumber,
      required final bool isActive,
      required final bool isSetup,
      required final double budget,
      final String? avatar,
      required final String role,
      required final int categoriesCount,
      required final int transactionsCount,
      required final int reportsCount,
      required final DateTime createdAt,
      required final DateTime updatedAt}) = _$UserImpl;

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
  String? get avatar;
  @override
  String get role;
  @override
  int get categoriesCount;
  @override
  int get transactionsCount;
  @override
  int get reportsCount;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;

  /// Create a copy of User
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserImplCopyWith<_$UserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
