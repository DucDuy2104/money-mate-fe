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
      avatar: json['avatar'] as String?,
      role: json['role'] as String? ?? 'user',
      categoriesCount: (json['categoriesCount'] as num?)?.toInt() ?? 0,
      transactionsCount: (json['transactionsCount'] as num?)?.toInt() ?? 0,
      reportsCount: (json['reportsCount'] as num?)?.toInt() ?? 0,
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
      'avatar': instance.avatar,
      'role': instance.role,
      'categoriesCount': instance.categoriesCount,
      'transactionsCount': instance.transactionsCount,
      'reportsCount': instance.reportsCount,
      'refreshToken': instance.refreshToken,
      'verificationCode': instance.verificationCode,
      'verificationCodeExpire':
          instance.verificationCodeExpire?.toIso8601String(),
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
