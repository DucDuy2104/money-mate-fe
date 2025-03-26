part of 'categories_bloc.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.success(List<Category> categories) = _Success;
  const factory CategoriesState.error(String message) = _Error;
  const factory CategoriesState.loading(List<Category> categories) = _Loading;
  const factory CategoriesState.setupSuccess(List<Category> categories) = _SetupSuccess;
}
