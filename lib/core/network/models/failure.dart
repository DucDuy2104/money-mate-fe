import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/shared/constants/app_strings.dart';
import 'package:money_mate/shared/helper/string_helper.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const Failure._();

  factory Failure.server(dynamic exception, [StackTrace? stackTrace]) =
      ServerFailure;
  factory Failure.client(dynamic exception, [StackTrace? stackTrace]) =
      ClientFailure;
  factory Failure.network(dynamic exception, [StackTrace? stackTrace]) =
      NetworkFailure;
  factory Failure.parse(dynamic exception, [StackTrace? stackTrace]) =
      ParseFailure;
  factory Failure.unknown(dynamic exception, [StackTrace? stackTrace]) =
      UnknownFailure;
  factory Failure.loggedOut() = LoggedOutFailure;

  String get message => displayMessage;

  String get displayMessage => when(
        loggedOut: () => AppStrings.errLoggedOut,
        server: (exception, stackTrace) => _getDebugMessage(
            AppStrings.errServerNotAvailable, exception, stackTrace),
        client: (exception, stackTrace) => StringHelper.getMessage(exception),
        network: (exception, stackTrace) => _getDebugMessage(
            AppStrings.errInternetNotAvailable, exception, stackTrace),
        parse: (exception, stackTrace) =>
            _getDebugMessage(AppStrings.errParseFailed, exception, stackTrace),
        unknown: (exception, stackTrace) => _getDebugMessage(
            AppStrings.errSomethingWentWrongPlsTryAgain, exception, stackTrace),
      );

  String _getDebugMessage(
      String defaultMessage, dynamic exception, StackTrace? stackTrace) {
    if (kDebugMode) {
      return StringHelper.getMessage([
        defaultMessage,
        if (exception != null) exception.toString(),
        if (stackTrace != null) stackTrace.toString(),
      ]);
    }
    return defaultMessage;
  }
}
