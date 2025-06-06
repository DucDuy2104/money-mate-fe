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
      invoiceItems: (json['invoiceItems'] as List<dynamic>?)
          ?.map((e) => InvoiceItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      content: json['content'] as String?,
      isSentByMe: json['isSentByMe'] as bool,
      assets:
          (json['assets'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'conversation': instance.conversation,
      'transaction': instance.transaction,
      'category': instance.category,
      'invoiceItems': instance.invoiceItems,
      'type': instance.type,
      'content': instance.content,
      'isSentByMe': instance.isSentByMe,
      'assets': instance.assets,
      'createdAt': instance.createdAt.toIso8601String(),
    };
