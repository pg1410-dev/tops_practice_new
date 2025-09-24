// Task 40:
// Implement a simple authentication flow with login and logout, where user status (logged in or
// out) is managed globally using Provider.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task40/auth_wrapper.dart';

import 'auth_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Provider Auth Flow',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthWrapper(),
    );
  }
}