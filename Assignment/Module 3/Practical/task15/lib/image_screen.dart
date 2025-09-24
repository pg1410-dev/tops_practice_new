import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(title: Text("Image Assets App!")),
        body: Column(
          children: [
            Text("BoxFit!"),
            Container(
              width: 200,
              height: 150,
              color: Colors.grey,
              child: Image.asset(
                'assets/images/flutter.png',
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
