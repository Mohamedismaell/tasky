import 'package:flutter/material.dart';
import 'app_colors.dart';

final ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,

  primary: AppColors.primaryLight,
  onPrimary: AppColors.textPrimaryLight,

  surface: AppColors.surfaceLight,
  onSurface: AppColors.textPrimaryLight,
  onSurfaceVariant: AppColors.textSecondaryLight,

  outline: AppColors.outlineLight,

  // Required but not emphasized in M3
  secondary: AppColors.primaryLight,
  onSecondary: AppColors.textPrimaryLight,
  error: const Color(0xFFB00020),
  onError: Colors.white,
);

final ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,

  primary: AppColors.primaryDark,
  onPrimary: AppColors.textPrimaryDark,

  surface: AppColors.surfaceDark,
  onSurface: AppColors.textPrimaryDark,
  onSurfaceVariant: AppColors.textSecondaryDark,

  outline: AppColors.outlineDark,

  secondary: AppColors.primaryDark,
  onSecondary: AppColors.textPrimaryDark,
  error: const Color(0xFFCF6679),
  onError: Colors.black,
);
