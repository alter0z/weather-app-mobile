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

  static String getDate(String dateTimeString) {
    // DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    //
    // return DateFormat('EEEE, d MMMM yyyy').format(dateTime);
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('EEE, d MMM').format(dateTime);
  }

  static String getTime(String dateTimeString) {
    // DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    //
    // return DateFormat('HH:mm:ss').format(dateTime);
    DateTime dateTime = DateTime.parse(dateTimeString);
    return DateFormat('HH:mm:ss').format(dateTime);
  }

  static bool compareDate(String dateTimeString, DateTime now) {
    DateTime dateTime = DateTime.parse(dateTimeString);
    // DateTime dateFromTimestamp = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    DateTime dateOnly = DateTime(dateTime.year, dateTime.month, dateTime.day);
    DateTime nowDateOnly = DateTime(now.year, now.month, now.day);

    if (dateOnly.isAtSameMomentAs(nowDateOnly)) {
      return true;
    } else {
      return false;
    }
  }

  // static int getDayIndex(String forecastDateString, DateTime baseDate, int range) {
  //   DateTime forecastDate = DateTime.parse(forecastDateString);
  //   DateTime forecastDateOnly = DateTime(forecastDate.year, forecastDate.month, forecastDate.day);
  //
  //   for (int i = 1; i <= range; i++) {
  //     DateTime targetDate = baseDate.add(Duration(days: i));
  //     DateTime targetDateOnly = DateTime(targetDate.year, targetDate.month, targetDate.day);
  //
  //     if (forecastDateOnly.isAtSameMomentAs(targetDateOnly)) {
  //       return i - 1;
  //     }
  //   }
  //   return -1;
  // }
}