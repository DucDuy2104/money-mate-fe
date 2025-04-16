class DatetimeUtils {
  static List<String> getLastFourMonths() {
    List<String> result = [];
    DateTime now = DateTime.now();

    for (int i = 3; i >= 0; i--) {
      DateTime pastMonth = DateTime(now.year, now.month - i, 1);
      result.add(_getMonthAbbreviation(pastMonth.month));
    }

    return result;
  }

  static String _getMonthAbbreviation(int month) {
    List<String> months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec'
    ];
    return months[month - 1];
  }

  static bool isSameDate(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }
}
