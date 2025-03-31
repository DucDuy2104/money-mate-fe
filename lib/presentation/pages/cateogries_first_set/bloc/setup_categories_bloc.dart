import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/categories_repository.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/enums/category_type.dart';

part 'setup_categories_event.dart';
part 'setup_categories_state.dart';
part 'setup_categories_bloc.freezed.dart';

class SetupCategoriesBloc extends Bloc<SetupCategoriesEvent, SetupCategoriesState> {
  final CategoriesRepository _categoriesRepository =
      getIt<CategoriesRepository>();
  SetupCategoriesBloc() : super(const SetupCategoriesState.initial()) {
    on<_GetCategories>(_onGetCategories);
    on<_ToggleCategory>(_onToggleCategory);
    on<_UpdateCategoryBudget>(_onUpdateCategoryBudget);
    on<_SetupCategories>(_onSetupCategories);
  }

  void _onGetCategories(
      _GetCategories event, Emitter<SetupCategoriesState> emit) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      final result = await _categoriesRepository.getCategories();
      result.fold((failure) {
        emit(SetupCategoriesState.error(failure.message));
      }, (categories) {
        emit(SetupCategoriesState.success(categories));
      });
    } on Exception catch (e) {
      emit(SetupCategoriesState.error(e.toString()));
      debugPrint(e.toString());
    }
  }

  void _onToggleCategory(_ToggleCategory event, Emitter<SetupCategoriesState> emit) {
    state.maybeMap(
      success: (state) {
        final updatedCategories = state.categories.map((category) {
          if (category.id == event.id) {
            return category.copyWith(isSelected: !category.isSelected);
          }
          return category;
        }).toList();

        emit(SetupCategoriesState.success(updatedCategories));
      },
      orElse: () {},
    );
  }

  void _onUpdateCategoryBudget(
      _UpdateCategoryBudget event, Emitter<SetupCategoriesState> emit) {
    state.maybeMap(
      success: (state) {
        final updatedCategories = state.categories.map((category) {
          if (category.id == event.id) {
            return category.copyWith(budget: event.budget ?? 0);
          }
          return category;
        }).toList();

        emit(SetupCategoriesState.success(updatedCategories));
      },
      orElse: () {},
    );
  }

  void _onSetupCategories(
      _SetupCategories event, Emitter<SetupCategoriesState> emit) async {
    try {
      final temptCategories = state.maybeMap(
          success: (value) => value.categories,
          orElse: () => [] as List<Category>);
      emit(SetupCategoriesState.loading(temptCategories));
      await Future.delayed(const Duration(seconds: 2));
      final result =
          await _categoriesRepository.setupCategories(event.categories);
      result.fold((failure) {
        emit(SetupCategoriesState.error(failure.message));
      }, (categories) {
        emit(SetupCategoriesState.setupSuccess(categories));
      });
    } catch (e) {
      emit(SetupCategoriesState.error(e.toString()));
      debugPrint(e.toString());
    }
  }

  List<Category> getExpensesCategories() {
    return state.maybeMap(
        success: (state) => state.categories
            .where((c) => c.type == CategoriesType.expense)
            .toList(),
        loading: (state) => state.categories
            .where((c) => c.type == CategoriesType.expense)
            .toList(),
        orElse: () => []);
  }

  List<Category> getIncomeCategories() {
    return state.maybeMap(
        success: (state) => state.categories
            .where((c) => c.type == CategoriesType.income)
            .toList(),
        loading: (state) => state.categories
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

  int countSelectedExpenseCategories() {
    return state.maybeMap(
      success: (state) => state.categories
          .where((c) => c.type == CategoriesType.expense && c.isSelected)
          .length,
      loading: (state) => state.categories
          .where((c) => c.type == CategoriesType.expense && c.isSelected)
          .length,
      orElse: () => 0,
    );
  }

  int countSelectedIncomeCategories() {
    return state.maybeMap(
      success: (state) => state.categories
          .where((c) => c.type == CategoriesType.income && c.isSelected)
          .length,
      loading: (state) => state.categories
          .where((c) => c.type == CategoriesType.income && c.isSelected)
          .length,
      orElse: () => 0,
    );
  }
}
