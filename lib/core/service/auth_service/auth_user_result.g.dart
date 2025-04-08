// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_user_result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuthUserResultImpl _$$AuthUserResultImplFromJson(Map<String, dynamic> json) =>
    _$AuthUserResultImpl(
      firebaseIdToken: json['firebaseIdToken'] as String?,
      accessToken: json['accessToken'] as String?,
      idToken: json['idToken'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      displayName: json['displayName'] as String?,
    );

Map<String, dynamic> _$$AuthUserResultImplToJson(
        _$AuthUserResultImpl instance) =>
    <String, dynamic>{
      'firebaseIdToken': instance.firebaseIdToken,
      'accessToken': instance.accessToken,
      'idToken': instance.idToken,
      'email': instance.email,
      'avatar': instance.avatar,
      'displayName': instance.displayName,
    };
