// Task 36:
// Implement a slide transition when navigating between two screens using the
// PageRouteBuilder with custom transition animations.

import 'package:flutter/material.dart';
import 'package:task36/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slide Transition App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FirstScreen(),
    );
  }
}


