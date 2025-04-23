// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VoidCallback callback) getData,
    required TResult Function() reloadData,
    required TResult Function() connect,
    required TResult Function() reloadCategories,
    required TResult Function() logout,
    required TResult Function() loadMoreTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VoidCallback callback)? getData,
    TResult? Function()? reloadData,
    TResult? Function()? connect,
    TResult? Function()? reloadCategories,
    TResult? Function()? logout,
    TResult? Function()? loadMoreTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VoidCallback callback)? getData,
    TResult Function()? reloadData,
    TResult Function()? connect,
    TResult Function()? reloadCategories,
    TResult Function()? logout,
    TResult Function()? loadMoreTransactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetData value) getData,
    required TResult Function(_ReloadData value) reloadData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_ReloadCategories value) reloadCategories,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LoadMoreTransactions value) loadMoreTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetData value)? getData,
    TResult? Function(_ReloadData value)? reloadData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_ReloadCategories value)? reloadCategories,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LoadMoreTransactions value)? loadMoreTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetData value)? getData,
    TResult Function(_ReloadData value)? reloadData,
    TResult Function(_Connect value)? connect,
    TResult Function(_ReloadCategories value)? reloadCategories,
    TResult Function(_Logout value)? logout,
    TResult Function(_LoadMoreTransactions value)? loadMoreTransactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GetDataImplCopyWith<$Res> {
  factory _$$GetDataImplCopyWith(
          _$GetDataImpl value, $Res Function(_$GetDataImpl) then) =
      __$$GetDataImplCopyWithImpl<$Res>;
  @useResult
  $Res call({VoidCallback callback});
}

/// @nodoc
class __$$GetDataImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetDataImpl>
    implements _$$GetDataImplCopyWith<$Res> {
  __$$GetDataImplCopyWithImpl(
      _$GetDataImpl _value, $Res Function(_$GetDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? callback = null,
  }) {
    return _then(_$GetDataImpl(
      null == callback
          ? _value.callback
          : callback // ignore: cast_nullable_to_non_nullable
              as VoidCallback,
    ));
  }
}

/// @nodoc

class _$GetDataImpl implements _GetData {
  const _$GetDataImpl(this.callback);

  @override
  final VoidCallback callback;

  @override
  String toString() {
    return 'HomeEvent.getData(callback: $callback)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetDataImpl &&
            (identical(other.callback, callback) ||
                other.callback == callback));
  }

  @override
  int get hashCode => Object.hash(runtimeType, callback);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetDataImplCopyWith<_$GetDataImpl> get copyWith =>
      __$$GetDataImplCopyWithImpl<_$GetDataImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VoidCallback callback) getData,
    required TResult Function() reloadData,
    required TResult Function() connect,
    required TResult Function() reloadCategories,
    required TResult Function() logout,
    required TResult Function() loadMoreTransactions,
  }) {
    return getData(callback);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VoidCallback callback)? getData,
    TResult? Function()? reloadData,
    TResult? Function()? connect,
    TResult? Function()? reloadCategories,
    TResult? Function()? logout,
    TResult? Function()? loadMoreTransactions,
  }) {
    return getData?.call(callback);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VoidCallback callback)? getData,
    TResult Function()? reloadData,
    TResult Function()? connect,
    TResult Function()? reloadCategories,
    TResult Function()? logout,
    TResult Function()? loadMoreTransactions,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData(callback);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetData value) getData,
    required TResult Function(_ReloadData value) reloadData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_ReloadCategories value) reloadCategories,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LoadMoreTransactions value) loadMoreTransactions,
  }) {
    return getData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetData value)? getData,
    TResult? Function(_ReloadData value)? reloadData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_ReloadCategories value)? reloadCategories,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LoadMoreTransactions value)? loadMoreTransactions,
  }) {
    return getData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetData value)? getData,
    TResult Function(_ReloadData value)? reloadData,
    TResult Function(_Connect value)? connect,
    TResult Function(_ReloadCategories value)? reloadCategories,
    TResult Function(_Logout value)? logout,
    TResult Function(_LoadMoreTransactions value)? loadMoreTransactions,
    required TResult orElse(),
  }) {
    if (getData != null) {
      return getData(this);
    }
    return orElse();
  }
}

abstract class _GetData implements HomeEvent {
  const factory _GetData(final VoidCallback callback) = _$GetDataImpl;

