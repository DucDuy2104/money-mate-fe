import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/data/models/user_model.dart';
import 'package:money_mate/domain/entities/login_data.dart';

part 'login_data_model.freezed.dart';
part 'login_data_model.g.dart';

@freezed
class LoginDataModel with _$LoginDataModel {
  const factory LoginDataModel({
    required String accessToken,
    required String refreshToken,
    required UserModel user,
  }) = _LoginDataModel;

  factory LoginDataModel.fromJson(Map<String, dynamic> json) =>
      _$LoginDataModelFromJson(json);
}

extension LoginDataModelX on LoginDataModel {
  toEntity() {
    return LoginData(
      accessToken: accessToken,
      refreshToken: refreshToken,
      user: user.toEntity(),
    );
  }
}
