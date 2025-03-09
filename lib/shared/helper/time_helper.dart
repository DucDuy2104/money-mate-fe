import 'package:intl/intl.dart';

class TimeHelper {
  /// `dd/MM/yyyy`
  static String formatDate(DateTime dateTime) {
    return DateFormat('dd/MM/yyyy').format(dateTime);
  }

  /// Check if date is the same
  static bool isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  /// (Hôm nay, Hôm qua, dd/MM/yyyy)
  static String formatFriendlyDate(DateTime dateTime) {
    final now = DateTime.now();
    if (isSameDay(dateTime, now)) {
      return "Hôm nay";
    } else if (isSameDay(dateTime, now.subtract(const Duration(days: 1)))) {
      return "Hôm qua";
    } else {
      return formatDate(dateTime);
    }
  }
}
