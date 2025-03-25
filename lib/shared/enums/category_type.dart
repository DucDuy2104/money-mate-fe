enum CategoriesType {
  expense,
  income;

  static CategoriesType fromString(String type) {
    switch (type) {
      case 'expense':
        return CategoriesType.expense;
      case 'income':
        return CategoriesType.income;
      default:
        return CategoriesType.expense;
    }
  }
}
