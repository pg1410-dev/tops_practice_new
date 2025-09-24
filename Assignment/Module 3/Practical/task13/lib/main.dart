// Task 13:
// Create an app with an Image widget displaying a picture from the network. Add a button
// below the image to change the image source when pressed.

import 'package:flutter/material.dart';

import 'image_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Image Network App', home: ImageScreen());
  }
}
