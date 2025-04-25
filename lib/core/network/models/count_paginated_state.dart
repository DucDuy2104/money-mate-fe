import 'package:freezed_annotation/freezed_annotation.dart';

part 'count_paginated_state.freezed.dart';

@freezed
abstract class CountPaginatedState<T> with _$CountPaginatedState<T> {
  factory CountPaginatedState({
    @Default([]) List<T> data,
    @Default(true) bool isLoading,
    @Default('') String error,
    @Default(true) bool hasNext,
    @Default(1) int currentPage,
    int? totalPage,
  }) = _CountPaginatedState;
}

mixin CountPaginatedMixin<T> {
  handleFailure(
    String message,
    CountPaginatedState<T> state,
  ) {
    return state.copyWith(
      error: message,
      isLoading: false,
    );
  }

  CountPaginatedState<T> handleFirstFetch(
    List<T> list,
    CountPaginatedState<T> state,
  ) {
    return _handleFetch(list, state, isFirstFetch: true);
  }

  CountPaginatedState<T> handleFetchMore(
    List<T> list,
    CountPaginatedState<T> state,
  ) {
    return _handleFetch(list, state, isFirstFetch: false);
  }

  CountPaginatedState<T> handleReset() {
    return CountPaginatedState<T>();
  }

  CountPaginatedState<T> _handleFetch(
    List<T> list,
    CountPaginatedState<T> state, {
    required bool isFirstFetch,
  }) {
    final data = isFirstFetch ? list : [...state.data, ...list];
    var hasNext = state.hasNext;
    if (state.totalPage != null) {
      hasNext = state.currentPage < state.totalPage!;
    }

    return state.copyWith(
      currentPage: isFirstFetch ? 0 : state.currentPage + 1,
      isLoading: false,
      data: data,
      hasNext: hasNext,
    );
  }
}
