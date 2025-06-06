part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.error(String error) = _Error;
  const factory HomeState.loaded(HomeData data) = _Loaded;
}

@freezed
class HomeData with _$HomeData {
  const factory HomeData({
    required PaginatedState<Transaction> transactionsData,
    required List<Category> categories,
    required FourMonthsStatistic statistic,
  }) = _HomeData;
}
