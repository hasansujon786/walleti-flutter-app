import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/theme/app_theme_provider.dart';

class ThemeModeDropdown extends ConsumerWidget {
  const ThemeModeDropdown({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final appTheme = ref.watch(appThemeProvider);

    return DropdownButton<ThemeMode>(
      // Read the selected themeMode from the controller
      value: appTheme,
      // Call the updateThemeMode method any time the user selects a theme.
      onChanged: ref.read(appThemeProvider.notifier).updateThemeMode,
      items: const [
        DropdownMenuItem(value: ThemeMode.system, child: Text('System Theme')),
        DropdownMenuItem(value: ThemeMode.light, child: Text('Light Theme')),
        DropdownMenuItem(value: ThemeMode.dark, child: Text('Dark Theme'))
      ],
    );
  }
}
