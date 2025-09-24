import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  ListScreen({super.key});

  final List<String> name = ["India", "U.S.A", "Russia"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tap List!")),
      body: ListView.builder(
        itemCount: name.length,
        itemBuilder: (ctx, index) {
          return ListTile(
            title: Text(name[index]),
            onTap: () {
              print("Name Tapped!");
            },
          );
        },
      ),
    );
  }
}
