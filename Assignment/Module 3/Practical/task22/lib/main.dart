// Task 22:
// Develop a three-screen app with a home, details, and settings screen. Use
// Navigator.pushNamed for navigation, and pass data between screens.

import 'package:flutter/material.dart';
import 'package:task22/screens/details_screen.dart';
import 'package:task22/screens/home_screen.dart';
import 'package:task22/screens/setting_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      title: 'Simple Three Screen App',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/details': (context) => DetailsScreen(),
        '/settings': (context) => SettingScreen(),
      },
    );
  }
}
