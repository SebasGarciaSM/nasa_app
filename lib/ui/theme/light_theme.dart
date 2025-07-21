import 'package:flutter/material.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.secondary,
  primaryColor: AppColors.primaryLight,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.transparent,
    foregroundColor: AppColors.primaryDark,
    elevation: 4,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColors.primaryDark,
      fontWeight: FontWeight.w400,
    ),
    surfaceTintColor: Colors.red,
  ),
  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.accent,
    surface: AppColors.white,
    onPrimary: AppColors.white,
    onSecondary: AppColors.secondary,
    onSurface: AppColors.primaryDark,
  ),
  cardColor: AppColors.white,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryDark,
      letterSpacing: 1.2,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryDark,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryDark,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.primaryDark,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryDark,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryDark,
    ),
  ),
  expansionTileTheme: ExpansionTileThemeData(
    backgroundColor: AppColors.white,
  ),
);
