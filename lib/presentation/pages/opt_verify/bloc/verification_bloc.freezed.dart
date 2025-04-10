// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verification_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$VerificationEvent {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) sendCode,
    required TResult Function(String id, String code) verify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? sendCode,
    TResult? Function(String id, String code)? verify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? sendCode,
    TResult Function(String id, String code)? verify,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_Verify value) verify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_Verify value)? verify,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_Verify value)? verify,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of VerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $VerificationEventCopyWith<VerificationEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationEventCopyWith<$Res> {
  factory $VerificationEventCopyWith(
          VerificationEvent value, $Res Function(VerificationEvent) then) =
      _$VerificationEventCopyWithImpl<$Res, VerificationEvent>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$VerificationEventCopyWithImpl<$Res, $Val extends VerificationEvent>
    implements $VerificationEventCopyWith<$Res> {
  _$VerificationEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendCodeImplCopyWith<$Res>
    implements $VerificationEventCopyWith<$Res> {
  factory _$$SendCodeImplCopyWith(
          _$SendCodeImpl value, $Res Function(_$SendCodeImpl) then) =
      __$$SendCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$SendCodeImplCopyWithImpl<$Res>
    extends _$VerificationEventCopyWithImpl<$Res, _$SendCodeImpl>
    implements _$$SendCodeImplCopyWith<$Res> {
  __$$SendCodeImplCopyWithImpl(
      _$SendCodeImpl _value, $Res Function(_$SendCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$SendCodeImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SendCodeImpl implements _SendCode {
  const _$SendCodeImpl(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'VerificationEvent.sendCode(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendCodeImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  /// Create a copy of VerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendCodeImplCopyWith<_$SendCodeImpl> get copyWith =>
      __$$SendCodeImplCopyWithImpl<_$SendCodeImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) sendCode,
    required TResult Function(String id, String code) verify,
  }) {
    return sendCode(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? sendCode,
    TResult? Function(String id, String code)? verify,
  }) {
    return sendCode?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? sendCode,
    TResult Function(String id, String code)? verify,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_Verify value) verify,
  }) {
    return sendCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_Verify value)? verify,
  }) {
    return sendCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_Verify value)? verify,
    required TResult orElse(),
  }) {
    if (sendCode != null) {
      return sendCode(this);
    }
    return orElse();
  }
}

abstract class _SendCode implements VerificationEvent {
  const factory _SendCode(final String id) = _$SendCodeImpl;

  @override
  String get id;

  /// Create a copy of VerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendCodeImplCopyWith<_$SendCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyImplCopyWith<$Res>
    implements $VerificationEventCopyWith<$Res> {
  factory _$$VerifyImplCopyWith(
          _$VerifyImpl value, $Res Function(_$VerifyImpl) then) =
      __$$VerifyImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String code});
}

/// @nodoc
class __$$VerifyImplCopyWithImpl<$Res>
    extends _$VerificationEventCopyWithImpl<$Res, _$VerifyImpl>
    implements _$$VerifyImplCopyWith<$Res> {
  __$$VerifyImplCopyWithImpl(
      _$VerifyImpl _value, $Res Function(_$VerifyImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? code = null,
  }) {
    return _then(_$VerifyImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$VerifyImpl implements _Verify {
  const _$VerifyImpl(this.id, this.code);

  @override
  final String id;
  @override
  final String code;

  @override
  String toString() {
    return 'VerificationEvent.verify(id: $id, code: $code)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifyImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.code, code) || other.code == code));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, code);

  /// Create a copy of VerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifyImplCopyWith<_$VerifyImpl> get copyWith =>
      __$$VerifyImplCopyWithImpl<_$VerifyImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) sendCode,
    required TResult Function(String id, String code) verify,
  }) {
    return verify(id, code);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? sendCode,
    TResult? Function(String id, String code)? verify,
  }) {
    return verify?.call(id, code);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? sendCode,
    TResult Function(String id, String code)? verify,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(id, code);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SendCode value) sendCode,
    required TResult Function(_Verify value) verify,
  }) {
    return verify(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SendCode value)? sendCode,
    TResult? Function(_Verify value)? verify,
  }) {
    return verify?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SendCode value)? sendCode,
    TResult Function(_Verify value)? verify,
    required TResult orElse(),
  }) {
    if (verify != null) {
      return verify(this);
    }
    return orElse();
  }
}

abstract class _Verify implements VerificationEvent {
  const factory _Verify(final String id, final String code) = _$VerifyImpl;

  @override
  String get id;
  String get code;

