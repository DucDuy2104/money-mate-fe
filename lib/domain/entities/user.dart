import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    String? name,
    required String email,
    required String? phoneNumber,
    required bool isActive,
    required bool isSetup,
    required double budget,
    String? avatarUrl,
    required String role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _User;
}
