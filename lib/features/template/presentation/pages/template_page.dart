import 'package:flutter/material.dart';

class TemplatePage extends StatelessWidget {
  const TemplatePage({super.key});

  static const routeName = '/template-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TemplatePage'),
      ),
      body: const Center(
        child: Text('Hello World'),
      ),
    );
  }
}
