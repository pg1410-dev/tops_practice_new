import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:grocery_app/data/categories.dart';
import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/screens/new_item.dart';
import 'package:http/http.dart' as http;

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  var groceryItems = [];
  var _isLoading = true;
  var _error = "";

  @override
  void initState() {
    _loadItems();
    super.initState();
  }

  void _addItem() async {
    final groceryItem = await Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => NewItem()));

    if (groceryItem == null) {
      return;
    }
    setState(() {
      groceryItems.add(groceryItem);
    });
    // _loadItems();
  }

  void _loadItems() async {
    var url = Uri.https(
      'grocery-app-de7fa-default-rtdb.firebaseio.com/',
      'shopping-list.json',
    );
    try {
      final response = await http.get(url);

      if (response.statusCode >= 400) {
        setState(() {
          _error = "Failed to fetch. Please try again later.";
        });
        return;
      }
      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });
        return;
      }

      Map<String, dynamic> listData = json.decode(response.body);
      List<GroceryItem> loadedItems = [];
      for (final item in listData.entries) {
        final category = categories.entries
            .firstWhere(
              (catItem) => catItem.value.title == item.value['category'],
        )
            .value;
        loadedItems.add(
          GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category,
          ),
        );
      }
      setState(() {
        groceryItems = loadedItems;
        _isLoading = false;
      });
    } catch (err) {
      setState(() {
        _error = "Failed to fetch. Please try again later.";
      });
    }
  }

  void _removeItem(item) async {
    final index = groceryItems.indexOf(item);
    setState(() {
      groceryItems.remove(item);
    });

    var url = Uri.https(
      'grocery-app-de7fa-default-rtdb.firebaseio.com/',
      'shopping-list/${item.id}.json',
    );
    final response = await http.delete(url);
    if (response.statusCode >= 400) {
      setState(() {
        groceryItems.insert(index, item);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('No data found!')));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text("No items added yet."));

    if (_isLoading) {
      content = const Center(child: CircularProgressIndicator());
    }

    if (groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          onDismissed: (direction) => {_removeItem(groceryItems[index])},
          key: ValueKey(groceryItems[index].id),
          child: ListTile(
            title: Text(groceryItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: groceryItems[index].category.color,
            ),
            trailing: Text(groceryItems[index].quantity.toString()),
          ),
        ),
      );
    }

    if (_error != "") {
      content = Center(child: Text(_error));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Groceries"),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body: content,
    );
  }
}