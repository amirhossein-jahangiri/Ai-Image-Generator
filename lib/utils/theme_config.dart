import 'package:flutter/material.dart';

class AppColors {
  static const Color scaffoldBackground = Colors.black;
  static const Color background = Colors.black;
  static const Color primary = Color(0xFF6A1B9A);
  static const Color secondary = Color(0xFF303F9F);
  static const Color tertiary = Color(0xFF512DA8);
  static const Color white = Colors.white;
  static const Color shadow = Colors.black45;
  static const Color card = Color(0xff0f0f0f);
}

class ThemeConfig {
  static ThemeData get darkTheme {
    final colorScheme = ColorScheme(
      brightness: Brightness.dark,
      primary: AppColors.primary,
      onPrimary: AppColors.white,
      secondary: AppColors.secondary,
      onSecondary: AppColors.white,
      tertiary: AppColors.tertiary,
      onTertiary: AppColors.white,
      error: Colors.red.shade400,
      onError: AppColors.white,
      background: AppColors.background,
      onBackground: AppColors.white,
      surface: AppColors.secondary.withOpacity(0.2),
      onSurface: AppColors.white,
    );

    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: colorScheme.background,
      fontFamily: 'Vazir',
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        titleTextStyle: TextStyle(
          fontFamily: 'Vazir',
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
        iconTheme: IconThemeData(color: colorScheme.onSurface),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: colorScheme.onSurface,
        ),
        displayMedium: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: colorScheme.onSurface,
        ),
        titleLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: colorScheme.onSurface,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: colorScheme.onSurface,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: colorScheme.onSurface,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          shadowColor: AppColors.shadow,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colorScheme.surface,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.secondary.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: colorScheme.primary),
          borderRadius: BorderRadius.circular(8),
        ),
        labelStyle: TextStyle(color: colorScheme.onSurface),
        hintStyle: TextStyle(color: colorScheme.onSurface.withOpacity(0.6)),
      ),
    );
  }
}
