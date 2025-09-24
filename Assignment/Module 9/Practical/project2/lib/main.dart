// 2) Implement a Hero animation that transitions an image smoothly between two screens.

import 'package:flutter/material.dart';
import 'package:project2/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animation',
      home: HomeScreen(),
    );
  }
}



