// Task 15:
// Add an Image.asset widget to display an image from your local assets folder. Experiment
// with different BoxFit properties like cover, contain, and fill.

import 'package:flutter/material.dart';

import 'image_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Image Assets App', home: ImageScreen());
  }
}