  /// Create a copy of VerificationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifyImplCopyWith<_$VerifyImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VerificationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingCode,
    required TResult Function(bool isSuccess) codeSent,
    required TResult Function() verifying,
    required TResult Function(User user) verified,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingCode,
    TResult? Function(bool isSuccess)? codeSent,
    TResult? Function()? verifying,
    TResult? Function(User user)? verified,
    TResult? Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingCode,
    TResult Function(bool isSuccess)? codeSent,
    TResult Function()? verifying,
    TResult Function(User user)? verified,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingCode value) sendingCode,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingCode value)? sendingCode,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingCode value)? sendingCode,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerificationStateCopyWith<$Res> {
  factory $VerificationStateCopyWith(
          VerificationState value, $Res Function(VerificationState) then) =
      _$VerificationStateCopyWithImpl<$Res, VerificationState>;
}

/// @nodoc
class _$VerificationStateCopyWithImpl<$Res, $Val extends VerificationState>
    implements $VerificationStateCopyWith<$Res> {
  _$VerificationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'VerificationState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingCode,
    required TResult Function(bool isSuccess) codeSent,
    required TResult Function() verifying,
    required TResult Function(User user) verified,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingCode,
    TResult? Function(bool isSuccess)? codeSent,
    TResult? Function()? verifying,
    TResult? Function(User user)? verified,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingCode,
    TResult Function(bool isSuccess)? codeSent,
    TResult Function()? verifying,
    TResult Function(User user)? verified,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingCode value) sendingCode,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingCode value)? sendingCode,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingCode value)? sendingCode,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements VerificationState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SendingCodeImplCopyWith<$Res> {
  factory _$$SendingCodeImplCopyWith(
          _$SendingCodeImpl value, $Res Function(_$SendingCodeImpl) then) =
      __$$SendingCodeImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendingCodeImplCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$SendingCodeImpl>
    implements _$$SendingCodeImplCopyWith<$Res> {
  __$$SendingCodeImplCopyWithImpl(
      _$SendingCodeImpl _value, $Res Function(_$SendingCodeImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendingCodeImpl implements _SendingCode {
  const _$SendingCodeImpl();

  @override
  String toString() {
    return 'VerificationState.sendingCode()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendingCodeImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingCode,
    required TResult Function(bool isSuccess) codeSent,
    required TResult Function() verifying,
    required TResult Function(User user) verified,
    required TResult Function(String message) error,
  }) {
    return sendingCode();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingCode,
    TResult? Function(bool isSuccess)? codeSent,
    TResult? Function()? verifying,
    TResult? Function(User user)? verified,
    TResult? Function(String message)? error,
  }) {
    return sendingCode?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingCode,
    TResult Function(bool isSuccess)? codeSent,
    TResult Function()? verifying,
    TResult Function(User user)? verified,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (sendingCode != null) {
      return sendingCode();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingCode value) sendingCode,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return sendingCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingCode value)? sendingCode,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return sendingCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingCode value)? sendingCode,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (sendingCode != null) {
      return sendingCode(this);
    }
    return orElse();
  }
}

abstract class _SendingCode implements VerificationState {
  const factory _SendingCode() = _$SendingCodeImpl;
}

/// @nodoc
abstract class _$$CodeSentImplCopyWith<$Res> {
  factory _$$CodeSentImplCopyWith(
          _$CodeSentImpl value, $Res Function(_$CodeSentImpl) then) =
      __$$CodeSentImplCopyWithImpl<$Res>;
  @useResult
  $Res call({bool isSuccess});
}

