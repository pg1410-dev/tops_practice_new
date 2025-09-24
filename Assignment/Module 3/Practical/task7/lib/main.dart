// Task 7:
// Build a grid of images using the GridView widget. Load images from the network, and
// display four images per row.

import 'package:flutter/material.dart';
import 'package:task7/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen(),
    );
  }

}