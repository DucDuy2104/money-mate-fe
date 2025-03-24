// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String,
      name: json['name'] as String?,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String?,
      isActive: json['isActive'] as bool? ?? false,
      isSetup: json['isSetup'] as bool? ?? false,
      budget: (json['budget'] as num?)?.toDouble() ?? 0.0,
      avatarUrl: json['avatarUrl'] as String?,
      role: json['role'] as String? ?? 'user',
      refreshToken: json['refreshToken'] as String?,
      verificationCode: json['verificationCode'] as String?,
      verificationCodeExpire: json['verificationCodeExpire'] == null
          ? null
          : DateTime.parse(json['verificationCodeExpire'] as String),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'isActive': instance.isActive,
      'isSetup': instance.isSetup,
      'budget': instance.budget,
      'avatarUrl': instance.avatarUrl,
      'role': instance.role,
      'refreshToken': instance.refreshToken,
      'verificationCode': instance.verificationCode,
      'verificationCodeExpire':
          instance.verificationCodeExpire?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
