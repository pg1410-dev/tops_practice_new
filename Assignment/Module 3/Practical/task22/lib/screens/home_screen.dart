import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final String message = 'Welcome to Details Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Center(
          child: Text('Home Screen Page!',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context,
                      '/details',
                    arguments: message,
                  );
                },
                child: Text('Press to Go Details Screen')),
            SizedBox(height: 25,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/settings',
                  );
                },
                child: Text('Press to Go Settings Screen')
            ),
          ],
        ),
      ),
    );
  }
}
