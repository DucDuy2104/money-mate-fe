// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$Failure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic exception, StackTrace? stackTrace) server,
    required TResult Function(dynamic exception, StackTrace? stackTrace) client,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        network,
    required TResult Function(dynamic exception, StackTrace? stackTrace) parse,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        unknown,
    required TResult Function() loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult? Function()? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(ClientFailure value) client,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ParseFailure value) parse,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(LoggedOutFailure value) loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(ClientFailure value)? client,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ParseFailure value)? parse,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(LoggedOutFailure value)? loggedOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(ClientFailure value)? client,
    TResult Function(NetworkFailure value)? network,
    TResult Function(ParseFailure value)? parse,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(LoggedOutFailure value)? loggedOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$ServerFailureImplCopyWith<$Res> {
  factory _$$ServerFailureImplCopyWith(
          _$ServerFailureImpl value, $Res Function(_$ServerFailureImpl) then) =
      __$$ServerFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic exception, StackTrace? stackTrace});
}

/// @nodoc
class __$$ServerFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerFailureImpl>
    implements _$$ServerFailureImplCopyWith<$Res> {
  __$$ServerFailureImplCopyWithImpl(
      _$ServerFailureImpl _value, $Res Function(_$ServerFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ServerFailureImpl(
      freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as dynamic,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ServerFailureImpl extends ServerFailure with DiagnosticableTreeMixin {
  _$ServerFailureImpl(this.exception, [this.stackTrace]) : super._();

  @override
  final dynamic exception;
  @override
  final StackTrace? stackTrace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Failure.server(exception: $exception, stackTrace: $stackTrace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Failure.server'))
      ..add(DiagnosticsProperty('exception', exception))
      ..add(DiagnosticsProperty('stackTrace', stackTrace));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerFailureImpl &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(exception), stackTrace);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      __$$ServerFailureImplCopyWithImpl<_$ServerFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic exception, StackTrace? stackTrace) server,
    required TResult Function(dynamic exception, StackTrace? stackTrace) client,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        network,
    required TResult Function(dynamic exception, StackTrace? stackTrace) parse,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        unknown,
    required TResult Function() loggedOut,
  }) {
    return server(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult? Function()? loggedOut,
  }) {
    return server?.call(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(exception, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(ClientFailure value) client,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ParseFailure value) parse,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(LoggedOutFailure value) loggedOut,
  }) {
    return server(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(ClientFailure value)? client,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ParseFailure value)? parse,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(LoggedOutFailure value)? loggedOut,
  }) {
    return server?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(ClientFailure value)? client,
    TResult Function(NetworkFailure value)? network,
    TResult Function(ParseFailure value)? parse,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(LoggedOutFailure value)? loggedOut,
    required TResult orElse(),
  }) {
    if (server != null) {
      return server(this);
    }
    return orElse();
  }
}

abstract class ServerFailure extends Failure {
  factory ServerFailure(final dynamic exception,
      [final StackTrace? stackTrace]) = _$ServerFailureImpl;
  ServerFailure._() : super._();

  dynamic get exception;
  StackTrace? get stackTrace;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerFailureImplCopyWith<_$ServerFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClientFailureImplCopyWith<$Res> {
  factory _$$ClientFailureImplCopyWith(
          _$ClientFailureImpl value, $Res Function(_$ClientFailureImpl) then) =
      __$$ClientFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic exception, StackTrace? stackTrace});
}

