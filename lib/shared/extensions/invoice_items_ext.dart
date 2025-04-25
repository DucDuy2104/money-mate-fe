import 'package:money_mate/domain/entities/invoice_item.dart';

extension InvoiceItemsExt on List<InvoiceItem> {
  String toMessage() {
    return map((item) {
      return ' - ${item.name} (${item.quantity} x ${item.unit}) total: ${item.total}';
    }).join('\n');
  }
}
