
import 'package:flutter/material.dart';

class PhotoScreen extends StatelessWidget {
  const PhotoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Hero(
          tag: 'imageHero',
          child: Image.network(
            'https://picsum.photos/id/237/250/250',
          ),
        ),
      ),
    );
  }
}