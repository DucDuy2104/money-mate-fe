import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/categories_repository.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/enums/category_type.dart';

part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_bloc.freezed.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _categoriesRepository =
      getIt<CategoriesRepository>();
  CategoriesBloc() : super(const CategoriesState.initial()) {
    on<_GetCategories>(_onGetCategories);
    on<_ToggleCategory>(_onToggleCategory);
    on<_UpdateCategoryBudget>(_onUpdateCategoryBudget);
  }

  void _onGetCategories(
      _GetCategories event, Emitter<CategoriesState> emit) async {
    try {
      emit(const CategoriesState.loading());
      await Future.delayed(const Duration(seconds: 2));
      final result = await _categoriesRepository.getCategories();
      result.fold((failure) {
        emit(CategoriesState.error(failure.message));
      }, (categories) {
        emit(CategoriesState.success(categories));
      });
    } on Exception catch (e) {
      emit(CategoriesState.error(e.toString()));
      debugPrint(e.toString());
    }
  }

  void _onToggleCategory(_ToggleCategory event, Emitter<CategoriesState> emit) {
    state.maybeMap(
      success: (state) {
        final updatedCategories = state.categories.map((category) {
          if (category.id == event.id) {
            return category.copyWith(isSelected: !category.isSelected);
          }
          return category;
        }).toList();

        emit(CategoriesState.success(updatedCategories));
      },
      orElse: () {},
    );
  }

  void _onUpdateCategoryBudget(
      _UpdateCategoryBudget event, Emitter<CategoriesState> emit) {
    state.maybeMap(
      success: (state) {
        final updatedCategories = state.categories.map((category) {
          if (category.id == event.id) {
            return category.copyWith(budget: event.budget);
          }
          return category;
        }).toList();

        emit(CategoriesState.success(updatedCategories));
      },
      orElse: () {},
    );
  }

  List<Category> getExpensesCategories() {
    return state.maybeMap(
        success: (state) => state.categories
            .where((c) => c.type == CategoriesType.expense)
            .toList(),
        orElse: () => []);
  }

  List<Category> getIncomeCategories() {
    return state.maybeMap(
        success: (state) => state.categories
            .where((c) => c.type == CategoriesType.income)
            .toList(),
        orElse: () => []);
  }

  List<Category> getSelectedCategories() {
    return state.maybeMap(
      success: (state) => state.categories.where((c) => c.isSelected).toList(),
      orElse: () => [],
    );
  }
}
