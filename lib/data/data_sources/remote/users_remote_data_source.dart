import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/network/models/api_request.dart';
import 'package:money_mate/data/models/user_model.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class UsersRemoteDataSource {
  ResultFuture<UserModel> update(Map<String, dynamic> body);
  ResultFuture<UserModel> getProfile();
  ResultFuture<UserModel> updatePass(String oldPass, String newPass);
}

class UsersRemoteDataSourceImpl implements UsersRemoteDataSource {
  final ApiClient _apiClient;
  UsersRemoteDataSourceImpl(this._apiClient);
  @override
  ResultFuture<UserModel> update(Map<String, dynamic> body) {
    final req = ApiRequest(url: '/users', body: body);
    return _apiClient.put(req: req, parser: (data) => UserModel.fromJson(data));
  }

  @override
  ResultFuture<UserModel> getProfile() {
    final req = ApiRequest(url: '/users/profile');
    return _apiClient.get(req: req, parser: (data) => UserModel.fromJson(data));
  }

  @override
  ResultFuture<UserModel> updatePass(String oldPass, String newPass) {
    final req = ApiRequest(
        url: '/users/change-password',
        body: {'oldPass': oldPass, 'newPass': newPass});
    return _apiClient.put(req: req, parser: (data) => UserModel.fromJson(data));
  }
}
