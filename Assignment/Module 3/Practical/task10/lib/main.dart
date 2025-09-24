// Task 10:
// Create a shopping cart app with a list of items and an "Add to Cart" button for each. When
// the button is pressed, update a counter in the AppBar showing the total items in the cart.

import 'package:flutter/material.dart';
import 'package:task10/shopping_cart.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App!',
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: ShoppingCart(),
    );
  }
}
