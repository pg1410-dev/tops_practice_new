

import 'package:flutter/material.dart';

class RatingWidget extends StatefulWidget {
  final int maxRating;
  final Function(int) onRatingSelected;

  const RatingWidget({
    super.key,
    this.maxRating = 5,
    required this.onRatingSelected,
  });

  @override
  State<RatingWidget> createState() => _RatingWidgetState();
}

class _RatingWidgetState extends State<RatingWidget> {
  int _currentRating = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.maxRating, (index) {
        final rating = index + 1;

        return IconButton(
          icon: Icon(
            rating <= _currentRating ? Icons.star : Icons.star_border,
            color: rating <= _currentRating ? Colors.amber : Colors.grey,
            size: 48.0,
          ),
          onPressed: () {
            setState(() {
              _currentRating = rating;
            });
            widget.onRatingSelected(rating);
          },
        );
      }),
    );
  }
}
