part of 'categories_bloc.dart';

@freezed
class CategoriesEvent with _$CategoriesEvent {
  factory CategoriesEvent.getCategories() = _GetCategories;
  const factory CategoriesEvent.toggleCategory(String id) = _ToggleCategory;
  const factory CategoriesEvent.updateCategoryBudget(
      String id, double? budget) = _UpdateCategoryBudget;
  const factory CategoriesEvent.setupCategories(List<Category> categories) = _SetupCategories;
}
