import 'package:flutter/material.dart';
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