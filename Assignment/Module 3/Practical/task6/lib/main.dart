// Task 6:
// Design a profile card with Column and Row widgets. Include an avatar (using CircleAvatar),
// a name, and a short bio text.

import 'package:flutter/material.dart';
import 'package:task6/profile_card.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       home:  ProfileCard(),
    );
  }
}
