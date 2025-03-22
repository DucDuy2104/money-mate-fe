import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/network/models/api_request.dart';
import 'package:money_mate/data/models/user_model.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class AuthRemoteDataSource {
  ResultFuture<UserModel> register(String email, String password);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  AuthRemoteDataSourceImpl(this._apiClient);
  @override
  ResultFuture<UserModel> register(String email, String password) {
    final req = ApiRequest(url: '/auth/register', body: {
      'email': email,
      'password': password,
    });

    return _apiClient.post(
        req: req, parser: (data) => UserModel.fromJson(data));
  }
}
