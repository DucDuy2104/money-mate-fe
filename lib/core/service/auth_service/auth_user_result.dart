import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_user_result.freezed.dart';
part 'auth_user_result.g.dart';

@freezed
class AuthUserResult with _$AuthUserResult {
  const factory AuthUserResult({
    String? firebaseIdToken,
    String? accessToken,
    String? idToken,
    String? email,
    String? avatar,
    String? displayName,
  }) = _AuthUserResult;

  factory AuthUserResult.fromJson(Map<String, dynamic> json) => 
      _$AuthUserResultFromJson(json);
}