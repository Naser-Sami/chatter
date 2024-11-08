import 'package:flutter/material.dart';

import '/config/_config.dart';

class PeopleScreen extends StatelessWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextWidget('People Screen'),
      ),
    );
  }
}