  VoidCallback get callback;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetDataImplCopyWith<_$GetDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ReloadDataImplCopyWith<$Res> {
  factory _$$ReloadDataImplCopyWith(
          _$ReloadDataImpl value, $Res Function(_$ReloadDataImpl) then) =
      __$$ReloadDataImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReloadDataImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$ReloadDataImpl>
    implements _$$ReloadDataImplCopyWith<$Res> {
  __$$ReloadDataImplCopyWithImpl(
      _$ReloadDataImpl _value, $Res Function(_$ReloadDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReloadDataImpl implements _ReloadData {
  const _$ReloadDataImpl();

  @override
  String toString() {
    return 'HomeEvent.reloadData()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReloadDataImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VoidCallback callback) getData,
    required TResult Function() reloadData,
    required TResult Function() connect,
    required TResult Function() reloadCategories,
    required TResult Function() logout,
    required TResult Function() loadMoreTransactions,
  }) {
    return reloadData();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VoidCallback callback)? getData,
    TResult? Function()? reloadData,
    TResult? Function()? connect,
    TResult? Function()? reloadCategories,
    TResult? Function()? logout,
    TResult? Function()? loadMoreTransactions,
  }) {
    return reloadData?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VoidCallback callback)? getData,
    TResult Function()? reloadData,
    TResult Function()? connect,
    TResult Function()? reloadCategories,
    TResult Function()? logout,
    TResult Function()? loadMoreTransactions,
    required TResult orElse(),
  }) {
    if (reloadData != null) {
      return reloadData();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetData value) getData,
    required TResult Function(_ReloadData value) reloadData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_ReloadCategories value) reloadCategories,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LoadMoreTransactions value) loadMoreTransactions,
  }) {
    return reloadData(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetData value)? getData,
    TResult? Function(_ReloadData value)? reloadData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_ReloadCategories value)? reloadCategories,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LoadMoreTransactions value)? loadMoreTransactions,
  }) {
    return reloadData?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetData value)? getData,
    TResult Function(_ReloadData value)? reloadData,
    TResult Function(_Connect value)? connect,
    TResult Function(_ReloadCategories value)? reloadCategories,
    TResult Function(_Logout value)? logout,
    TResult Function(_LoadMoreTransactions value)? loadMoreTransactions,
    required TResult orElse(),
  }) {
    if (reloadData != null) {
      return reloadData(this);
    }
    return orElse();
  }
}

abstract class _ReloadData implements HomeEvent {
  const factory _ReloadData() = _$ReloadDataImpl;
}

/// @nodoc
abstract class _$$ConnectImplCopyWith<$Res> {
  factory _$$ConnectImplCopyWith(
          _$ConnectImpl value, $Res Function(_$ConnectImpl) then) =
      __$$ConnectImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ConnectImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$ConnectImpl>
    implements _$$ConnectImplCopyWith<$Res> {
  __$$ConnectImplCopyWithImpl(
      _$ConnectImpl _value, $Res Function(_$ConnectImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ConnectImpl implements _Connect {
  const _$ConnectImpl();

  @override
  String toString() {
    return 'HomeEvent.connect()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ConnectImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VoidCallback callback) getData,
    required TResult Function() reloadData,
    required TResult Function() connect,
    required TResult Function() reloadCategories,
    required TResult Function() logout,
    required TResult Function() loadMoreTransactions,
  }) {
    return connect();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VoidCallback callback)? getData,
    TResult? Function()? reloadData,
    TResult? Function()? connect,
    TResult? Function()? reloadCategories,
    TResult? Function()? logout,
    TResult? Function()? loadMoreTransactions,
  }) {
    return connect?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VoidCallback callback)? getData,
    TResult Function()? reloadData,
    TResult Function()? connect,
    TResult Function()? reloadCategories,
    TResult Function()? logout,
    TResult Function()? loadMoreTransactions,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetData value) getData,
    required TResult Function(_ReloadData value) reloadData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_ReloadCategories value) reloadCategories,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LoadMoreTransactions value) loadMoreTransactions,
  }) {
    return connect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetData value)? getData,
    TResult? Function(_ReloadData value)? reloadData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_ReloadCategories value)? reloadCategories,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LoadMoreTransactions value)? loadMoreTransactions,
  }) {
    return connect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetData value)? getData,
    TResult Function(_ReloadData value)? reloadData,
    TResult Function(_Connect value)? connect,
    TResult Function(_ReloadCategories value)? reloadCategories,
    TResult Function(_Logout value)? logout,
    TResult Function(_LoadMoreTransactions value)? loadMoreTransactions,
    required TResult orElse(),
  }) {
    if (connect != null) {
      return connect(this);
    }
    return orElse();
  }
}

abstract class _Connect implements HomeEvent {
  const factory _Connect() = _$ConnectImpl;
}

