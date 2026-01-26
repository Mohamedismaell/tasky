import 'package:flutter/material.dart';
import 'package:to_do_app/core/theme/app_font_family.dart';

class AppTextTheme {
  const AppTextTheme._();

  static const fontFamily = AppFontFamily.poppins;

  static TextTheme from(ColorScheme c) {
    return TextTheme(
      //* Title
      titleLarge: TextStyle(
        fontSize: 22,
        height: 28 / 22,
        fontWeight: FontWeight.w400,
        letterSpacing: 0,
        color: c.onSurface,
      ),

      //* Body
      bodyLarge: TextStyle(
        fontSize: 16,
        height: 24 / 16,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.5,
        color: c.onSurface,
      ),

      bodyMedium: TextStyle(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
        color: c.onSurfaceVariant,
      ),

      //* Label
      labelLarge: TextStyle(
        fontSize: 14,
        height: 20 / 14,
        fontWeight: FontWeight.w500,
        letterSpacing: 0.1,
        color: c.onPrimary,
      ),
    );
  }
}
