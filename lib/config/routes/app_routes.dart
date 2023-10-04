import 'package:flutter/material.dart';
import 'package:walleti/features/template/presentation/pages/template_page.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case TemplatePage.routeName:
        return _materialRoute(const TemplatePage());

      default:
        return _materialRoute(const TemplatePage());
    }
  }

  static Route<dynamic> _materialRoute(Widget view) {
    return MaterialPageRoute(builder: (_) => view);
  }
}
