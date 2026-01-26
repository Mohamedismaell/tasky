import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import '../app_color_schemes.dart';
import '../app_text_theme.dart';

ThemeData getDarkTheme() {
  final textTheme = AppTextTheme.from(darkColorScheme);
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: darkColorScheme,
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    inputDecorationTheme: InputDecorationTheme(
      // border: InputBorder.none,
      filled: true,
      fillColor: AppColors.surfaceDark,
      hintStyle: AppTextTheme.from(darkColorScheme).labelMedium,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, 40),
        shadowColor: Colors.black.withOpacity(0.25),
        elevation: 10,
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.textPrimaryDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    ),
  );
}
