import 'package:intl/intl.dart';

extension DatetimeExt on DateTime {
  String toHourMinute() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }

  String toVietnameseFormat() {
    const List<String> weekdays = [
      'Chủ Nhật',
      'Thứ 2',
      'Thứ 3',
      'Thứ 4',
      'Thứ 5',
      'Thứ 6',
      'Thứ 7'
    ];

    String dayOfWeek = weekdays[weekday % 7];
    String day = this.day.toString().padLeft(2, '0');
    String month = this.month.toString().padLeft(2, '0');
    String year = this.year.toString();

    return '$dayOfWeek, $day/$month/$year';
  }

  DateTime toUtcPlus7() {
    return toUtc().add(const Duration(hours: 7));
  }

  String formatDateTime() {
    final now = DateTime.now();
    final isSameDay = year == now.year && month == now.month && day == now.day;

    if (isSameDay) {
      return 'Hôm nay';
    } else {
      return DateFormat('dd/MM/yyyy').format(this);
    }
  }
}
