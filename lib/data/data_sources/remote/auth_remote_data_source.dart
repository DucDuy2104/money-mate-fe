import 'package:money_mate/core/network/api_client.dart';
import 'package:money_mate/core/network/models/api_request.dart';
import 'package:money_mate/data/models/login_data_model.dart';
import 'package:money_mate/data/models/user_model.dart';
import 'package:money_mate/shared/utils/typedefs.dart';

abstract class AuthRemoteDataSource {
  ResultFuture<UserModel> register(String email, String password);
  ResultFuture<bool> sendVerificationCode(String userId);
  ResultFuture<UserModel> verification(String userId, String code);
  ResultFuture<LoginDataModel> login(String email, String password);
  ResultFuture<LoginDataModel> refreshToken();
  ResultFuture<LoginDataModel> signinWithGoogle(String idToken);
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

  @override
  ResultFuture<bool> sendVerificationCode(String userId) {
    final req = ApiRequest(url: '/mail/send-verification-code', body: {
      'id': userId,
    });

    return _apiClient.post(req: req, parser: (data) => data as bool);
  }

  @override
  ResultFuture<UserModel> verification(String userId, String code) {
    final req = ApiRequest(
      url: '/auth/verify-code',
      body: {
        'id': userId,
        'code': code,
      },
    );

    return _apiClient.post(
        req: req, parser: (data) => UserModel.fromJson(data));
  }

  @override
  ResultFuture<LoginDataModel> login(String email, String password) {
    final req = ApiRequest(
      url: '/auth/login',
      body: {
        'email': email,
        'password': password,
      },
    );

    return _apiClient.post(
        req: req, parser: (data) => LoginDataModel.fromJson(data));
  }

  @override
  ResultFuture<LoginDataModel> refreshToken() {
    final req = ApiRequest(
      url: '/auth/refresh-token',
    );

    return _apiClient.get(
        req: req, parser: (data) => LoginDataModel.fromJson(data));
  }

  @override
  ResultFuture<LoginDataModel> signinWithGoogle(String idToken) {
    final req = ApiRequest(url: '/auth/google', headers: {
      'Authorization': 'Bearer $idToken',
    });

    return _apiClient.get(
        req: req, parser: (data) => LoginDataModel.fromJson(data));
  }
}
