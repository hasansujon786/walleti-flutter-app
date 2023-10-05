import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/theme_dropdown.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingPage'),
      ),
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: ThemeModeDropdown(),
          ),
        ],
      ),
    );
  }
}
