import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/repositories/categories_repository.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/enums/category_enum.dart';
import 'package:money_mate/shared/enums/category_type.dart';

part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_bloc.freezed.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _categoriesRepository =
      getIt<CategoriesRepository>();
  CategoriesBloc() : super(const CategoriesState.initial()) {
    on<_GetCategories>(_onGetCategories);
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

  int countSelectedCategories() {
    return state.maybeMap(
        loaded: (data) {
          return data.categories
              .where((category) => category.isSelected)
              .length;
        },
        orElse: () => 0);
  }

  List<Category> getCategoriesByType(CategoriesType type) {
    return state.maybeMap(
        loaded: (data) {
          return data.categories
              .where((category) => category.type == type)
              .toList();
        },
        orElse: () => []);
  }
}
