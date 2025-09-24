// Task 30:
// Build a basic profile page where the profile image is centered on the screen using
// Positioned inside a Stack, and other details (like name and bio) are displayed below.


import 'package:flutter/material.dart';
import 'package:task30/profile_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ProfileScreen(),
    );
  }
}
