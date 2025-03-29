import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/network/models/api_request.dart';
import 'package:money_mate/data/models/category_model.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class CategoriesRemoteDataSource {
  ResultFuture<List<CategoryModel>> getCategories();
  ResultFuture<List<CategoryModel>> setupCategories(List<Category> categories);
  ResultFuture<List<CategoryModel>> getOwnCategories();
}

class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource {
  final ApiClient _apiClient;
  CategoriesRemoteDataSourceImpl(this._apiClient);
  @override
  ResultFuture<List<CategoryModel>> getCategories() {
    final req = ApiRequest(url: '/categories');
    return _apiClient.get(
        req: req,
        parser: (data) =>
            (data as List).map((e) => CategoryModel.fromJson(e)).toList());
  }

  @override
  ResultFuture<List<CategoryModel>> setupCategories(List<Category> categories) {
    final req = ApiRequest(
        url: '/categories/setup/bulk',
        body: categories.map((e) => e.toLimitedJson()).toList());

    return _apiClient.post(
        req: req,
        parser: (data) =>
            (data as List).map((e) => CategoryModel.fromJson((e))).toList());
  }

  @override
  ResultFuture<List<CategoryModel>> getOwnCategories() {
    final req = ApiRequest(url: '/categories/user');

    return _apiClient.get(
        req: req,
        parser: (data) =>
            (data as List).map((e) => CategoryModel.fromJson((e))).toList());
  }
}