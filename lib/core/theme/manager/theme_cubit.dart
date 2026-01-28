import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(themeMode: ThemeMode.system));

  static const _themeKey = 'themeMode';

  void toggleTheme() {
    final isDark = state.themeMode == ThemeMode.dark;

    emit(ThemeState(themeMode: isDark ? ThemeMode.light : ThemeMode.dark));
  }

  @override
  ThemeState fromJson(Map<String, dynamic> json) {
    final mode = json[_themeKey] as String?;

    return ThemeState(
      themeMode: switch (mode) {
        'light' => ThemeMode.light,
        'dark' => ThemeMode.dark,
        _ => ThemeMode.system,
      },
    );
  }

  @override
  Map<String, dynamic> toJson(ThemeState state) {
    return {
      _themeKey: switch (state.themeMode) {
        ThemeMode.light => 'light',
        ThemeMode.dark => 'dark',
        ThemeMode.system => 'system',
      },
    };
  }
}
