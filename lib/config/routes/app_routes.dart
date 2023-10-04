import 'package:flutter/material.dart';

import '../../features/settings/presentation/views.dart';
import '../../features/wellcome/presentation/pages/wellcome_page.dart';
import 'routes.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.wellcome:
        return _materialRoute(const WellcomePage());
      case Routes.settings:
        return _materialRoute(const SettingsPage());

      default:
        return _materialRoute(const WellcomePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
