import 'package:flutter/material.dart';
import 'package:task23/widgets/app_drawer.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Screen'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Welcome Setting Screen',
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
