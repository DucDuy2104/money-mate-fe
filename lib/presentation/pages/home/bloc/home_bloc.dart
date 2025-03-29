import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/categories_repository.dart';
import 'package:money_mate/data/repositories/transactions_repository.dart';
import 'package:money_mate/domain/entities/transaction.dart';
import 'package:money_mate/domain/entities/category.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final TransactionsRepository _transactionsRepository =
      getIt<TransactionsRepository>();
  final CategoriesRepository _categoriesRepository =
      getIt<CategoriesRepository>();
  HomeBloc() : super(const HomeState.initial()) {
    on<_GetData>(_onGetData);
  }

  void _onGetData(_GetData event, Emitter<HomeState> emit) async {
    emit(const HomeState.loading());
    await Future.delayed(const Duration(seconds: 2));

    try {
      List<Category> categories = [];
      List<Transaction> transactions = [];

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

      emit(HomeState.loaded(HomeData(
        transactions: transactions,
        categories: categories,
      )));
    } catch (e) {
      emit(const HomeState.error("Có lỗi xảy ra!"));
      debugPrint(e.toString());
    }
  }
}
