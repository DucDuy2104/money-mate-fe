// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'count_paginated_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountPaginatedState<T> {
  List<T> get data => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  bool get hasNext => throw _privateConstructorUsedError;
  int get currentPage => throw _privateConstructorUsedError;
  int? get totalPage => throw _privateConstructorUsedError;

  /// Create a copy of CountPaginatedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountPaginatedStateCopyWith<T, CountPaginatedState<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountPaginatedStateCopyWith<T, $Res> {
  factory $CountPaginatedStateCopyWith(CountPaginatedState<T> value,
          $Res Function(CountPaginatedState<T>) then) =
      _$CountPaginatedStateCopyWithImpl<T, $Res, CountPaginatedState<T>>;
  @useResult
  $Res call(
      {List<T> data,
      bool isLoading,
      String error,
      bool hasNext,
      int currentPage,
      int? totalPage});
}

/// @nodoc
class _$CountPaginatedStateCopyWithImpl<T, $Res,
        $Val extends CountPaginatedState<T>>
    implements $CountPaginatedStateCopyWith<T, $Res> {
  _$CountPaginatedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountPaginatedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
    Object? error = null,
    Object? hasNext = null,
    Object? currentPage = null,
    Object? totalPage = freezed,
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
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountPaginatedStateImplCopyWith<T, $Res>
    implements $CountPaginatedStateCopyWith<T, $Res> {
  factory _$$CountPaginatedStateImplCopyWith(_$CountPaginatedStateImpl<T> value,
          $Res Function(_$CountPaginatedStateImpl<T>) then) =
      __$$CountPaginatedStateImplCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call(
      {List<T> data,
      bool isLoading,
      String error,
      bool hasNext,
      int currentPage,
      int? totalPage});
}

/// @nodoc
class __$$CountPaginatedStateImplCopyWithImpl<T, $Res>
    extends _$CountPaginatedStateCopyWithImpl<T, $Res,
        _$CountPaginatedStateImpl<T>>
    implements _$$CountPaginatedStateImplCopyWith<T, $Res> {
  __$$CountPaginatedStateImplCopyWithImpl(_$CountPaginatedStateImpl<T> _value,
      $Res Function(_$CountPaginatedStateImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of CountPaginatedState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
    Object? isLoading = null,
    Object? error = null,
    Object? hasNext = null,
    Object? currentPage = null,
    Object? totalPage = freezed,
  }) {
    return _then(_$CountPaginatedStateImpl<T>(
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
      currentPage: null == currentPage
          ? _value.currentPage
          : currentPage // ignore: cast_nullable_to_non_nullable
              as int,
      totalPage: freezed == totalPage
          ? _value.totalPage
          : totalPage // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CountPaginatedStateImpl<T> implements _CountPaginatedState<T> {
  _$CountPaginatedStateImpl(
      {final List<T> data = const [],
      this.isLoading = true,
      this.error = '',
      this.hasNext = true,
      this.currentPage = 1,
      this.totalPage})
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
  final int currentPage;
  @override
  final int? totalPage;

  @override
  String toString() {
    return 'CountPaginatedState<$T>(data: $data, isLoading: $isLoading, error: $error, hasNext: $hasNext, currentPage: $currentPage, totalPage: $totalPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountPaginatedStateImpl<T> &&
            const DeepCollectionEquality().equals(other._data, _data) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error) &&
            (identical(other.hasNext, hasNext) || other.hasNext == hasNext) &&
            (identical(other.currentPage, currentPage) ||
                other.currentPage == currentPage) &&
            (identical(other.totalPage, totalPage) ||
                other.totalPage == totalPage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_data),
      isLoading,
      error,
      hasNext,
      currentPage,
      totalPage);

  /// Create a copy of CountPaginatedState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountPaginatedStateImplCopyWith<T, _$CountPaginatedStateImpl<T>>
      get copyWith => __$$CountPaginatedStateImplCopyWithImpl<T,
          _$CountPaginatedStateImpl<T>>(this, _$identity);
}

abstract class _CountPaginatedState<T> implements CountPaginatedState<T> {
  factory _CountPaginatedState(
      {final List<T> data,
      final bool isLoading,
      final String error,
      final bool hasNext,
      final int currentPage,
      final int? totalPage}) = _$CountPaginatedStateImpl<T>;

  @override
  List<T> get data;
  @override
  bool get isLoading;
  @override
  String get error;
  @override
  bool get hasNext;
  @override
  int get currentPage;
  @override
  int? get totalPage;

  /// Create a copy of CountPaginatedState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountPaginatedStateImplCopyWith<T, _$CountPaginatedStateImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
