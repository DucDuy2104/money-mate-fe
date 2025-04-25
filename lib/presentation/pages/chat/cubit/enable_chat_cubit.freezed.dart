// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'enable_chat_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$EnableChatState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendAvailable,
    required TResult Function(CountPaginatedState<AssetEntity> data,
            List<AssetEntity> selectedAssets, bool isSending)
        galleryOpening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendAvailable,
    TResult? Function(CountPaginatedState<AssetEntity> data,
            List<AssetEntity> selectedAssets, bool isSending)?
        galleryOpening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendAvailable,
    TResult Function(CountPaginatedState<AssetEntity> data,
            List<AssetEntity> selectedAssets, bool isSending)?
        galleryOpening,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendAvailable value) sendAvailable,
    required TResult Function(_GalleryOpening value) galleryOpening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendAvailable value)? sendAvailable,
    TResult? Function(_GalleryOpening value)? galleryOpening,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendAvailable value)? sendAvailable,
    TResult Function(_GalleryOpening value)? galleryOpening,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EnableChatStateCopyWith<$Res> {
  factory $EnableChatStateCopyWith(
          EnableChatState value, $Res Function(EnableChatState) then) =
      _$EnableChatStateCopyWithImpl<$Res, EnableChatState>;
}

/// @nodoc
class _$EnableChatStateCopyWithImpl<$Res, $Val extends EnableChatState>
    implements $EnableChatStateCopyWith<$Res> {
  _$EnableChatStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of EnableChatState
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
    extends _$EnableChatStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnableChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'EnableChatState.initial()';
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
    required TResult Function() sendAvailable,
    required TResult Function(CountPaginatedState<AssetEntity> data,
            List<AssetEntity> selectedAssets, bool isSending)
        galleryOpening,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendAvailable,
    TResult? Function(CountPaginatedState<AssetEntity> data,
            List<AssetEntity> selectedAssets, bool isSending)?
        galleryOpening,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendAvailable,
    TResult Function(CountPaginatedState<AssetEntity> data,
            List<AssetEntity> selectedAssets, bool isSending)?
        galleryOpening,
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
    required TResult Function(_SendAvailable value) sendAvailable,
    required TResult Function(_GalleryOpening value) galleryOpening,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendAvailable value)? sendAvailable,
    TResult? Function(_GalleryOpening value)? galleryOpening,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendAvailable value)? sendAvailable,
    TResult Function(_GalleryOpening value)? galleryOpening,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements EnableChatState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SendAvailableImplCopyWith<$Res> {
  factory _$$SendAvailableImplCopyWith(
          _$SendAvailableImpl value, $Res Function(_$SendAvailableImpl) then) =
      __$$SendAvailableImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SendAvailableImplCopyWithImpl<$Res>
    extends _$EnableChatStateCopyWithImpl<$Res, _$SendAvailableImpl>
    implements _$$SendAvailableImplCopyWith<$Res> {
  __$$SendAvailableImplCopyWithImpl(
      _$SendAvailableImpl _value, $Res Function(_$SendAvailableImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnableChatState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SendAvailableImpl implements _SendAvailable {
  const _$SendAvailableImpl();

  @override
  String toString() {
    return 'EnableChatState.sendAvailable()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SendAvailableImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendAvailable,
    required TResult Function(CountPaginatedState<AssetEntity> data,
            List<AssetEntity> selectedAssets, bool isSending)
        galleryOpening,
  }) {
    return sendAvailable();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendAvailable,
    TResult? Function(CountPaginatedState<AssetEntity> data,
            List<AssetEntity> selectedAssets, bool isSending)?
        galleryOpening,
  }) {
    return sendAvailable?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendAvailable,
    TResult Function(CountPaginatedState<AssetEntity> data,
            List<AssetEntity> selectedAssets, bool isSending)?
        galleryOpening,
    required TResult orElse(),
  }) {
    if (sendAvailable != null) {
      return sendAvailable();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendAvailable value) sendAvailable,
    required TResult Function(_GalleryOpening value) galleryOpening,
  }) {
    return sendAvailable(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendAvailable value)? sendAvailable,
    TResult? Function(_GalleryOpening value)? galleryOpening,
  }) {
    return sendAvailable?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendAvailable value)? sendAvailable,
    TResult Function(_GalleryOpening value)? galleryOpening,
    required TResult orElse(),
  }) {
    if (sendAvailable != null) {
      return sendAvailable(this);
    }
    return orElse();
  }
}

abstract class _SendAvailable implements EnableChatState {
  const factory _SendAvailable() = _$SendAvailableImpl;
}

