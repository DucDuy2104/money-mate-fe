part of 'setup_categories_bloc.dart';

@freezed
class SetupCategoriesState with _$SetupCategoriesState {
  const factory SetupCategoriesState.initial() = _Initial;
  const factory SetupCategoriesState.success(List<Category> categories) = _Success;
  const factory SetupCategoriesState.error(String message) = _Error;
  const factory SetupCategoriesState.loading(List<Category> categories) = _Loading;
  const factory SetupCategoriesState.setupSuccess(List<Category> categories) = _SetupSuccess;
}
