import 'package:flutter/material.dart';

abstract class SettingsRepository {
  Future<ThemeMode> updateThemeMode(ThemeMode theme);
}