/// @nodoc
class __$$ClientFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ClientFailureImpl>
    implements _$$ClientFailureImplCopyWith<$Res> {
  __$$ClientFailureImplCopyWithImpl(
      _$ClientFailureImpl _value, $Res Function(_$ClientFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ClientFailureImpl(
      freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as dynamic,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ClientFailureImpl extends ClientFailure with DiagnosticableTreeMixin {
  _$ClientFailureImpl(this.exception, [this.stackTrace]) : super._();

  @override
  final dynamic exception;
  @override
  final StackTrace? stackTrace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Failure.client(exception: $exception, stackTrace: $stackTrace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Failure.client'))
      ..add(DiagnosticsProperty('exception', exception))
      ..add(DiagnosticsProperty('stackTrace', stackTrace));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClientFailureImpl &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(exception), stackTrace);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClientFailureImplCopyWith<_$ClientFailureImpl> get copyWith =>
      __$$ClientFailureImplCopyWithImpl<_$ClientFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic exception, StackTrace? stackTrace) server,
    required TResult Function(dynamic exception, StackTrace? stackTrace) client,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        network,
    required TResult Function(dynamic exception, StackTrace? stackTrace) parse,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        unknown,
    required TResult Function() loggedOut,
  }) {
    return client(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult? Function()? loggedOut,
  }) {
    return client?.call(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (client != null) {
      return client(exception, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(ClientFailure value) client,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ParseFailure value) parse,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(LoggedOutFailure value) loggedOut,
  }) {
    return client(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(ClientFailure value)? client,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ParseFailure value)? parse,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(LoggedOutFailure value)? loggedOut,
  }) {
    return client?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(ClientFailure value)? client,
    TResult Function(NetworkFailure value)? network,
    TResult Function(ParseFailure value)? parse,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(LoggedOutFailure value)? loggedOut,
    required TResult orElse(),
  }) {
    if (client != null) {
      return client(this);
    }
    return orElse();
  }
}

abstract class ClientFailure extends Failure {
  factory ClientFailure(final dynamic exception,
      [final StackTrace? stackTrace]) = _$ClientFailureImpl;
  ClientFailure._() : super._();

  dynamic get exception;
  StackTrace? get stackTrace;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClientFailureImplCopyWith<_$ClientFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkFailureImplCopyWith<$Res> {
  factory _$$NetworkFailureImplCopyWith(_$NetworkFailureImpl value,
          $Res Function(_$NetworkFailureImpl) then) =
      __$$NetworkFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic exception, StackTrace? stackTrace});
}

/// @nodoc
class __$$NetworkFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkFailureImpl>
    implements _$$NetworkFailureImplCopyWith<$Res> {
  __$$NetworkFailureImplCopyWithImpl(
      _$NetworkFailureImpl _value, $Res Function(_$NetworkFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$NetworkFailureImpl(
      freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as dynamic,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$NetworkFailureImpl extends NetworkFailure with DiagnosticableTreeMixin {
  _$NetworkFailureImpl(this.exception, [this.stackTrace]) : super._();

  @override
  final dynamic exception;
  @override
  final StackTrace? stackTrace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Failure.network(exception: $exception, stackTrace: $stackTrace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Failure.network'))
      ..add(DiagnosticsProperty('exception', exception))
      ..add(DiagnosticsProperty('stackTrace', stackTrace));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkFailureImpl &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(exception), stackTrace);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      __$$NetworkFailureImplCopyWithImpl<_$NetworkFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic exception, StackTrace? stackTrace) server,
    required TResult Function(dynamic exception, StackTrace? stackTrace) client,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        network,
    required TResult Function(dynamic exception, StackTrace? stackTrace) parse,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        unknown,
    required TResult Function() loggedOut,
  }) {
    return network(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult? Function()? loggedOut,
  }) {
    return network?.call(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(exception, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(ClientFailure value) client,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ParseFailure value) parse,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(LoggedOutFailure value) loggedOut,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(ClientFailure value)? client,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ParseFailure value)? parse,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(LoggedOutFailure value)? loggedOut,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(ClientFailure value)? client,
    TResult Function(NetworkFailure value)? network,
    TResult Function(ParseFailure value)? parse,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(LoggedOutFailure value)? loggedOut,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }
}

abstract class NetworkFailure extends Failure {
  factory NetworkFailure(final dynamic exception,
      [final StackTrace? stackTrace]) = _$NetworkFailureImpl;
  NetworkFailure._() : super._();

  dynamic get exception;
  StackTrace? get stackTrace;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkFailureImplCopyWith<_$NetworkFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ParseFailureImplCopyWith<$Res> {
  factory _$$ParseFailureImplCopyWith(
          _$ParseFailureImpl value, $Res Function(_$ParseFailureImpl) then) =
      __$$ParseFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic exception, StackTrace? stackTrace});
}

