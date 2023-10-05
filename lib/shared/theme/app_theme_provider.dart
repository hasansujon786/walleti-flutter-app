import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/local/storage_service.dart';
import '../domain/providers/storage_service_provider.dart';
import '../global.dart';

final appThemeProvider = StateNotifierProvider<AppThemeProvider, ThemeMode>((ref) {
  final storage = ref.watch(storageServiceProvider);
  return AppThemeProvider(storage);
});

class AppThemeProvider extends StateNotifier<ThemeMode> {
  final StorageService stroageService;

  AppThemeProvider(this.stroageService) : super(ThemeMode.system) {
    getCurrentTheme();
  }

  void updateThemeMode(ThemeMode? newThemeMode) {
    if (newThemeMode == null || newThemeMode == state) return;

    state = newThemeMode;
    stroageService.set(APP_THEME_STORAGE_KEY, state.name);
  }

  void getCurrentTheme() async {
    final themeName = await stroageService.get(APP_THEME_STORAGE_KEY);
    final value = ThemeMode.values.byName('${themeName ?? 'system'}');
    state = value;
  }
}
