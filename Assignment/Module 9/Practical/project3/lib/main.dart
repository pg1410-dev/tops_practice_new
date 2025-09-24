// 3) Create a loading animation for data fetching in an app.

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:project3/fetch_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loading Animation',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FetchScreen(),
    );
  }
}

