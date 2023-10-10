import 'package:flutter/material.dart';

import '../../../../routes/routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wellcome Page'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, Routes.settings),
            icon: const Icon(Icons.settings),
          )
        ],
      ),
      body: const Center(
        child: Text('Wellcome Page'),
      ),
    );
  }
}
