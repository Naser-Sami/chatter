import 'package:flutter/material.dart';

import '/config/_config.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextWidget('Settings Screen'),
      ),
    );
  }
}
