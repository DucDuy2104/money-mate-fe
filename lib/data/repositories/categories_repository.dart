import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/enums/category_format.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class CategoriesRepository {
  ResultFuture<List<Category>> getCategories({String? userId});
  ResultFuture<List<Category>> setupCategories(List<Category> categories);
  ResultFuture<List<Category>> getOwnCategories(CategoryFormat format);
  ResultFuture<Category> enableCategory(String categoryId, double budget);
  ResultFuture<Category> disableCategory(String categoryId);
}