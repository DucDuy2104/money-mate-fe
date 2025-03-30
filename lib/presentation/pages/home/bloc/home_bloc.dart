import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/core/service/socket/socket_service.dart';
import 'package:money_mate/data/repositories/categories_repository.dart';
import 'package:money_mate/data/repositories/statistic_repository.dart';
import 'package:money_mate/data/repositories/transactions_repository.dart';
import 'package:money_mate/domain/entities/statistic.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/enums/socket_enum.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TransactionsRepository _transactionsRepository =
      getIt<TransactionsRepository>();
  final CategoriesRepository _categoriesRepository =
      getIt<CategoriesRepository>();
  final StatisticRepository _statisticRepository = getIt<StatisticRepository>();
  final SocketService _socketService = getIt<SocketService>();

  HomeBloc() : super(const HomeState.initial()) {
    on<_GetData>(_onGetData);
    on<_ReloadData>(_onReloadData);
  }

  void _onGetData(_GetData event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    await Future.delayed(const Duration(seconds: 2));

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

      final categoryResult = await _categoriesRepository.getOwnCategories();
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
          transactions: transactions,
          categories: categories,
          statistic: statistic!)));
      _onConnect();
      _initSocket();
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

      final categoryResult = await _categoriesRepository.getOwnCategories();
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
          transactions: transactions,
          categories: categories,
          statistic: statistic!)));
    } catch (e) {
      emit(const HomeState.error("Có lỗi xảy ra!"));
      debugPrint(e.toString());
    }
  }

  void _onConnect() {
    _socketService.initSocket();

    // Recieve new message
    _socketService.listen(SocketEnum.newTransaction.name, (data) {
      add(const HomeEvent.reloadData());
    });
  }

  void _initSocket() {
    // Listen to reload
    _socketService.emit(SocketEnum.initSocket.name, null);
  }
}
