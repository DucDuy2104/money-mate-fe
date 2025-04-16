import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_state.freezed.dart';

@freezed
abstract class PaginatedState<T> with _$PaginatedState<T> {
  factory PaginatedState({
    @Default([]) List<T> data,
    @Default(true) bool isLoading,
    @Default('') String error,
    @Default(true) bool hasNext,
    @Default(null) T? last,
    @Default(0) int itemsPerPage,
  }) = _PaginatedState;
}

mixin PaginatedMixin<T> {
  PaginatedState<T> handleFailure(
    String message,
    PaginatedState<T> state,
  ) {
    return state.copyWith(
      error: message,
      isLoading: false,
    );
  }

  PaginatedState<T> handleFirstFetch(
    List<T> list,
    PaginatedState<T> state,
  ) {
    return _handleFetch(list, state, isFirstFetch: true);
  }

  PaginatedState<T> handleFetchMore(
    List<T> list,
    PaginatedState<T> state,
  ) {
    return _handleFetch(list, state, isFirstFetch: false);
  }

  PaginatedState<T> handleReset() {
    return PaginatedState<T>();
  }

  PaginatedState<T> _handleFetch(
    List<T> list,
    PaginatedState<T> state, {
    required bool isFirstFetch,
  }) {
    final data = isFirstFetch ? list : [...state.data, ...list];
    var itemsPerPage = state.itemsPerPage;
    if (isFirstFetch) {
      itemsPerPage = list.length;
    }

    var hasNext = false;
    if (list.length < itemsPerPage) {
      hasNext = false;
    } else {
      hasNext = true;
    }

    return state.copyWith(
        last: data.isNotEmpty ? data.last : null,
        isLoading: false,
        data: data,
        hasNext: hasNext,
        itemsPerPage: itemsPerPage);
  }

  PaginatedState<T> addItem(T item, PaginatedState<T> state) {
    return state.copyWith(
        data: [item, ...state.data]);
  }
}
