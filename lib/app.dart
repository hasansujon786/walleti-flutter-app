import 'package:flutter/material.dart';

import 'config/routes/app_routes.dart';
import 'config/theme/app_theme.dart';
import 'features/template/presentation/pages/template_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      restorationScopeId: 'app',
      theme: theme(),
      home: const TemplatePage(),
      onGenerateRoute: AppRoutes.onGenerateRoutes,
    );
  }
}
