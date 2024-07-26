import 'package:intl/intl.dart';

// DateUtilities: Date formatting utilities
class DateUtilities {
  // Formats the date to "day Month, year" (e.g., 18 Jun, 2024)
  static String formatDayMonthYear(DateTime dateTime) {
    return DateFormat("d MMM, yyyy").format(dateTime);
  }

  // Formats the date to "day.month.year" (e.g., 18.06.2024)
  static String formatDayDotMonthDotYear(DateTime dateTime) {
    return DateFormat("dd.MM.yyyy").format(dateTime);
  }

  // Gets the current date formatted as "day.month.year" (e.g., 18.06.2024)
  static String getCurrentDateFormatted() {
    DateTime now = DateTime.now();
    return DateFormat('dd.MM.yyyy').format(now);
  }
}
