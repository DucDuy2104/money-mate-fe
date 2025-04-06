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

  // Transaction date formatting
  static String formatCustomDateTime(DateTime dateTime) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final inputDate = DateTime(dateTime.year, dateTime.month, dateTime.day);

    final timeFormat = DateFormat('HH:mm');
    final dateFormat = DateFormat('dd/MM');
    final fullDateFormat = DateFormat('dd/MM/yyyy');

    if (inputDate == today) {
      return timeFormat.format(dateTime);
    } else if (inputDate == yesterday) {
      return 'hôm qua ${timeFormat.format(dateTime)}';
    } else if (dateTime.year == now.year) {
      return '${dateFormat.format(dateTime)} ${timeFormat.format(dateTime)}';
    } else {
      return '${fullDateFormat.format(dateTime)} ${timeFormat.format(dateTime)}';
    }
  }
}
