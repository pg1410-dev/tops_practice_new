// Task 19:
// Design a search bar using TextField and display suggestions below as the user types. Filter
// suggestions based on input.

import 'package:flutter/material.dart';
import 'package:task19/search_bar_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchBarScreen(),
    );
  }
}