import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:money_mate/core/network/models/failure.dart';
import 'package:money_mate/core/service/logger/logger_service.dart';

class ApiResponse {
  final bool success;
  final Map<String, dynamic>? errors;
  final dynamic data;
  final String? message;

  ApiResponse({
    required this.success,
    this.errors,
    this.data,
    this.message,
  });

  String? get errorString => errors?.values.join(", ");

  static ApiResponse parseMap(dynamic response) {
    if (response is Map) {
      final extractedData = response['data'] ?? response;
      return ApiResponse(
        success: response['ok'] ?? (extractedData != null),
        errors: response['errors'] as Map<String, dynamic>?,
        data: extractedData,
        message: response['message'] as String?,
      );
    } else if (response is List) {
      return ApiResponse(success: true, data: response);
    } else {
      return ApiResponse(
        success: false,
        errors: {'unknown': 'Unknown response format'},
      );
    }
  }

  static Either<Failure, T> parseResponseEither<T>(
    Response response,
    T Function(dynamic data) parser,
  ) {
    try {
      if (response.statusCode! >= 500) {
        return left(Failure.server(response.statusMessage));
      }
      if (response.statusCode! >= 400) {
        final apiRes = parseMap(response.data);
        return left(Failure.client(apiRes.message ?? apiRes.errors.toString()));
      }
      final apiRes = parseMap(response.data);
      return right(parser(apiRes.data));
    } catch (e, s) {
      talker.log('Parse Model', exception: e, stackTrace: s);
      return left(Failure.parse(e.toString(), s));
    }
  }

  static Either<Failure, T> parseExceptionEither<T>(
    dynamic exception,
    StackTrace stack,
    T Function(dynamic data) parser,
  ) {
    if (exception is DioException) {
      if (exception.response != null) {
        return parseResponseEither(exception.response!, parser);
      }
      if (exception.type == DioExceptionType.connectionError ||
          exception.error is SocketException) {
        return left(Failure.network(exception.message ?? 'Network error'));
      }
      if (exception.type == DioExceptionType.connectionTimeout) {
        return left(Failure.server('Connection timeout'));
      }
    }
    return left(Failure.unknown(exception.toString(), stack));
  }
}
