import 'package:intl/intl.dart';

abstract class AppDateTime {
  static String getTimeOfDayGreeting() {
    final now = DateTime.now();
    final hour = now.hour;

    if (hour >= 5 && hour < 12) {
      return "Good Morning";
    } else if (hour >= 12 && hour < 17) {
      return "Good Afternoon";
    } else if (hour >= 17 && hour < 20) {
      return "Good Evening";
    } else {
      return "Good Night";
    }
  }

  static String formatDateNow() {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, d MMMM yyyy');
    return formatter.format(now);
  }

  static String getDate(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    return DateFormat('EEEE, d MMMM yyyy').format(dateTime); // Date
  }

  static String getTime(int timestamp) {
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);

    return DateFormat('HH:mm:ss').format(dateTime);
  }
}