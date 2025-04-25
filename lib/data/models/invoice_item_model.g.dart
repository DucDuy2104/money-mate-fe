// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'invoice_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$InvoiceItemModelImpl _$$InvoiceItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$InvoiceItemModelImpl(
      id: json['id'] as String,
      enumValue: json['enum'] as String,
      unit: json['unit'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num).toDouble(),
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$$InvoiceItemModelImplToJson(
        _$InvoiceItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'enum': instance.enumValue,
      'unit': instance.unit,
      'name': instance.name,
      'quantity': instance.quantity,
      'total': instance.total,
    };
