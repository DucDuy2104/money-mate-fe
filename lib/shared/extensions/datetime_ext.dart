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

    String dayOfWeek = weekdays[this.weekday % 7];
    String day = this.day.toString().padLeft(2, '0');
    String month = this.month.toString().padLeft(2, '0');
    String year = this.year.toString();

    return '$dayOfWeek, $day/$month/$year';
  }
}
