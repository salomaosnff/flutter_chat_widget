import 'package:flutter/material.dart';
import './views/chat.dart';

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (ctx) => ChatView()
      },
    );
  }
}
