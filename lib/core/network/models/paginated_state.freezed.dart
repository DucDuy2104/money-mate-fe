// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'paginated_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaginatedState<T> {
  List<T> get data => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  T? get last => throw _privateConstructorUsedError;
  int get itemsPerPage => throw _privateConstructorUsedError;

  /// Create a copy of PaginatedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaginatedStateCopyWith<T, PaginatedState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginatedStateCopyWith<T, $Res> {
  factory $PaginatedStateCopyWith(
          PaginatedState<T> value, $Res Function(PaginatedState<T>) then) =
      _$PaginatedStateCopyWithImpl<T, $Res, PaginatedState<T>>;
  @useResult
  $Res call(
      {List<T> data,
      bool isLoading,
      String error,
      bool hasNext,
      T? last,
      int itemsPerPage});
}

/// @nodoc
class _$PaginatedStateCopyWithImpl<T, $Res, $Val extends PaginatedState<T>>
    implements $PaginatedStateCopyWith<T, $Res> {
  _$PaginatedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaginatedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
    Object? error = null,
    Object? hasNext = null,
    Object? last = freezed,
    Object? itemsPerPage = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as T?,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaginatedStateImplCopyWith<T, $Res>
    implements $PaginatedStateCopyWith<T, $Res> {
  factory _$$PaginatedStateImplCopyWith(_$PaginatedStateImpl<T> value,
          $Res Function(_$PaginatedStateImpl<T>) then) =
      __$$PaginatedStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<T> data,
      bool isLoading,
      String error,
      bool hasNext,
      T? last,
      int itemsPerPage});
}

/// @nodoc
class __$$PaginatedStateImplCopyWithImpl<T, $Res>
    extends _$PaginatedStateCopyWithImpl<T, $Res, _$PaginatedStateImpl<T>>
    implements _$$PaginatedStateImplCopyWith<T, $Res> {
  __$$PaginatedStateImplCopyWithImpl(_$PaginatedStateImpl<T> _value,
      $Res Function(_$PaginatedStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of PaginatedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
    Object? error = null,
    Object? hasNext = null,
    Object? last = freezed,
    Object? itemsPerPage = null,
  }) {
    return _then(_$PaginatedStateImpl<T>(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<T>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      hasNext: null == hasNext
          ? _value.hasNext
          : hasNext // ignore: cast_nullable_to_non_nullable
              as bool,
      last: freezed == last
          ? _value.last
          : last // ignore: cast_nullable_to_non_nullable
              as T?,
      itemsPerPage: null == itemsPerPage
          ? _value.itemsPerPage
          : itemsPerPage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$PaginatedStateImpl<T> implements _PaginatedState<T> {
  _$PaginatedStateImpl(
      {final List<T> data = const [],
      this.isLoading = true,
      this.error = '',
      this.hasNext = true,
      this.last = null,
      this.itemsPerPage = 0})
      : _data = data;

  final List<T> _data;
  @override
  @JsonKey()
  List<T> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String error;
  @override
  @JsonKey()
  final bool hasNext;
  @override
  @JsonKey()
  final T? last;
  @override
  @JsonKey()
  final int itemsPerPage;

  @override
  String toString() {
    return 'PaginatedState<$T>(data: $data, isLoading: $isLoading, error: $error, hasNext: $hasNext, last: $last, itemsPerPage: $itemsPerPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaginatedStateImpl<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            const DeepCollectionEquality().equals(other.last, last) &&
            (identical(other.itemsPerPage, itemsPerPage) ||
                other.itemsPerPage == itemsPerPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      isLoading,
      error,
      hasNext,
      const DeepCollectionEquality().hash(last),
      itemsPerPage);

  /// Create a copy of PaginatedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaginatedStateImplCopyWith<T, _$PaginatedStateImpl<T>> get copyWith =>
      __$$PaginatedStateImplCopyWithImpl<T, _$PaginatedStateImpl<T>>(
          this, _$identity);
}

abstract class _PaginatedState<T> implements PaginatedState<T> {
  factory _PaginatedState(
      {final List<T> data,
      final bool isLoading,
      final String error,
      final bool hasNext,
      final T? last,
      final int itemsPerPage}) = _$PaginatedStateImpl<T>;

  @override
  List<T> get data;
  @override
  bool get isLoading;
  @override
  String get error;
  @override
  bool get hasNext;
  @override
  T? get last;
  @override
  int get itemsPerPage;

  /// Create a copy of PaginatedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaginatedStateImplCopyWith<T, _$PaginatedStateImpl<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
