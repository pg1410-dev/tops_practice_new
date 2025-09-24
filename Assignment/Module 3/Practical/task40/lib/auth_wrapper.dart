import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task40/auth_provider.dart';
import 'package:task40/home_page.dart';
import 'package:task40/login_page.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return authProvider.isLoggedIn ? HomePage() : LoginPage();
  }
}