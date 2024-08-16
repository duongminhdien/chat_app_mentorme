import 'package:chat_app_mentorme/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_mentorme/messagelist.dart';
import 'package:chat_app_mentorme/chatscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SplashScreen(),
      //home: MessagesPage(),
      //home: ChatScreen(),
    );
  }
}
