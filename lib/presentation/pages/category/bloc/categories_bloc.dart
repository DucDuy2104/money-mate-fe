import 'package:flutter/cupertino.dart';
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
    on<_Reload>(_onReload);
    on<_EnableCategory>(_onEnableCategory);
    on<_DisableCategory>(_onDisableCategory);
  }

  void _onGetCategories(
      _GetCategories event, Emitter<CategoriesState> emit) async {
    emit(const CategoriesState.loading());
    try {
      final result =
          await _categoriesRepository.getCategories(userId: event.userId);
      result.fold((failure) => emit(CategoriesState.error(failure.message)),
          (categories) {
        emit(CategoriesState.loaded(categories));
      });
    } on Exception catch (e) {
      emit(const CategoriesState.error("Lỗi khi lấy danh mục"));
      debugPrint(e.toString());
    }
  }

  void _onReload(_Reload event, Emitter<CategoriesState> emit) async {
    state.maybeMap(
        loaded: (state) {
          emit(CategoriesState.reloading(state.categories));
        },
        orElse: () {});
    await Future.delayed(const Duration(seconds: 2));
    try {
      final result =
          await _categoriesRepository.getCategories(userId: event.userId);
      result.fold((failure) => emit(CategoriesState.error(failure.message)),
          (categories) {
        emit(CategoriesState.loaded(categories));
      });
    } on Exception catch (e) {
      emit(const CategoriesState.error("Lỗi khi lấy danh mục"));
      debugPrint(e.toString());
    }
  }

  void _onEnableCategory(
      _EnableCategory event, Emitter<CategoriesState> emit) async {
    state.maybeMap(
        loaded: (state) {
          emit(CategoriesState.reloading(state.categories));
        },
        orElse: () {});
    await Future.delayed(const Duration(seconds: 2));

    try {
      final enableResult = await _categoriesRepository.enableCategory(
          event.categoryId, event.budget);
      enableResult
          .fold((failure) => emit(CategoriesState.error(failure.message)),
              (category) {
        event.callback();
      });
    } catch (e) {
      emit(const CategoriesState.error("Lỗi khi cập nhật danh mục"));
      debugPrint(e.toString());
    }
  }

  void _onDisableCategory(
      _DisableCategory event, Emitter<CategoriesState> emit) async {
    state.maybeMap(
        loaded: (state) {
          emit(CategoriesState.reloading(state.categories));
        },
        orElse: () {});
    await Future.delayed(const Duration(seconds: 2));

    try {
      final disableResult =
          await _categoriesRepository.disableCategory(event.categoryId);
      disableResult
          .fold((failure) => emit(CategoriesState.error(failure.message)),
              (category) {
        event.callback();
      });
    } catch (e) {
      emit(const CategoriesState.error("Lỗii khi cập nhật danh mục"));
      debugPrint(e.toString());
    }
  }

  int countSelectedCategories() {
    return state.maybeMap(
        loaded: (data) {
          return data.categories
              .where((category) => category.isSelected)
              .length;
        },
        reloading: (data) {
          return data.categories
              .where((category) => category.isSelected)
              .length;
        },
        orElse: () => 0);
  }

  int countSelectedCategoriesByType(CategoriesType type) {
    return state.maybeMap(
      loaded: (data) => data.categories
          .where((category) => category.isSelected && category.type == type)
          .length,
      reloading: (data) => data.categories
          .where((category) => category.isSelected && category.type == type)
          .length,
      orElse: () => 0,
    );
  }

  List<Category> getCategoriesByType(CategoriesType type) {
    return state.maybeMap(
        loaded: (data) {
          return data.categories
              .where((category) => category.type == type)
              .toList();
        },
        reloading: (data) {
          return data.categories
              .where((category) => category.type == type)
              .toList();
        },
        orElse: () => []);
  }
}
