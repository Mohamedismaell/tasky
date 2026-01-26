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
  );
}
