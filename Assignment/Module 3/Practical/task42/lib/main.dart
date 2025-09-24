// Task 42:
// Build a custom ProgressBar widget that takes a percentage as input and displays a progress
// bar accordingly.

import 'package:flutter/material.dart';
import 'package:task42/progess_bar_demo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Progress Bar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProgressBarDemo(),
    );
  }
}