/// @nodoc
abstract class _$$ReloadCategoriesImplCopyWith<$Res> {
  factory _$$ReloadCategoriesImplCopyWith(_$ReloadCategoriesImpl value,
          $Res Function(_$ReloadCategoriesImpl) then) =
      __$$ReloadCategoriesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ReloadCategoriesImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$ReloadCategoriesImpl>
    implements _$$ReloadCategoriesImplCopyWith<$Res> {
  __$$ReloadCategoriesImplCopyWithImpl(_$ReloadCategoriesImpl _value,
      $Res Function(_$ReloadCategoriesImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$ReloadCategoriesImpl implements _ReloadCategories {
  const _$ReloadCategoriesImpl();

  @override
  String toString() {
    return 'HomeEvent.reloadCategories()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ReloadCategoriesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VoidCallback callback) getData,
    required TResult Function() reloadData,
    required TResult Function() connect,
    required TResult Function() reloadCategories,
    required TResult Function() logout,
    required TResult Function() loadMoreTransactions,
  }) {
    return reloadCategories();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VoidCallback callback)? getData,
    TResult? Function()? reloadData,
    TResult? Function()? connect,
    TResult? Function()? reloadCategories,
    TResult? Function()? logout,
    TResult? Function()? loadMoreTransactions,
  }) {
    return reloadCategories?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VoidCallback callback)? getData,
    TResult Function()? reloadData,
    TResult Function()? connect,
    TResult Function()? reloadCategories,
    TResult Function()? logout,
    TResult Function()? loadMoreTransactions,
    required TResult orElse(),
  }) {
    if (reloadCategories != null) {
      return reloadCategories();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetData value) getData,
    required TResult Function(_ReloadData value) reloadData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_ReloadCategories value) reloadCategories,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LoadMoreTransactions value) loadMoreTransactions,
  }) {
    return reloadCategories(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetData value)? getData,
    TResult? Function(_ReloadData value)? reloadData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_ReloadCategories value)? reloadCategories,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LoadMoreTransactions value)? loadMoreTransactions,
  }) {
    return reloadCategories?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetData value)? getData,
    TResult Function(_ReloadData value)? reloadData,
    TResult Function(_Connect value)? connect,
    TResult Function(_ReloadCategories value)? reloadCategories,
    TResult Function(_Logout value)? logout,
    TResult Function(_LoadMoreTransactions value)? loadMoreTransactions,
    required TResult orElse(),
  }) {
    if (reloadCategories != null) {
      return reloadCategories(this);
    }
    return orElse();
  }
}

abstract class _ReloadCategories implements HomeEvent {
  const factory _ReloadCategories() = _$ReloadCategoriesImpl;
}

/// @nodoc
abstract class _$$LogoutImplCopyWith<$Res> {
  factory _$$LogoutImplCopyWith(
          _$LogoutImpl value, $Res Function(_$LogoutImpl) then) =
      __$$LogoutImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$LogoutImpl>
    implements _$$LogoutImplCopyWith<$Res> {
  __$$LogoutImplCopyWithImpl(
      _$LogoutImpl _value, $Res Function(_$LogoutImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LogoutImpl implements _Logout {
  const _$LogoutImpl();

  @override
  String toString() {
    return 'HomeEvent.logout()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VoidCallback callback) getData,
    required TResult Function() reloadData,
    required TResult Function() connect,
    required TResult Function() reloadCategories,
    required TResult Function() logout,
    required TResult Function() loadMoreTransactions,
  }) {
    return logout();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VoidCallback callback)? getData,
    TResult? Function()? reloadData,
    TResult? Function()? connect,
    TResult? Function()? reloadCategories,
    TResult? Function()? logout,
    TResult? Function()? loadMoreTransactions,
  }) {
    return logout?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VoidCallback callback)? getData,
    TResult Function()? reloadData,
    TResult Function()? connect,
    TResult Function()? reloadCategories,
    TResult Function()? logout,
    TResult Function()? loadMoreTransactions,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetData value) getData,
    required TResult Function(_ReloadData value) reloadData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_ReloadCategories value) reloadCategories,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LoadMoreTransactions value) loadMoreTransactions,
  }) {
    return logout(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetData value)? getData,
    TResult? Function(_ReloadData value)? reloadData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_ReloadCategories value)? reloadCategories,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LoadMoreTransactions value)? loadMoreTransactions,
  }) {
    return logout?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetData value)? getData,
    TResult Function(_ReloadData value)? reloadData,
    TResult Function(_Connect value)? connect,
    TResult Function(_ReloadCategories value)? reloadCategories,
    TResult Function(_Logout value)? logout,
    TResult Function(_LoadMoreTransactions value)? loadMoreTransactions,
    required TResult orElse(),
  }) {
    if (logout != null) {
      return logout(this);
    }
    return orElse();
  }
}

