import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [

                Center(
                  child: TextField(
                    decoration: InputDecoration(label: Text("Enter Email"),labelStyle: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
                  ),
                ),
                Center(
                  child: TextField(
                    decoration: InputDecoration(
                      label: Text("Enter Password"),labelStyle: TextStyle(
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )
                    ),
                  ),
                ),
                SizedBox(
                  height: 80,
                  child: Center(
                      child: ElevatedButton(onPressed: () {}, child: Text("Login"))
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
