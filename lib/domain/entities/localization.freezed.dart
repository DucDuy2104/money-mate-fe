// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Localization {
  String get name => throw _privateConstructorUsedError;
  Locale get locale => throw _privateConstructorUsedError;

  /// Create a copy of Localization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LocalizationCopyWith<Localization> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationCopyWith<$Res> {
  factory $LocalizationCopyWith(
          Localization value, $Res Function(Localization) then) =
      _$LocalizationCopyWithImpl<$Res, Localization>;
  @useResult
  $Res call({String name, Locale locale});
}

/// @nodoc
class _$LocalizationCopyWithImpl<$Res, $Val extends Localization>
    implements $LocalizationCopyWith<$Res> {
  _$LocalizationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Localization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? locale = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocalizationImplCopyWith<$Res>
    implements $LocalizationCopyWith<$Res> {
  factory _$$LocalizationImplCopyWith(
          _$LocalizationImpl value, $Res Function(_$LocalizationImpl) then) =
      __$$LocalizationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, Locale locale});
}

/// @nodoc
class __$$LocalizationImplCopyWithImpl<$Res>
    extends _$LocalizationCopyWithImpl<$Res, _$LocalizationImpl>
    implements _$$LocalizationImplCopyWith<$Res> {
  __$$LocalizationImplCopyWithImpl(
      _$LocalizationImpl _value, $Res Function(_$LocalizationImpl) _then)
      : super(_value, _then);

  /// Create a copy of Localization
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? locale = null,
  }) {
    return _then(_$LocalizationImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      locale: null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$LocalizationImpl implements _Localization {
  const _$LocalizationImpl({required this.name, required this.locale});

  @override
  final String name;
  @override
  final Locale locale;

  @override
  String toString() {
    return 'Localization(name: $name, locale: $locale)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocalizationImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, locale);

  /// Create a copy of Localization
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LocalizationImplCopyWith<_$LocalizationImpl> get copyWith =>
      __$$LocalizationImplCopyWithImpl<_$LocalizationImpl>(this, _$identity);
}

abstract class _Localization implements Localization {
  const factory _Localization(
      {required final String name,
      required final Locale locale}) = _$LocalizationImpl;

  @override
  String get name;
  @override
  Locale get locale;

  /// Create a copy of Localization
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LocalizationImplCopyWith<_$LocalizationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