/// @nodoc
abstract class _$$GalleryOpeningImplCopyWith<$Res> {
  factory _$$GalleryOpeningImplCopyWith(_$GalleryOpeningImpl value,
          $Res Function(_$GalleryOpeningImpl) then) =
      __$$GalleryOpeningImplCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {CountPaginatedState<AssetEntity> data,
      List<AssetEntity> selectedAssets,
      bool isSending});

  $CountPaginatedStateCopyWith<AssetEntity, $Res> get data;
}

/// @nodoc
class __$$GalleryOpeningImplCopyWithImpl<$Res>
    extends _$EnableChatStateCopyWithImpl<$Res, _$GalleryOpeningImpl>
    implements _$$GalleryOpeningImplCopyWith<$Res> {
  __$$GalleryOpeningImplCopyWithImpl(
      _$GalleryOpeningImpl _value, $Res Function(_$GalleryOpeningImpl) _then)
      : super(_value, _then);

  /// Create a copy of EnableChatState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? selectedAssets = null,
    Object? isSending = null,
  }) {
    return _then(_$GalleryOpeningImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as CountPaginatedState<AssetEntity>,
      selectedAssets: null == selectedAssets
          ? _value._selectedAssets
          : selectedAssets // ignore: cast_nullable_to_non_nullable
              as List<AssetEntity>,
      isSending: null == isSending
          ? _value.isSending
          : isSending // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of EnableChatState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CountPaginatedStateCopyWith<AssetEntity, $Res> get data {
    return $CountPaginatedStateCopyWith<AssetEntity, $Res>(_value.data,
        (value) {
      return _then(_value.copyWith(data: value));
    });
  }
}

/// @nodoc

class _$GalleryOpeningImpl implements _GalleryOpening {
  const _$GalleryOpeningImpl(
      {required this.data,
      final List<AssetEntity> selectedAssets = const [],
      this.isSending = false})
      : _selectedAssets = selectedAssets;

  @override
  final CountPaginatedState<AssetEntity> data;
  final List<AssetEntity> _selectedAssets;
  @override
  @JsonKey()
  List<AssetEntity> get selectedAssets {
    if (_selectedAssets is EqualUnmodifiableListView) return _selectedAssets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_selectedAssets);
  }

  @override
  @JsonKey()
  final bool isSending;

  @override
  String toString() {
    return 'EnableChatState.galleryOpening(data: $data, selectedAssets: $selectedAssets, isSending: $isSending)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GalleryOpeningImpl &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality()
                .equals(other._selectedAssets, _selectedAssets) &&
            (identical(other.isSending, isSending) ||
                other.isSending == isSending));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data,
      const DeepCollectionEquality().hash(_selectedAssets), isSending);

  /// Create a copy of EnableChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GalleryOpeningImplCopyWith<_$GalleryOpeningImpl> get copyWith =>
      __$$GalleryOpeningImplCopyWithImpl<_$GalleryOpeningImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() sendAvailable,
    required TResult Function(CountPaginatedState<AssetEntity> data,
            List<AssetEntity> selectedAssets, bool isSending)
        galleryOpening,
  }) {
    return galleryOpening(data, selectedAssets, isSending);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? sendAvailable,
    TResult? Function(CountPaginatedState<AssetEntity> data,
            List<AssetEntity> selectedAssets, bool isSending)?
        galleryOpening,
  }) {
    return galleryOpening?.call(data, selectedAssets, isSending);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? sendAvailable,
    TResult Function(CountPaginatedState<AssetEntity> data,
            List<AssetEntity> selectedAssets, bool isSending)?
        galleryOpening,
    required TResult orElse(),
  }) {
    if (galleryOpening != null) {
      return galleryOpening(data, selectedAssets, isSending);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SendAvailable value) sendAvailable,
    required TResult Function(_GalleryOpening value) galleryOpening,
  }) {
    return galleryOpening(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SendAvailable value)? sendAvailable,
    TResult? Function(_GalleryOpening value)? galleryOpening,
  }) {
    return galleryOpening?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SendAvailable value)? sendAvailable,
    TResult Function(_GalleryOpening value)? galleryOpening,
    required TResult orElse(),
  }) {
    if (galleryOpening != null) {
      return galleryOpening(this);
    }
    return orElse();
  }
}

abstract class _GalleryOpening implements EnableChatState {
  const factory _GalleryOpening(
      {required final CountPaginatedState<AssetEntity> data,
      final List<AssetEntity> selectedAssets,
      final bool isSending}) = _$GalleryOpeningImpl;

  CountPaginatedState<AssetEntity> get data;
  List<AssetEntity> get selectedAssets;
  bool get isSending;

  /// Create a copy of EnableChatState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GalleryOpeningImplCopyWith<_$GalleryOpeningImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
