import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';

Logger getLogger() {
  Logger logger = Logger(
    filter: null,
    printer: PrettyPrinter(
      methodCount: 0,
      printTime: true,
      colors: true, // Colorful log messages
      printEmojis: true, // Print an emoji for each log message
    ),
    output: null,
  );
  return logger;
}

void hideKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

Color addWhite(Color color, double whitePercentage) {
  whitePercentage = whitePercentage.clamp(0.0, 1.0);

  int red = (color.red + ((255 - color.red) * whitePercentage)).toInt();
  int green = (color.green + ((255 - color.green) * whitePercentage)).toInt();
  int blue = (color.blue + ((255 - color.blue) * whitePercentage)).toInt();

  return Color.fromARGB(color.alpha, red, green, blue);
}

Widget addVerticalSpace(double height) {
  return SizedBox(height: height);
}

Widget addHorizontalSpace(double width) {
  return SizedBox(width: width);
}

String getCurrentDate() {
  return DateFormat('dd-MM-yyyy').format(DateTime.now());
}

int getTotalNumberOfDays(String date) {
  var time = 0;
  try {
    DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    DateTime thatDay = dateFormat.parse(date);
    String today = DateFormat('dd-MM-yyyy').format(DateTime.now());
    DateTime toDay = dateFormat.parse(today);
    Duration duration = toDay.difference(thatDay);
    int difference = duration.inMilliseconds;
    double days = (difference / (24 * 60 * 60 * 1000));
    return days.toInt();
  } on Exception {
    return time;
  }
}

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1), radix: 16) + 0xFF000000);
}

Color hexToColorNew(String hexString) {
  if (hexString.startsWith('#')) {
    hexString = hexString.substring(1);
  }
  if (hexString.length == 6 || hexString.length == 8) {
    // If the string is 6 characters long, prepend "FF" to the string for full opacity
    if (hexString.length == 6) {
      hexString = 'FF$hexString';
    }
    return Color(int.parse(hexString, radix: 16));
  } else {
    throw const FormatException("Invalid hexadecimal color string");
  }
}