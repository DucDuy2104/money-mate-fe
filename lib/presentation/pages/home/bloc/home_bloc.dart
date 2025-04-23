import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/network/models/paginated_state.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/core/service/socket/socket_service.dart';
import 'package:money_mate/data/repositories/categories_repository.dart';
import 'package:money_mate/data/repositories/statistic_repository.dart';
import 'package:money_mate/data/repositories/transactions_repository.dart';
import 'package:money_mate/domain/entities/statistic.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/enums/category_format.dart';
import 'package:money_mate/shared/enums/socket_enum.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState>
    with PaginatedMixin<Transaction> {
  final TransactionsRepository _transactionsRepository =
      getIt<TransactionsRepository>();
  final CategoriesRepository _categoriesRepository =
      getIt<CategoriesRepository>();
  final StatisticRepository _statisticRepository = getIt<StatisticRepository>();
  final SocketService _socketService = getIt<SocketService>();

  HomeBloc() : super(const HomeState.initial()) {
    on<_GetData>(_onGetData);
    on<_ReloadData>(_onReloadData);
    on<_ReloadCategories>(_onReloadCategories);
    on<_Logout>(_onLogout);
    on<_LoadMoreTransactions>(_onLoadMoreTransactions);
  }

  void _onGetData(_GetData event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    _onConnect();
    _initSocket();
    try {
      List<Category> categories = [];
      List<Transaction> transactions = [];
      // ignore: avoid_init_to_null
      FourMonthsStatistic? statistic = null;

      final transactionResult = await _transactionsRepository.getTransactions();
      transactionResult.fold(
        (failure) {
          emit(HomeState.error(failure.message));
          return;
        },
        (data) => transactions = data,
      );

      final categoryResult =
          await _categoriesRepository.getOwnCategories(CategoryFormat.monthly);
      categoryResult.fold(
        (failure) {
          emit(HomeState.error(failure.message));
          return;
        },
        (data) => categories = data,
      );

      final statisticResult =
          await _statisticRepository.getFourMonthsStatistic();
      statisticResult.fold(
        (failure) {
          emit(HomeState.error(failure.message));
          return;
        },
        (data) {
          statistic = data;
        },
      );

      emit(HomeState.loaded(HomeData(
          transactionsData:
              handleFirstFetch(transactions, PaginatedState<Transaction>()),
          categories: categories,
          statistic: statistic!)));
      event.callback();
    } catch (e) {
      emit(const HomeState.error("Có lỗi xảy ra!"));
      debugPrint(e.toString());
    }
  }

  void _onReloadData(_ReloadData event, Emitter<HomeState> emit) async {
    try {
      List<Category> categories = [];
      List<Transaction> transactions = [];
      FourMonthsStatistic? statistic;

      final transactionResult = await _transactionsRepository.getTransactions();
      transactionResult.fold(
        (failure) {
          emit(HomeState.error(failure.message));
          return;
        },
        (data) => transactions = data,
      );

      final categoryResult =
          await _categoriesRepository.getOwnCategories(CategoryFormat.monthly);
      categoryResult.fold(
        (failure) {
          emit(HomeState.error(failure.message));
          return;
        },
        (data) => categories = data,
      );

      final statisticResult =
          await _statisticRepository.getFourMonthsStatistic();
      statisticResult.fold(
        (failure) {
          emit(HomeState.error(failure.message));
          return;
        },
        (data) => statistic = data,
      );

      emit(HomeState.loaded(HomeData(
          transactionsData:
              handleFirstFetch(transactions, PaginatedState<Transaction>()),
          categories: categories,
          statistic: statistic!)));
    } catch (e) {
      emit(const HomeState.error("Có lỗi xảy ra!"));
      debugPrint(e.toString());
    }
  }

  void _onReloadCategories(
      _ReloadCategories event, Emitter<HomeState> emit) async {
    try {
      final categoriesResult =
          await _categoriesRepository.getOwnCategories(CategoryFormat.monthly);
      categoriesResult.fold((failure) {
        emit(HomeState.error(failure.message));
        return;
      }, (categories) {
        state.maybeMap(
            loaded: (state) {
              emit(HomeState.loaded(
                  state.data.copyWith(categories: categories)));
            },
            orElse: () {});
      });
    } catch (e) {
      emit(const HomeState.error("Có lỗii xảy ra!"));
      debugPrint(e.toString());
    }
  }

  void _onConnect() {
    _socketService.initSocket();

    // Recieve new message
    _socketService.listen(SocketEnum.newTransaction.name, (data) {
      add(const HomeEvent.reloadData());
    });

    // Update category
    _socketService.listen(SocketEnum.updateCategory.name, (data) {
      add(const HomeEvent.reloadCategories());
    });
  }

  void _initSocket() {
    // Listen to reload
    _socketService.emit(SocketEnum.initSocket.name, null);
  }

  void _onLogout(_Logout event, Emitter<HomeState> emit) {
    emit(const HomeState.initial());
  }

  FutureOr<void> _onLoadMoreTransactions(
      _LoadMoreTransactions event, Emitter<HomeState> emit) async {
    final curState =
        state.maybeMap(loaded: (data) => data.data, orElse: () => null);
    if (curState == null ||
        curState.transactionsData.isLoading ||
        !curState.transactionsData.hasNext) {
      return;
    }
    try {
      final transactionsResult = await _transactionsRepository.getTransactions(
          lastTransactionId: curState.transactionsData.last?.id);
      transactionsResult.fold((failure) {
        emit(const HomeState.error("Có lỗi xảy ra!"));
      }, (transactions) {
        emit(HomeState.loaded(curState.copyWith(
            transactionsData:
                handleFetchMore(transactions, curState.transactionsData))));
      });
    } catch (e) {
      emit(const HomeState.error("Có lỗi xảy ra!"));
      debugPrint(e.toString());
    }
  }
}
