import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String id,
    String? name,
    required String email,
    String? phoneNumber,
    bool? isActive,
    double? budget,
    String? avatarUrl,
    String? role,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _User;
}
