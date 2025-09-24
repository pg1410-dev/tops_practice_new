// Task 16:
// Build an image carousel that displays a different image every 3 seconds using PageView and
// an auto-slide feature.


import 'package:flutter/material.dart';
import 'package:task16/image_carousel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Image Carousel',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ImageCarousel(),
    );
  }
}


