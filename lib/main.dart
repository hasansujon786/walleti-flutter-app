import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await initializeDependencies();
  runApp(const ProviderScope(child: App()));
}
