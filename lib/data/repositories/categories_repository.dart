import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class CategoriesRepository {
  ResultFuture<List<Category>> getCategories();
  ResultFuture<List<Category>> setupCategories(List<Category> categories);
}