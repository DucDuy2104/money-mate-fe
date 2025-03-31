part of 'categories_bloc.dart';

@freezed
class CategoriesEvent with _$CategoriesEvent {
  const factory CategoriesEvent.getCategories(String userId) = _GetCategories;
  const factory CategoriesEvent.enableCategory(
          String categoryId, double budget, VoidCallback callback) =
      _EnableCategory;
  const factory CategoriesEvent.disableCategory(
      String categoryId, VoidCallback callback) = _DisableCategory;
  const factory CategoriesEvent.reload(String userId) = _Reload;
}
