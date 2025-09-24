import 'package:flutter/material.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  List<String> imageUrls = [
    "https://www.daily.co/blog/content/images/size/w2000/2023/07/Flutter-feature.png",
    "https://images.ctfassets.net/23aumh6u8s0i/4TsG2mTRrLFhlQ9G1m19sC/4c9f98d56165a0bdd71cbe7b9c2e2484/flutter",
  ];

  int currentImageIndex = 0;

  void changeImage() {
    setState(() {
      currentImageIndex = (currentImageIndex + 1) % imageUrls.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: AppBar(title: Text("Image Screen")),
        body: Center(
          child: Column(
            children: [
              Image.network(
                imageUrls[currentImageIndex],
                width: 1000,
                height: 500,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: changeImage,
                child: Text("Image Changes"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
