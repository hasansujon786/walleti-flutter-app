import 'package:intl/intl.dart';

class Formatters {
  // currency
  static final currency = NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 1);
  static final currencyNoDecimal = NumberFormat.currency(locale: 'en_US', symbol: '\$', decimalDigits: 0);

  // date
  static final monthDayYear = DateFormat().add_yMMMd();
  static final monthDay = DateFormat().add_MMMd();
  static final monthDayFull = DateFormat().add_MMMMd();
  static final dayName = DateFormat.E();
  static final dayNameFull = DateFormat.EEEE();
}
