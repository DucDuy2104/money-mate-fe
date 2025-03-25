import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/network/models/api_request.dart';
import 'package:money_mate/data/models/category_model.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class CategoriesRemoteDataSource {
  ResultFuture<List<CategoryModel>> getCategories();
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
}
