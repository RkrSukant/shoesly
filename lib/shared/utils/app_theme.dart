import 'package:flutter/material.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';

@immutable
class AppTheme {
  static const colors = AppColors();

  const AppTheme._();

  static ThemeData define() {
    return ThemeData(
      fontFamily: 'Urbanist',
      primaryColor: colors.backGroundColor,
      scaffoldBackgroundColor: colors.backGroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: colors.secondaryColor,
        surfaceTint: colors.white_FFFFFF,
      ),
      dividerTheme: const DividerThemeData(
        color: AppColors.grey_E8E9F1,
      ),
    );
  }
}