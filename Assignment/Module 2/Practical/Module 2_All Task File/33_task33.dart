// Task 33:
// Explore and integrate the intl package to format dates and numbers in different locales.

import 'package:intl/intl.dart';

void main() {
  // Formatting numbers
  var numberFormat = NumberFormat("#,##0.00", "en_US");
  print("Formatted number: ${numberFormat.format(1234567.89)}");

  // Formatting dates
  var dateFormat = DateFormat("yyyy-MM-dd", "en_US");
  print("Formatted date: ${dateFormat.format(DateTime.now())}");
}
