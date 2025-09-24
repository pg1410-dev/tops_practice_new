import 'package:flutter/material.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  final imageUrl = 'https://cdn.prod.website-files.com/654366841809b5be271c8358/659efd7c0732620f1ac6a1d6_why_flutter_is_the_future_of_app_development%20(1).webp';
  final imageUrl1 = 'https://tecoreng.com/blog/wp-content/uploads/2022/10/flutter-app-development.png';
  final imageUrl2 = 'https://beecrowd.com/wp-content/uploads/2024/04/2022-06-23-Flutter.jpg';
  final imageUrl3 = 'https://blog.codemagic.io/uploads/covers/codemagic-blog-header-upgrading-to-Material-3.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GridView Widget with Network Images!')),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 15,
          mainAxisSpacing: 15,
          childAspectRatio: 3 / 2,
        ),
        children: [
          Image.network(imageUrl),
          Image.network(imageUrl1),
          Image.network(imageUrl2),
          Image.network(imageUrl3),
        ],
      ),
    );
  }
}
