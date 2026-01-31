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

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      titleTextStyle: AppTextTheme.from(darkColorScheme).titleLarge,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: AppColors.backgroundDark,
      titleTextStyle: AppTextTheme.from(darkColorScheme).titleLarge,
      contentTextStyle: AppTextTheme.from(darkColorScheme).bodyLarge,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
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

    splashFactory: NoSplash.splashFactory,
    popupMenuTheme: PopupMenuThemeData(
      menuPadding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 4.h),
      color: AppColors.backgroundDark,
      labelTextStyle: WidgetStateProperty.all(
        responsiveTextTheme.titleSmall?.copyWith(),
      ),
      elevation: 1,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
    bottomSheetTheme: BottomSheetThemeData(
      backgroundColor: AppColors.backgroundDark,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
    ),
  );
}
