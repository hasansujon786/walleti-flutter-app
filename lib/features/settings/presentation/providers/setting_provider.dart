import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:walleti/features/settings/domain/entities/settings.dart';

final settingsProvider = StateNotifierProvider<SettingProvider, Settings>((ref) {
  return SettingProvider();
});

class SettingProvider extends StateNotifier<Settings> {
  SettingProvider() : super(const Settings(currentTheme: ThemeMode.system));

  void updateThemeMode(ThemeMode? newThemeMode) {
    if (newThemeMode == null) return;

    if (newThemeMode == state.currentTheme) return;

    state = Settings(currentTheme: newThemeMode);
  }
}
