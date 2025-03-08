import 'package:intl/intl.dart';

class CurrencyHelper {
  /// Format VND
  static String formatCurrency(double amount) {
    final currencyFormatter = NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    return currencyFormatter.format(amount);
  }
}
