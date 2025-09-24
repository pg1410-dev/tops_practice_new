import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartProvider with ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  double get totalPrice =>
      _items.fold(0, (sum, item) => sum + item.price);

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(Item item) {
    _items.remove(item);
    notifyListeners();
  }
}

class Item {
  final String name;
  final double price;

  Item({required this.name, required this.price});
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping Cart with Provider',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: ShopScreen(),
    );
  }
}


class ShopScreen extends StatelessWidget {
   ShopScreen({super.key});

  final List<Item> products =  [
    Item(name: "Samsung Galaxy25", price: 1500),
    Item(name: "iPhone15", price: 1200),
    Item(name: "Goggle Pixel 10Pro", price: 1260),
    Item(name: "Samsung Z Fold 7", price: 1435),
  ];

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Shopping Cart", style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.pink.shade200,
          backgroundColor: Colors.blue,
        ),)),
        actions: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Consumer<CartProvider>(
              builder: (context, cart, child) => Center(
                child: Text(
                  "Total: \$${cart.totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.amberAccent
                    ),
                ),
              ),
                ),
              ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return Card(
            child: ListTile(
              title: Text(item.name),
              subtitle: Text("\$${item.price}",style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.purple
              ),),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.add, color: Colors.green),
                    onPressed: () => cart.addItem(item),
                  ),
                  IconButton(
                    icon: Icon(Icons.remove, color: Colors.red),
                    onPressed: () => cart.removeItem(item),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
