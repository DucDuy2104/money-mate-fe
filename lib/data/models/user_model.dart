import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/domain/entities/user.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  factory UserModel({
    required String id,
    String? name,
    required String email,
    String? phoneNumber,
    @Default(false) bool isActive,
    @Default(false) bool isSetup,
    @Default(0.0) double budget,
    String? avatarUrl,
    @Default('user') String role,
    @Default(0) int categoriesCount,
    @Default(0) int transactionsCount,
    @Default(0) int reportsCount,
    String? refreshToken,
    String? verificationCode,
    DateTime? verificationCodeExpire,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

extension UserModelX on UserModel {
  toEntity() {
    return User(
        id: id,
        name: name,
        email: email,
        avatarUrl: avatarUrl,
        budget: budget,
        isActive: isActive,
        isSetup: isSetup,
        role: role,
        phoneNumber: phoneNumber,
        createdAt: createdAt,
        updatedAt: updatedAt,
        categoriesCount: categoriesCount,
        transactionsCount: transactionsCount,
        reportsCount: reportsCount);
  }
}
