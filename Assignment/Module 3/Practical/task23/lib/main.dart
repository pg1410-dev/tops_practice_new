// Task 23:
// Create a navigation drawer that allows switching between three different screens: Home,
// Profile, and Settings.

import 'package:flutter/material.dart';
import 'package:task23/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.grey
      ),
      home: HomeScreen(),
    );
  }
}

