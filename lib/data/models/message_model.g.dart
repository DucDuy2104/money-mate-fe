// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      id: json['id'] as String,
      user: json['user'] as String,
      conversation: json['conversation'] as String,
      transaction: json['transaction'] == null
          ? null
          : TransactionModel.fromJson(
              json['transaction'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : CategoryModel.fromJson(json['category'] as Map<String, dynamic>),
      type: json['type'] as String,
      content: json['content'] as String,
      isSentByMe: json['isSentByMe'] as bool,
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'conversation': instance.conversation,
      'transaction': instance.transaction,
      'category': instance.category,
      'type': instance.type,
      'content': instance.content,
      'isSentByMe': instance.isSentByMe,
      'createdAt': instance.createdAt.toIso8601String(),
    };
