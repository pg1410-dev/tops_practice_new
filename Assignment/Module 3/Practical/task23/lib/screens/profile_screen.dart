import 'package:flutter/material.dart';
import 'package:task23/widgets/app_drawer.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Screen'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Welcome Profile Screen',
          style:  TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.blue
          ),
        ),
      ),
    );
  }
}
