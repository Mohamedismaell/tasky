import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/app_colors.dart';
import '../app_color_schemes.dart';
import '../app_text_theme.dart';

ThemeData getDarkTheme() {
  final rawTextTheme = AppTextTheme.from(darkColorScheme);
  final responsiveTextTheme = rawTextTheme.apply(fontSizeFactor: 1.sp);
  return ThemeData(
    brightness: Brightness.dark,
    useMaterial3: true,
    colorScheme: darkColorScheme,
    textTheme: responsiveTextTheme,
    scaffoldBackgroundColor: AppColors.backgroundDark,

    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppColors.textPrimaryDark,
      selectionColor: AppColors.textPrimaryDark.withOpacity(0.4),
      selectionHandleColor: AppColors.textPrimaryDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      // border: InputBorder.none,
      filled: true,
      fillColor: AppColors.surfaceDark,
      hintStyle: AppTextTheme.from(darkColorScheme).labelMedium,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16.r),
        borderSide: BorderSide.none,
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        // fixedSize: Size(double.infinity, 40.h),
        shadowColor: Colors.black.withOpacity(0.25),
        elevation: 10.r,
        backgroundColor: AppColors.primaryDark,
        foregroundColor: AppColors.textPrimaryDark,
        padding: EdgeInsets.symmetric(vertical: 10.h),
        textStyle: responsiveTextTheme.bodyMedium?.copyWith(inherit: true),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24.r),
        ),
      ),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return Colors.white;
        return Colors.grey;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return AppColors.primaryDark;
        return AppColors.surfaceDark;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      checkColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return Colors.white;
        return Colors.grey;
      }),
      side: BorderSide(width: 2, color: Colors.grey),
    ),
  );
}