/// @nodoc
class __$$ParseFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ParseFailureImpl>
    implements _$$ParseFailureImplCopyWith<$Res> {
  __$$ParseFailureImplCopyWithImpl(
      _$ParseFailureImpl _value, $Res Function(_$ParseFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$ParseFailureImpl(
      freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as dynamic,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$ParseFailureImpl extends ParseFailure with DiagnosticableTreeMixin {
  _$ParseFailureImpl(this.exception, [this.stackTrace]) : super._();

  @override
  final dynamic exception;
  @override
  final StackTrace? stackTrace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Failure.parse(exception: $exception, stackTrace: $stackTrace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Failure.parse'))
      ..add(DiagnosticsProperty('exception', exception))
      ..add(DiagnosticsProperty('stackTrace', stackTrace));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ParseFailureImpl &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(exception), stackTrace);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ParseFailureImplCopyWith<_$ParseFailureImpl> get copyWith =>
      __$$ParseFailureImplCopyWithImpl<_$ParseFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic exception, StackTrace? stackTrace) server,
    required TResult Function(dynamic exception, StackTrace? stackTrace) client,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        network,
    required TResult Function(dynamic exception, StackTrace? stackTrace) parse,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        unknown,
    required TResult Function() loggedOut,
  }) {
    return parse(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult? Function()? loggedOut,
  }) {
    return parse?.call(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(exception, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(ClientFailure value) client,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ParseFailure value) parse,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(LoggedOutFailure value) loggedOut,
  }) {
    return parse(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(ClientFailure value)? client,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ParseFailure value)? parse,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(LoggedOutFailure value)? loggedOut,
  }) {
    return parse?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(ClientFailure value)? client,
    TResult Function(NetworkFailure value)? network,
    TResult Function(ParseFailure value)? parse,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(LoggedOutFailure value)? loggedOut,
    required TResult orElse(),
  }) {
    if (parse != null) {
      return parse(this);
    }
    return orElse();
  }
}

abstract class ParseFailure extends Failure {
  factory ParseFailure(final dynamic exception,
      [final StackTrace? stackTrace]) = _$ParseFailureImpl;
  ParseFailure._() : super._();

  dynamic get exception;
  StackTrace? get stackTrace;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ParseFailureImplCopyWith<_$ParseFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnknownFailureImplCopyWith<$Res> {
  factory _$$UnknownFailureImplCopyWith(_$UnknownFailureImpl value,
          $Res Function(_$UnknownFailureImpl) then) =
      __$$UnknownFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic exception, StackTrace? stackTrace});
}

/// @nodoc
class __$$UnknownFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnknownFailureImpl>
    implements _$$UnknownFailureImplCopyWith<$Res> {
  __$$UnknownFailureImplCopyWithImpl(
      _$UnknownFailureImpl _value, $Res Function(_$UnknownFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exception = freezed,
    Object? stackTrace = freezed,
  }) {
    return _then(_$UnknownFailureImpl(
      freezed == exception
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as dynamic,
      freezed == stackTrace
          ? _value.stackTrace
          : stackTrace // ignore: cast_nullable_to_non_nullable
              as StackTrace?,
    ));
  }
}

/// @nodoc

class _$UnknownFailureImpl extends UnknownFailure with DiagnosticableTreeMixin {
  _$UnknownFailureImpl(this.exception, [this.stackTrace]) : super._();