/// @nodoc
class __$$CodeSentImplCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$CodeSentImpl>
    implements _$$CodeSentImplCopyWith<$Res> {
  __$$CodeSentImplCopyWithImpl(
      _$CodeSentImpl _value, $Res Function(_$CodeSentImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isSuccess = null,
  }) {
    return _then(_$CodeSentImpl(
      null == isSuccess
          ? _value.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$CodeSentImpl implements _CodeSent {
  const _$CodeSentImpl(this.isSuccess);

  @override
  final bool isSuccess;

  @override
  String toString() {
    return 'VerificationState.codeSent(isSuccess: $isSuccess)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CodeSentImpl &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isSuccess);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CodeSentImplCopyWith<_$CodeSentImpl> get copyWith =>
      __$$CodeSentImplCopyWithImpl<_$CodeSentImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingCode,
    required TResult Function(bool isSuccess) codeSent,
    required TResult Function() verifying,
    required TResult Function(User user) verified,
    required TResult Function(String message) error,
  }) {
    return codeSent(isSuccess);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingCode,
    TResult? Function(bool isSuccess)? codeSent,
    TResult? Function()? verifying,
    TResult? Function(User user)? verified,
    TResult? Function(String message)? error,
  }) {
    return codeSent?.call(isSuccess);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingCode,
    TResult Function(bool isSuccess)? codeSent,
    TResult Function()? verifying,
    TResult Function(User user)? verified,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (codeSent != null) {
      return codeSent(isSuccess);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingCode value) sendingCode,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return codeSent(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingCode value)? sendingCode,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return codeSent?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingCode value)? sendingCode,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (codeSent != null) {
      return codeSent(this);
    }
    return orElse();
  }
}

abstract class _CodeSent implements VerificationState {
  const factory _CodeSent(final bool isSuccess) = _$CodeSentImpl;

  bool get isSuccess;

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CodeSentImplCopyWith<_$CodeSentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$VerifyingImplCopyWith<$Res> {
  factory _$$VerifyingImplCopyWith(
          _$VerifyingImpl value, $Res Function(_$VerifyingImpl) then) =
      __$$VerifyingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$VerifyingImplCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$VerifyingImpl>
    implements _$$VerifyingImplCopyWith<$Res> {
  __$$VerifyingImplCopyWithImpl(
      _$VerifyingImpl _value, $Res Function(_$VerifyingImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$VerifyingImpl implements _Verifying {
  const _$VerifyingImpl();

  @override
  String toString() {
    return 'VerificationState.verifying()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$VerifyingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingCode,
    required TResult Function(bool isSuccess) codeSent,
    required TResult Function() verifying,
    required TResult Function(User user) verified,
    required TResult Function(String message) error,
  }) {
    return verifying();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingCode,
    TResult? Function(bool isSuccess)? codeSent,
    TResult? Function()? verifying,
    TResult? Function(User user)? verified,
    TResult? Function(String message)? error,
  }) {
    return verifying?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingCode,
    TResult Function(bool isSuccess)? codeSent,
    TResult Function()? verifying,
    TResult Function(User user)? verified,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (verifying != null) {
      return verifying();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingCode value) sendingCode,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return verifying(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingCode value)? sendingCode,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return verifying?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingCode value)? sendingCode,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (verifying != null) {
      return verifying(this);
    }
    return orElse();
  }
}

abstract class _Verifying implements VerificationState {
  const factory _Verifying() = _$VerifyingImpl;
}

/// @nodoc
abstract class _$$VerifiedImplCopyWith<$Res> {
  factory _$$VerifiedImplCopyWith(
          _$VerifiedImpl value, $Res Function(_$VerifiedImpl) then) =
      __$$VerifiedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});

  $UserCopyWith<$Res> get user;
}

/// @nodoc
class __$$VerifiedImplCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$VerifiedImpl>
    implements _$$VerifiedImplCopyWith<$Res> {
  __$$VerifiedImplCopyWithImpl(
      _$VerifiedImpl _value, $Res Function(_$VerifiedImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$VerifiedImpl(
      null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserCopyWith<$Res> get user {
    return $UserCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc

class _$VerifiedImpl implements _Verified {
  const _$VerifiedImpl(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'VerificationState.verified(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VerifiedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$VerifiedImplCopyWith<_$VerifiedImpl> get copyWith =>
      __$$VerifiedImplCopyWithImpl<_$VerifiedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingCode,
    required TResult Function(bool isSuccess) codeSent,
    required TResult Function() verifying,
    required TResult Function(User user) verified,
    required TResult Function(String message) error,
  }) {
    return verified(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingCode,
    TResult? Function(bool isSuccess)? codeSent,
    TResult? Function()? verifying,
    TResult? Function(User user)? verified,
    TResult? Function(String message)? error,
  }) {
    return verified?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingCode,
    TResult Function(bool isSuccess)? codeSent,
    TResult Function()? verifying,
    TResult Function(User user)? verified,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingCode value) sendingCode,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return verified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingCode value)? sendingCode,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return verified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingCode value)? sendingCode,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (verified != null) {
      return verified(this);
    }
    return orElse();
  }
}

abstract class _Verified implements VerificationState {
  const factory _Verified(final User user) = _$VerifiedImpl;

  User get user;

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$VerifiedImplCopyWith<_$VerifiedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$VerificationStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$ErrorImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'VerificationState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendingCode,
    required TResult Function(bool isSuccess) codeSent,
    required TResult Function() verifying,
    required TResult Function(User user) verified,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendingCode,
    TResult? Function(bool isSuccess)? codeSent,
    TResult? Function()? verifying,
    TResult? Function(User user)? verified,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendingCode,
    TResult Function(bool isSuccess)? codeSent,
    TResult Function()? verifying,
    TResult Function(User user)? verified,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendingCode value) sendingCode,
    required TResult Function(_CodeSent value) codeSent,
    required TResult Function(_Verifying value) verifying,
    required TResult Function(_Verified value) verified,
    required TResult Function(_Error value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendingCode value)? sendingCode,
    TResult? Function(_CodeSent value)? codeSent,
    TResult? Function(_Verifying value)? verifying,
    TResult? Function(_Verified value)? verified,
    TResult? Function(_Error value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendingCode value)? sendingCode,
    TResult Function(_CodeSent value)? codeSent,
    TResult Function(_Verifying value)? verifying,
    TResult Function(_Verified value)? verified,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements VerificationState {
  const factory _Error(final String message) = _$ErrorImpl;

  String get message;

  /// Create a copy of VerificationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
