import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/domain/entities/user.dart';

part 'login_data.freezed.dart';

@freezed
class LoginData with _$LoginData {
  const factory LoginData({
    required String accessToken,
    required String refreshToken,
    required User user,
  }) = _LoginData;
}
