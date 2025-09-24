// Task 24:
// Design a bottom navigation bar with three tabs: News, Messages, and Profile. Change the
// displayed content based on the selected tab.

import 'package:flutter/material.dart';
import 'package:task24/bottom_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: BottomScreen(),
    );
  }
}
