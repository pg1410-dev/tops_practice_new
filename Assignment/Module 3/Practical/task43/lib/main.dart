// Task 43:
// Create a custom ProfileCard widget that takes name, image, and bio as properties and
// displays them in a nicely styled card.

import 'package:flutter/material.dart';
import 'package:task43/profile_card.dart';

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
          title: Text('My Profile Card'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: ProfileCard(
          name: 'Mr. Ghoghari',
          imageUrl: 'https://i.pravatar.cc/300?img=4',
          bio: 'Flutter developer and UI/UX enthusiast. Passionate about creating beautiful and functional mobile applications.',
        ),
      ),
    );
  }
}
