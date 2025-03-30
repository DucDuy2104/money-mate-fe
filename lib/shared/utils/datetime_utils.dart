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
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }
}
