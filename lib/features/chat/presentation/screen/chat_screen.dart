import 'package:flutter/material.dart';

import '/config/_config.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: TextWidget('Chat Screen'),
      ),
    );
  }
}