abstract class _Logout implements HomeEvent {
  const factory _Logout() = _$LogoutImpl;
}

/// @nodoc
abstract class _$$LoadMoreTransactionsImplCopyWith<$Res> {
  factory _$$LoadMoreTransactionsImplCopyWith(_$LoadMoreTransactionsImpl value,
          $Res Function(_$LoadMoreTransactionsImpl) then) =
      __$$LoadMoreTransactionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadMoreTransactionsImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$LoadMoreTransactionsImpl>
    implements _$$LoadMoreTransactionsImplCopyWith<$Res> {
  __$$LoadMoreTransactionsImplCopyWithImpl(_$LoadMoreTransactionsImpl _value,
      $Res Function(_$LoadMoreTransactionsImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadMoreTransactionsImpl implements _LoadMoreTransactions {
  const _$LoadMoreTransactionsImpl();

  @override
  String toString() {
    return 'HomeEvent.loadMoreTransactions()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadMoreTransactionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(VoidCallback callback) getData,
    required TResult Function() reloadData,
    required TResult Function() connect,
    required TResult Function() reloadCategories,
    required TResult Function() logout,
    required TResult Function() loadMoreTransactions,
  }) {
    return loadMoreTransactions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(VoidCallback callback)? getData,
    TResult? Function()? reloadData,
    TResult? Function()? connect,
    TResult? Function()? reloadCategories,
    TResult? Function()? logout,
    TResult? Function()? loadMoreTransactions,
  }) {
    return loadMoreTransactions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(VoidCallback callback)? getData,
    TResult Function()? reloadData,
    TResult Function()? connect,
    TResult Function()? reloadCategories,
    TResult Function()? logout,
    TResult Function()? loadMoreTransactions,
    required TResult orElse(),
  }) {
    if (loadMoreTransactions != null) {
      return loadMoreTransactions();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_GetData value) getData,
    required TResult Function(_ReloadData value) reloadData,
    required TResult Function(_Connect value) connect,
    required TResult Function(_ReloadCategories value) reloadCategories,
    required TResult Function(_Logout value) logout,
    required TResult Function(_LoadMoreTransactions value) loadMoreTransactions,
  }) {
    return loadMoreTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_GetData value)? getData,
    TResult? Function(_ReloadData value)? reloadData,
    TResult? Function(_Connect value)? connect,
    TResult? Function(_ReloadCategories value)? reloadCategories,
    TResult? Function(_Logout value)? logout,
    TResult? Function(_LoadMoreTransactions value)? loadMoreTransactions,
  }) {
    return loadMoreTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_GetData value)? getData,
    TResult Function(_ReloadData value)? reloadData,
    TResult Function(_Connect value)? connect,
    TResult Function(_ReloadCategories value)? reloadCategories,
    TResult Function(_Logout value)? logout,
    TResult Function(_LoadMoreTransactions value)? loadMoreTransactions,
    required TResult orElse(),
  }) {
    if (loadMoreTransactions != null) {
      return loadMoreTransactions(this);
    }
    return orElse();
  }
}

abstract class _LoadMoreTransactions implements HomeEvent {
  const factory _LoadMoreTransactions() = _$LoadMoreTransactionsImpl;
}

