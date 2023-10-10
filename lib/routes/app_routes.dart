import 'package:flutter/material.dart';

import '../features/settings/presentation/screens/settings_screen.dart';
import '../features/home/presentation/screens/home_screen.dart';
import 'routes.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return _materialRoute(const HomeScreen());
      case Routes.settings:
        return _materialRoute(const SettingsScreen());

      default:
        return _materialRoute(const HomeScreen());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
