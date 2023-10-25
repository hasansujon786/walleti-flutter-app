import 'package:walleti/shared/utils/utils.dart';

extension MyDateUtils on DateTime {
  int get calculateDifferenceWithToday {
    DateTime now = DateTime.now();
    return difference(DateTime(now.year, now.month, now.day)).inDays;
  }

  String get relateiveDate {
    final now = DateTime.now();
    final date = this;
    final difference = calculateDifferenceWithToday;
    return difference == 0
        ? 'Today'
        : difference == -1
            ? 'Yesterday'
            : date.year == now.year
                ? Formatters.monthDay.format(date)
                : Formatters.monthDayYear.format(date);
  }
}
