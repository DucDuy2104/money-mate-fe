import 'package:dartz/dartz.dart';
import 'package:money_mate/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:money_mate/data/models/category_model.dart';
import 'package:money_mate/data/repositories/categories_repository.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;
  CategoriesRepositoryImpl(this._categoriesRemoteDataSource);
  @override
  ResultFuture<List<Category>> getCategories() async {
    final result = await _categoriesRemoteDataSource.getCategories();
    return result.fold(
        (failure) => Left(failure),
        (categoryModels) =>
            Right(categoryModels.map((e) => e.toEntity()).toList()));
  }
}
