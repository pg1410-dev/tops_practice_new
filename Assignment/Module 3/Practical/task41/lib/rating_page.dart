import 'package:flutter/material.dart';
import 'package:task41/rating_widget.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Star Rating Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Give Rate:',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20.0),
            RatingWidget(
              onRatingSelected: (rating) {
                debugPrint('You selected a rating of: $rating');
              },
            ),
          ],
        ),
      ),
    );
  }
}
