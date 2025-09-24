// Task 14:
// Develop a photo gallery app using GridView to display multiple images from URLs. Include
// a loading indicator while images are loading.


import 'package:flutter/material.dart';
import 'package:task14/photo_gallery_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Photo Gallery',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PhotoGalleryScreen(),
    );
  }
}

