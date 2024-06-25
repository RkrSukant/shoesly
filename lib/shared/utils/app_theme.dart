import 'package:flutter/material.dart';
import 'package:sukant_shoesly/shared/utils/colors.dart';

@immutable
class AppTheme {

  const AppTheme._();

  static ThemeData define() {
    return ThemeData(
      fontFamily: 'Urbanist',
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      colorScheme: ColorScheme.fromSwatch().copyWith(
        secondary: AppColors.secondaryColor,
        surfaceTint: AppColors.neutral0_FFFFFF,
      ),
    );
  }
}