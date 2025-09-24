// Task 41:
// Create a custom RatingWidget that displays a series of stars and allows the user to select a
// rating from 1 to 5.

import 'package:flutter/material.dart';
import 'package:task41/rating_page.dart';

// This is the main entry point for the Flutter application.
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Star Rating App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RatingPage(),
    );
  }
}