  @override
  final dynamic exception;
  @override
  final StackTrace? stackTrace;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Failure.unknown(exception: $exception, stackTrace: $stackTrace)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Failure.unknown'))
      ..add(DiagnosticsProperty('exception', exception))
      ..add(DiagnosticsProperty('stackTrace', stackTrace));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnknownFailureImpl &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            (identical(other.stackTrace, stackTrace) ||
                other.stackTrace == stackTrace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(exception), stackTrace);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      __$$UnknownFailureImplCopyWithImpl<_$UnknownFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic exception, StackTrace? stackTrace) server,
    required TResult Function(dynamic exception, StackTrace? stackTrace) client,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        network,
    required TResult Function(dynamic exception, StackTrace? stackTrace) parse,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        unknown,
    required TResult Function() loggedOut,
  }) {
    return unknown(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult? Function()? loggedOut,
  }) {
    return unknown?.call(exception, stackTrace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(exception, stackTrace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(ClientFailure value) client,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ParseFailure value) parse,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(LoggedOutFailure value) loggedOut,
  }) {
    return unknown(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(ClientFailure value)? client,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ParseFailure value)? parse,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(LoggedOutFailure value)? loggedOut,
  }) {
    return unknown?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(ClientFailure value)? client,
    TResult Function(NetworkFailure value)? network,
    TResult Function(ParseFailure value)? parse,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(LoggedOutFailure value)? loggedOut,
    required TResult orElse(),
  }) {
    if (unknown != null) {
      return unknown(this);
    }
    return orElse();
  }
}

abstract class UnknownFailure extends Failure {
  factory UnknownFailure(final dynamic exception,
      [final StackTrace? stackTrace]) = _$UnknownFailureImpl;
  UnknownFailure._() : super._();

  dynamic get exception;
  StackTrace? get stackTrace;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnknownFailureImplCopyWith<_$UnknownFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoggedOutFailureImplCopyWith<$Res> {
  factory _$$LoggedOutFailureImplCopyWith(_$LoggedOutFailureImpl value,
          $Res Function(_$LoggedOutFailureImpl) then) =
      __$$LoggedOutFailureImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoggedOutFailureImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$LoggedOutFailureImpl>
    implements _$$LoggedOutFailureImplCopyWith<$Res> {
  __$$LoggedOutFailureImplCopyWithImpl(_$LoggedOutFailureImpl _value,
      $Res Function(_$LoggedOutFailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoggedOutFailureImpl extends LoggedOutFailure
    with DiagnosticableTreeMixin {
  _$LoggedOutFailureImpl() : super._();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Failure.loggedOut()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'Failure.loggedOut'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoggedOutFailureImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(dynamic exception, StackTrace? stackTrace) server,
    required TResult Function(dynamic exception, StackTrace? stackTrace) client,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        network,
    required TResult Function(dynamic exception, StackTrace? stackTrace) parse,
    required TResult Function(dynamic exception, StackTrace? stackTrace)
        unknown,
    required TResult Function() loggedOut,
  }) {
    return loggedOut();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult? Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult? Function()? loggedOut,
  }) {
    return loggedOut?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(dynamic exception, StackTrace? stackTrace)? server,
    TResult Function(dynamic exception, StackTrace? stackTrace)? client,
    TResult Function(dynamic exception, StackTrace? stackTrace)? network,
    TResult Function(dynamic exception, StackTrace? stackTrace)? parse,
    TResult Function(dynamic exception, StackTrace? stackTrace)? unknown,
    TResult Function()? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerFailure value) server,
    required TResult Function(ClientFailure value) client,
    required TResult Function(NetworkFailure value) network,
    required TResult Function(ParseFailure value) parse,
    required TResult Function(UnknownFailure value) unknown,
    required TResult Function(LoggedOutFailure value) loggedOut,
  }) {
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerFailure value)? server,
    TResult? Function(ClientFailure value)? client,
    TResult? Function(NetworkFailure value)? network,
    TResult? Function(ParseFailure value)? parse,
    TResult? Function(UnknownFailure value)? unknown,
    TResult? Function(LoggedOutFailure value)? loggedOut,
  }) {
    return loggedOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerFailure value)? server,
    TResult Function(ClientFailure value)? client,
    TResult Function(NetworkFailure value)? network,
    TResult Function(ParseFailure value)? parse,
    TResult Function(UnknownFailure value)? unknown,
    TResult Function(LoggedOutFailure value)? loggedOut,
    required TResult orElse(),
  }) {
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class LoggedOutFailure extends Failure {
  factory LoggedOutFailure() = _$LoggedOutFailureImpl;
  LoggedOutFailure._() : super._();
}
