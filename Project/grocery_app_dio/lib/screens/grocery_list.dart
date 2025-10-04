import 'package:flutter/material.dart';
import 'package:grocery_app_dio/data/dummy_items.dart';
import 'package:grocery_app_dio/screens/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {


  void _addItem() {
    Navigator.of(context).push(
        MaterialPageRoute(
          builder: (ctx) => NewItem()

        ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [
          IconButton(
              onPressed: _addItem,
              icon: Icon(Icons.add),
          ),
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.person))
        ],

      ),
      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (ctx, index) =>
            ListTile(
              title: Text(groceryItems[index].name),
              leading: Container(
                width: 24,
                height: 24,
                color: groceryItems[index].category.color,
              ),
              trailing: Text(groceryItems[index].quantity.toString(),
              ),
            ),
      ),
    );
  }
}
