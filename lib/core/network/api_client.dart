import 'package:dio/dio.dart';
import 'package:money_mate/core/config/api_config.dart';
import 'package:money_mate/core/network/interceptors/auth_interceptor.dart';
import 'package:money_mate/core/network/interceptors/bad_certificate_fixer.dart';
import 'package:money_mate/core/network/models/api_request.dart';
import 'package:money_mate/core/network/models/api_response.dart';
import 'package:money_mate/core/service/logger/logger_service.dart';
import 'package:money_mate/data/data_sources/local/local_data_source.dart';
import 'package:money_mate/shared/utils/typedefs.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';

// Define the Parser type alias
typedef Parser<T> = T Function(dynamic data);

// Dio Configuration
Dio configureDio(OnboardLocalDataSource localDataSource) {
  final dio = Dio(BaseOptions(baseUrl: ApiConfig.apiBaseUrl));

  dio.interceptors.addAll([
    TalkerDioLogger(
      talker: talker,
      settings: const TalkerDioLoggerSettings(printRequestHeaders: true),
    ),
    AuthInterceptor(dio, localDataSource),
  ]);

  fixBadCertificate(dio: dio);
  return dio;
}

// API Client Interface
abstract class ApiClient {
  ResultFuture<T> get<T>({required ApiRequest req, Parser<T>? parser});
  ResultFuture<T> post<T>({required ApiRequest req, Parser<T>? parser});
  ResultFuture<T> delete<T>({required ApiRequest req, Parser<T>? parser});
  ResultFuture<T> put<T>({required ApiRequest req, Parser<T>? parser});
  ResultFuture<T> patch<T>({required ApiRequest req, Parser<T>? parser});
}

// API Client Implementation
class ApiClientImpl implements ApiClient {
  final Dio _client;

  ApiClientImpl(this._client);

  @override
  ResultFuture<T> get<T>({
    required ApiRequest req,
    Parser<T>? parser,
  }) {
    return _executeRequest(() {
      return _client.get(
        req.url,
        queryParameters: req.query,
        options: Options(
          headers: req.mergeHeaders(_client.options.headers),
        ),
      );
    }, parser);
  }

  @override
  ResultFuture<T> post<T>({
    required ApiRequest req,
    Parser<T>? parser,
  }) {
    return _executeRequest(() {
      return _client.post(
        req.url,
        queryParameters: req.query,
        data: req.body,
        options: Options(
          headers: req.mergeHeaders(_client.options.headers),
        ),
      );
    }, parser);
  }

  @override
  ResultFuture<T> delete<T>({
    required ApiRequest req,
    Parser<T>? parser,
  }) {
    return _executeRequest(() {
      return _client.delete(
        req.url,
        queryParameters: req.query,
        data: req.body,
        options: Options(
          headers: req.mergeHeaders(_client.options.headers),
        ),
      );
    }, parser);
  }

  @override
  ResultFuture<T> put<T>({
    required ApiRequest req,
    Parser<T>? parser,
  }) {
    return _executeRequest(() {
      return _client.put(
        req.url,
        queryParameters: req.query,
        data: req.body,
        options: Options(
          headers: req.mergeHeaders(_client.options.headers),
        ),
      );
    }, parser);
  }

  @override
  ResultFuture<T> patch<T>({
    required ApiRequest req,
    Parser<T>? parser,
  }) {
    return _executeRequest(() {
      return _client.patch(
        req.url,
        queryParameters: req.query,
        data: req.body,
        options: Options(
          headers: req.mergeHeaders(_client.options.headers),
        ),
      );
    }, parser);
  }

  ResultFuture<T> _executeRequest<T>(
    Future<Response> Function() request,
    Parser<T>? parser,
  ) async {
    try {
      final response = await request();
      return ApiResponse.parseResponseEither(response, _parser(parser));
    } catch (e, s) {
      talker.handle(e, s);

      // Handle concurrent modification during iteration
      List<dynamic> headersCopy = List.from(_client.options.headers.entries);
      List<dynamic> toRemove = [];

      for (var header in headersCopy) {
        if (header.key == 'Authorization') {
          toRemove.add(header);
        }
      }

      for (var header in toRemove) {
        _client.options.headers.remove(header.key);
      }

      return ApiResponse.parseExceptionEither(e, s, _parser(parser));
    }
  }

  dynamic _parser(dynamic parser) => parser ?? ((data) => data);
}