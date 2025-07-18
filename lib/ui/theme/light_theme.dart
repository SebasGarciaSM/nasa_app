import 'package:flutter/material.dart';
import 'package:nasa_app/ui/theme/app_colors.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.secondary,
  primaryColor: AppColors.primary,
  appBarTheme: AppBarTheme(
    backgroundColor: Colors.transparent,
    //foregroundColor: Colors.white,
    elevation: 4,
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: AppColors.voidBlack,
      fontWeight: FontWeight.w300,
    ),
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
    displayLarge: TextStyle(
      // Título grande (pantalla o header principal)
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.primaryDark,
      letterSpacing: 1.2,
    ),
    headlineMedium: TextStyle(
      // Subtítulo o título de sección
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.primaryDark,
    ),
    titleMedium: TextStyle(
      // Título dentro de tarjetas o bloques
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryDark,
    ),
    bodyLarge: TextStyle(
      // Texto largo, como descripciones
      fontSize: 16,
      fontWeight: FontWeight.w400,
      height: 1.5,
      color: AppColors.primaryDark,
    ),
    bodyMedium: TextStyle(
      // Texto común, general
      fontSize: 14,
      fontWeight: FontWeight.w400,
      color: AppColors.primaryDark,
    ),
    labelLarge: TextStyle(
      // Etiquetas o botones
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.primaryDark,
    ),
  ),
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: AppColors.accent,
    foregroundColor: Colors.white,
  ),
  iconButtonTheme: IconButtonThemeData(
    style: ButtonStyle(
      iconColor: WidgetStateColor.resolveWith((state) {
        return AppColors.blueDark;
      }),
      // backgroundColor: WidgetStateProperty.resolveWith<Color?>((states) {
      //   if (states.contains(WidgetState.pressed)) {
      //     return AppColors.secondaryDark;
      //   }
      //   return AppColors.secondary; // 👈 fondo normal
      // }),
    ),
  ),
);
