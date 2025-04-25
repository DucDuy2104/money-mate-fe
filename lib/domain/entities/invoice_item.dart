import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:money_mate/shared/enums/category_enum.dart';

part 'invoice_item.freezed.dart';

@freezed
class InvoiceItem with _$InvoiceItem {
  const factory InvoiceItem({
    required String id,
    required String name,
    required CategoryEnum enumValue,
    required String unit,
    required double quantity,
    required double total,
  }) = _InvoiceItem;
}
