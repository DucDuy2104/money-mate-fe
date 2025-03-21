import 'package:dio/dio.dart';
import 'package:money_mate/data/data_sources/local/local_data_source.dart';

class AuthInterceptor extends Interceptor {
  final Dio _dio;
  final OnboardLocalDataSource _localDataSource;
  static const String _refreshEndpoint = '/auth/refresh';

  AuthInterceptor(this._dio, this._localDataSource);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.path != _refreshEndpoint) {
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
        err.requestOptions.path != _refreshEndpoint) {
      // final refreshed = await _localDataSource.refreshToken();
      // if (refreshed) {
      //   return handler.resolve(await _retry(err.requestOptions));
      // }
    }
    handler.next(err);
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
