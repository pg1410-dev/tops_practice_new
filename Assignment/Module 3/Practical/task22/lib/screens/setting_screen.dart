import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Settings Screen'),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Back to Home Page'),
            ),
          ],
        ),
      ),
    );
  }
}
