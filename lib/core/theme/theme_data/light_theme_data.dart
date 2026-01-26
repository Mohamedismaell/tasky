import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import '../app_color_schemes.dart';

import '../app_text_theme.dart';

ThemeData getLightTheme() {
  final textTheme = AppTextTheme.from(lightColorScheme);
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: lightColorScheme,
    textTheme: textTheme,
    scaffoldBackgroundColor: AppColors.backgroundLight,

    //! input
    inputDecorationTheme: InputDecorationTheme(
      // border: InputBorder.none,
      filled: true,
      fillColor: AppColors.surfaceLight,
      hintStyle: AppTextTheme.from(lightColorScheme).labelMedium,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(color: AppColors.outlineLight),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: AppColors.outlineLight,
        ), // Force the color here
      ),

      // 3. The border when the field is focused
    ),

    //! ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(double.infinity, 40),
        shadowColor: Colors.black.withOpacity(0.25),
        elevation: 10,
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.textPrimaryDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      ),
    ),
  );
}
