// Task 44:
// Develop a custom AvatarBadge widget that shows a user’s avatar with an optional
// online/offline status indicator.

import 'package:flutter/material.dart';
import 'avatar_badge.dart';

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
          title: Center(child: Text('Avatar Badge App')),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AvatarBadge(
                avatarUrl: 'https://i.pravatar.cc/150?img=3',
                isOnline: true,
              ),
              SizedBox(height: 20),
              AvatarBadge(
                avatarUrl: 'https://i.pravatar.cc/150?img=4',
                isOnline: false,
                avatarSize: 80,
                badgeSize: 16,
                badgePosition: Offset(60, 60),
              ),
            ],
          ),
        ),
      ),
    );
  }
}