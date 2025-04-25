import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:money_mate/domain/entities/invoice_item.dart';

class SelectedInvoicesCubit extends Cubit<Set<InvoiceItem>> {
  SelectedInvoicesCubit() : super({});

  void toggleInvoiceSelection(InvoiceItem invoice) {
    final selectedInvoices = Set<InvoiceItem>.from(state);
    if (selectedInvoices.contains(invoice)) {
      selectedInvoices.remove(invoice);
    } else {
      selectedInvoices.add(invoice);
    }
    emit(selectedInvoices);
  }

  void addAll(List<InvoiceItem> invoices) {
    clear();
    final selectedInvoices = Set<InvoiceItem>.from(state);
    selectedInvoices.addAll(invoices);
    emit(selectedInvoices);
  }

  void clear() {
    emit({});
  }

  List<InvoiceItem> getList() {
    return state.toList();
  }
}