/// @nodoc
mixin _$HomeState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(HomeData data) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(HomeData data)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(HomeData data)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
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
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'HomeState.initial()';
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
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(HomeData data) loaded,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(HomeData data)? loaded,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(HomeData data)? loaded,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'HomeState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(HomeData data) loaded,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(HomeData data)? loaded,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(HomeData data)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements HomeState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'HomeState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of HomeState
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
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(HomeData data) loaded,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(HomeData data)? loaded,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(HomeData data)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements HomeState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({HomeData data});

  $HomeDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$LoadedImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HomeData,
    ));
  }

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $HomeDataCopyWith<$Res> get data {
    return $HomeDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl(this.data);

  @override
  final HomeData data;

  @override
  String toString() {
    return 'HomeState.loaded(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String error) error,
    required TResult Function(HomeData data) loaded,
  }) {
    return loaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String error)? error,
    TResult? Function(HomeData data)? loaded,
  }) {
    return loaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String error)? error,
    TResult Function(HomeData data)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements HomeState {
  const factory _Loaded(final HomeData data) = _$LoadedImpl;

  HomeData get data;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeData {
  PaginatedState<Transaction> get transactionsData =>
      throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;
  FourMonthsStatistic get statistic => throw _privateConstructorUsedError;

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeDataCopyWith<HomeData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeDataCopyWith<$Res> {
  factory $HomeDataCopyWith(HomeData value, $Res Function(HomeData) then) =
      _$HomeDataCopyWithImpl<$Res, HomeData>;
  @useResult
  $Res call(
      {PaginatedState<Transaction> transactionsData,
      List<Category> categories,
      FourMonthsStatistic statistic});

  $PaginatedStateCopyWith<Transaction, $Res> get transactionsData;
  $FourMonthsStatisticCopyWith<$Res> get statistic;
}

/// @nodoc
class _$HomeDataCopyWithImpl<$Res, $Val extends HomeData>
    implements $HomeDataCopyWith<$Res> {
  _$HomeDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionsData = null,
    Object? categories = null,
    Object? statistic = null,
  }) {
    return _then(_value.copyWith(
      transactionsData: null == transactionsData
          ? _value.transactionsData
          : transactionsData // ignore: cast_nullable_to_non_nullable
              as PaginatedState<Transaction>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      statistic: null == statistic
          ? _value.statistic
          : statistic // ignore: cast_nullable_to_non_nullable
              as FourMonthsStatistic,
    ) as $Val);
  }

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PaginatedStateCopyWith<Transaction, $Res> get transactionsData {
    return $PaginatedStateCopyWith<Transaction, $Res>(_value.transactionsData,
        (value) {
      return _then(_value.copyWith(transactionsData: value) as $Val);
    });
  }

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FourMonthsStatisticCopyWith<$Res> get statistic {
    return $FourMonthsStatisticCopyWith<$Res>(_value.statistic, (value) {
      return _then(_value.copyWith(statistic: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HomeDataImplCopyWith<$Res>
    implements $HomeDataCopyWith<$Res> {
  factory _$$HomeDataImplCopyWith(
          _$HomeDataImpl value, $Res Function(_$HomeDataImpl) then) =
      __$$HomeDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {PaginatedState<Transaction> transactionsData,
      List<Category> categories,
      FourMonthsStatistic statistic});

  @override
  $PaginatedStateCopyWith<Transaction, $Res> get transactionsData;
  @override
  $FourMonthsStatisticCopyWith<$Res> get statistic;
}

/// @nodoc
class __$$HomeDataImplCopyWithImpl<$Res>
    extends _$HomeDataCopyWithImpl<$Res, _$HomeDataImpl>
    implements _$$HomeDataImplCopyWith<$Res> {
  __$$HomeDataImplCopyWithImpl(
      _$HomeDataImpl _value, $Res Function(_$HomeDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionsData = null,
    Object? categories = null,
    Object? statistic = null,
  }) {
    return _then(_$HomeDataImpl(
      transactionsData: null == transactionsData
          ? _value.transactionsData
          : transactionsData // ignore: cast_nullable_to_non_nullable
              as PaginatedState<Transaction>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<Category>,
      statistic: null == statistic
          ? _value.statistic
          : statistic // ignore: cast_nullable_to_non_nullable
              as FourMonthsStatistic,
    ));
  }
}

/// @nodoc

class _$HomeDataImpl implements _HomeData {
  const _$HomeDataImpl(
      {required this.transactionsData,
      required final List<Category> categories,
      required this.statistic})
      : _categories = categories;

  @override
  final PaginatedState<Transaction> transactionsData;
  final List<Category> _categories;
  @override
  List<Category> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  final FourMonthsStatistic statistic;

  @override
  String toString() {
    return 'HomeData(transactionsData: $transactionsData, categories: $categories, statistic: $statistic)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeDataImpl &&
            (identical(other.transactionsData, transactionsData) ||
                other.transactionsData == transactionsData) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            (identical(other.statistic, statistic) ||
                other.statistic == statistic));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionsData,
      const DeepCollectionEquality().hash(_categories), statistic);

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeDataImplCopyWith<_$HomeDataImpl> get copyWith =>
      __$$HomeDataImplCopyWithImpl<_$HomeDataImpl>(this, _$identity);
}

abstract class _HomeData implements HomeData {
  const factory _HomeData(
      {required final PaginatedState<Transaction> transactionsData,
      required final List<Category> categories,
      required final FourMonthsStatistic statistic}) = _$HomeDataImpl;

  @override
  PaginatedState<Transaction> get transactionsData;
  @override
  List<Category> get categories;
  @override
  FourMonthsStatistic get statistic;

  /// Create a copy of HomeData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeDataImplCopyWith<_$HomeDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
