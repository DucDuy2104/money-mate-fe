import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:money_mate/core/service/getit/locator.dart';
import 'package:money_mate/data/data_sources/local/local_data_source.dart';
import 'package:money_mate/data/repositories/auth_repository.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final OnboardLocalDataSource _localDataSource;
  late AuthRepository _authRepository;
  static const String _refreshEndpoint = '/auth/refresh-token';
  static const String _googleAuthEndpoint = '/auth/google';

  AuthInterceptor(this._dio, this._localDataSource);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path == _refreshEndpoint) {
      options.headers['Authorization'] =
          'Bearer ${_localDataSource.getRefreshToken()}';
    }
    if (options.path != _refreshEndpoint &&
        options.path != _googleAuthEndpoint) {
      final accessToken = _localDataSource.getAccessToken();
      if (accessToken != null) {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if ((err.response?.statusCode == 401 || err.response?.statusCode == 417) &&
        err.requestOptions.path != _refreshEndpoint &&
        err.requestOptions.path != _googleAuthEndpoint) {
      try {
        _authRepository = getIt<AuthRepository>();
        final refreshResult = await _authRepository.refreshToken();
        await refreshResult.fold(
          (failure) {
            debugPrint('Token refresh failed: $failure');
            handler.next(err);
          },
          (data) async {
            await _localDataSource.saveAccessToken(data.accessToken);
            await _localDataSource.saveRefreshToken(data.refreshToken);
            final response = await _retry(err.requestOptions);
            handler.resolve(response);
          },
        );
      } catch (e) {
        debugPrint('Error during token refresh: $e');
        handler.next(err);
      }
    } else {
      handler.next(err);
    }
  }

  Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final newAccessToken = _localDataSource.getAccessToken();
    final options = Options(
      method: requestOptions.method,
      headers: {
        ...requestOptions.headers,
        'Authorization': 'Bearer $newAccessToken',
      },
    );

    return _dio.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }
}
