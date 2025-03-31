part of 'setup_categories_bloc.dart';

@freezed
class SetupCategoriesEvent with _$SetupCategoriesEvent {
  factory SetupCategoriesEvent.getCategories() = _GetCategories;
  const factory SetupCategoriesEvent.toggleCategory(String id) = _ToggleCategory;
  const factory SetupCategoriesEvent.updateCategoryBudget(
      String id, double? budget) = _UpdateCategoryBudget;
  const factory SetupCategoriesEvent.setupCategories(List<Category> categories) = _SetupCategories;
}
