import 'package:flutter/material.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.secondary,
  primaryColor: AppColors.primary,
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    elevation: 4,
  ),
  colorScheme: ColorScheme.light(
    primary: AppColors.primary,
    secondary: AppColors.accent,
    background: AppColors.secondary,
    surface: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: AppColors.primaryDark,
    onBackground: AppColors.primaryDark,
  ),
  cardColor: Colors.white,
  textTheme: const TextTheme(
    bodyMedium: TextStyle(color: AppColors.primaryDark),
    titleLarge: TextStyle(color: AppColors.primaryDark),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.accent,
    foregroundColor: Colors.white,
  ),
);
