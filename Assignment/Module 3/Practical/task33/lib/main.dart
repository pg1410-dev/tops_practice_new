// Task 33:
// Add a fade-in animation to an image using FadeInImage when it’s loaded from a network
// source.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fade In Image'),
        ),
        body: Center(
          child: SizedBox(
            width: 300,
            height: 300,
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/placeholder.jpg',
              image: 'https://picsum.photos/500',
              fit: BoxFit.cover,
              fadeInDuration: const Duration(milliseconds: 500),
              fadeInCurve: Curves.easeIn,
            ),
          ),
        ),
      ),
    );
  }
}