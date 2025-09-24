import 'package:flutter/material.dart';


class StackWidget extends StatefulWidget {
  const StackWidget({super.key});

  @override
  State<StackWidget> createState() => _StackWidgetState();
}

class _StackWidgetState extends State<StackWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              "https://picsum.photos/400/250",
              width: 400,
              height: 250,
              fit: BoxFit.cover,
            ),

            Container(
              width: 400,
              height: 250,
              color: Colors.black.withOpacity(0.4),
            ),
            const Text(
              "Hello Flutter!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
