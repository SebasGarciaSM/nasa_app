import 'package:flutter/material.dart';
import 'app_colors.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: AppColors.black,
  primaryColor: AppColors.primaryDark,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.transparent,
    foregroundColor: AppColors.white,
    elevation: 4,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColors.white,
      fontWeight: FontWeight.w400,
    ),
  ),
  colorScheme: ColorScheme.dark(
    primary: AppColors.primaryLight,
    secondary: AppColors.accent,
    surface: AppColors.primaryDark,
    onPrimary: AppColors.white,
    onSecondary: AppColors.secondary,
    onSurface: Colors.white,
  ),
  cardColor: AppColors.spacePurple,
  textTheme: const TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.white,
      letterSpacing: 1.2,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.white,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.white,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    ),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.white,
    ),
  ),
  expansionTileTheme: ExpansionTileThemeData(
    backgroundColor: AppColors.primaryDark,
    iconColor: AppColors.white,
  ),
);
