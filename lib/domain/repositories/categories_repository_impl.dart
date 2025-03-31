import 'package:dartz/dartz.dart';
import 'package:money_mate/data/data_sources/remote/categories_remote_data_source.dart';
import 'package:money_mate/data/models/category_model.dart';
import 'package:money_mate/data/repositories/categories_repository.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/enums/category_format.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

class CategoriesRepositoryImpl extends CategoriesRepository {
  final CategoriesRemoteDataSource _categoriesRemoteDataSource;
  CategoriesRepositoryImpl(this._categoriesRemoteDataSource);
  @override
  ResultFuture<List<Category>> getCategories({String? userId}) async {
    final result =
        await _categoriesRemoteDataSource.getCategories(userId: userId);
    return result.fold(
        (failure) => Left(failure),
        (categoryModels) =>
            Right(categoryModels.map((e) => e.toEntity()).toList()));
  }

  @override
  ResultFuture<List<Category>> setupCategories(
      List<Category> categories) async {
    final result =
        await _categoriesRemoteDataSource.setupCategories(categories);
    return result.fold(
        (failure) => Left(failure),
        (categoryModels) =>
            Right(categoryModels.map((e) => e.toEntity()).toList()));
  }

  @override
  ResultFuture<List<Category>> getOwnCategories(CategoryFormat format) async {
    final result = await _categoriesRemoteDataSource.getOwnCategories(format);
    return result.fold(
        (failure) => Left(failure),
        (categoryModels) =>
            Right(categoryModels.map((e) => e.toEntity()).toList()));
  }

  @override
  ResultFuture<Category> disableCategory(String categoryId) async {
    final result =
        await _categoriesRemoteDataSource.disableCategory(categoryId);
    return result.fold((failure) => Left(failure),
        (categoryModel) => Right(categoryModel.toEntity()));
  }

  @override
  ResultFuture<Category> enableCategory(
      String categoryId, double budget) async {
    final result =
        await _categoriesRemoteDataSource.enableCategory(categoryId, budget);
    return result.fold((failure) => Left(failure),
        (categoryModel) => Right(categoryModel.toEntity()));
  }
}
