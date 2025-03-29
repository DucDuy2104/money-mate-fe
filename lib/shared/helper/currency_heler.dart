import 'package:intl/intl.dart';

class CurrencyHelper {
  /// Format VND
  static String formatCurrency(double amount) {
    final currencyFormatter =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫');
    return currencyFormatter.format(amount);
  }

  /// Format tiền tệ ngắn gọn: từ 1 triệu trở lên sẽ hiển thị M (triệu)
  static String formatCurrencyCompact(double amount) {
    if (amount >= 1000000) {
      double million = amount / 1000000;
      return '${million.toStringAsFixed(million.truncateToDouble() == million ? 0 : 1)}M ₫';
    }
    final currencyFormatter =
        NumberFormat.currency(locale: 'vi_VN', symbol: '₫', decimalDigits: 0);
    return currencyFormatter.format(amount);
  }
}
