import 'package:intl/intl.dart';

extension DateHelpers on DateTime {
  bool isToday() {
    final now = DateTime.now();
    return now.day == this.day &&
        now.month == this.month &&
        now.year == this.year;
  }

  bool isYesterday() {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == this.day &&
        yesterday.month == this.month &&
        yesterday.year == this.year;
  }
}

getDate(dateTime) {
  if (dateTime != null) {
    var date = DateTime.parse(dateTime);
    return "${date.day.toString().length == 1 ? '0${date.day}' : date.day}.${date.month.toString().length == 1 ? '0${date.month}' : date.month}.${date.year}";
  }
  return '';
}
