import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/network/models/api_request.dart';
import 'package:money_mate/data/models/category_model.dart';
import 'package:money_mate/domain/entities/category.dart';
import 'package:money_mate/shared/enums/category_format.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class CategoriesRemoteDataSource {
  ResultFuture<List<CategoryModel>> getCategories({String? userId});
  ResultFuture<List<CategoryModel>> setupCategories(List<Category> categories);
  ResultFuture<List<CategoryModel>> getOwnCategories(CategoryFormat format);
  ResultFuture<CategoryModel> enableCategory(String categoryId, double? budget);
  ResultFuture<CategoryModel> disableCategory(String categoryId);
}

class CategoriesRemoteDataSourceImpl extends CategoriesRemoteDataSource {
  final ApiClient _apiClient;
  CategoriesRemoteDataSourceImpl(this._apiClient);
  @override
  ResultFuture<List<CategoryModel>> getCategories({String? userId}) {
    final req = ApiRequest(url: '/categories', query: {"userId": userId});
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
  ResultFuture<List<CategoryModel>> getOwnCategories(CategoryFormat format) {
    final req = ApiRequest(url: '/categories/user/${format.name}');

    return _apiClient.get(
        req: req,
        parser: (data) =>
            (data as List).map((e) => CategoryModel.fromJson((e))).toList());
  }

  @override
  ResultFuture<CategoryModel> disableCategory(String categoryId) {
    final req =
        ApiRequest(url: '/categories/disable', body: {"category": categoryId});
    return _apiClient.put(
        req: req, parser: (data) => CategoryModel.fromJson((data)));
  }

  @override
  ResultFuture<CategoryModel> enableCategory(
      String categoryId, double? budget) {
    final req = ApiRequest(
        url: '/categories/enable',
        body: {"category": categoryId, "budget": budget});
    return _apiClient.put(
        req: req, parser: (data) => CategoryModel.fromJson((data)));
  }
}
