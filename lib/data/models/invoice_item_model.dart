import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/domain/entities/invoice_item.dart';
import 'package:money_mate/shared/enums/category_enum.dart';

part 'invoice_item_model.freezed.dart';
part 'invoice_item_model.g.dart';

@freezed
class InvoiceItemModel with _$InvoiceItemModel {
  const factory InvoiceItemModel({
    required String id,
    @JsonKey(name: 'enum') required String enumValue,
    required String unit,
    required String name,
    required double quantity,
    required double total,
  }) = _InvoiceItemModel;

  factory InvoiceItemModel.fromJson(Map<String, dynamic> json) =>
      _$InvoiceItemModelFromJson(json);
}

extension InvoiceItemModelX on InvoiceItemModel {
  InvoiceItem toEntity() {
    return InvoiceItem(
      id: id,
      enumValue: CategoryEnum.parseEnum(enumValue),
      unit: unit,
      quantity: quantity,
      total: total,
      name: name,
    );
  }
}
