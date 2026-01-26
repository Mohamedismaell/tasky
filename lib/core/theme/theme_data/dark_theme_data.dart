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
  );
}
