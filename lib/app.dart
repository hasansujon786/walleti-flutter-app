import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'routes/app_routes.dart';
import 'shared/theme/app_theme.dart';
import 'shared/theme/app_theme_provider.dart';

class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final appThemeMode = ref.watch(appThemeProvider);
    return MaterialApp(
      title: 'Material App',
      themeMode: appThemeMode,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      restorationScopeId: 'app',
      onGenerateRoute: AppRoutes.onGenerateRoutes,
      debugShowCheckedModeBanner: false,
    );
  }
}
