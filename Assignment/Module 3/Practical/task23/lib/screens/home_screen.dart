import 'package:flutter/material.dart';
import 'package:task23/widgets/app_drawer.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Welcome Home Screen',
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
