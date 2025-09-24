

import 'package:flutter/material.dart';
import 'package:project2/models/cart_model.dart';
import 'package:project2/models/item.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});

  final List<Item> products = [
    Item(name: 'Laptop', price: 999.99),
    Item(name: 'Mouse', price: 49.99),
    Item(name: 'Keyboard', price: 74.99),
    Item(name: 'Monitor', price: 249.99),
    Item(name: 'Webcam', price: 89.99),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Center(child: Text('Products', style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
            color: Colors.pink,
            fontStyle: FontStyle.italic
        ),)),
        actions: [
          IconButton(
            color: Colors.amberAccent,
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            color: Colors.black38,
            borderOnForeground: true,
            shadowColor: Colors.green,
            child: ListTile(
              title: Text(product.name),
              subtitle: Text('\$${product.price.toStringAsFixed(2)}', style: TextStyle(
                  color: Colors.deepPurple,
                  fontWeight: FontWeight.bold
              ),),
              trailing: ElevatedButton(
                child: Text('Add', style: TextStyle(
                  fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontStyle: FontStyle.italic
                ),),
                onPressed: () {
                  Provider.of<CartModel>(context, listen: false).add(product);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('${product.name} Added to cart!'),
                      duration: Duration(seconds: 1),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}