import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import '../app_color_schemes.dart';

import '../app_text_theme.dart';

ThemeData getLightTheme() {
  final rawTextTheme = AppTextTheme.from(lightColorScheme);
  final responsiveTextTheme = rawTextTheme.apply(fontSizeFactor: 1.sp);
  return ThemeData(
    brightness: Brightness.light,
    useMaterial3: true,
    colorScheme: lightColorScheme,
    textTheme: responsiveTextTheme,
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
        borderSide: BorderSide(color: AppColors.outlineLight),
      ),
    ),

    //! ElevatedButton
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // fixedSize: Size(double.infinity, 40.h),
        shadowColor: Colors.black.withOpacity(0.25),
        elevation: 10,
        backgroundColor: AppColors.primaryLight,
        foregroundColor: AppColors.textPrimaryDark,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        textStyle: responsiveTextTheme.bodyMedium?.copyWith(inherit: true),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
      ),
    ),
  );
}
