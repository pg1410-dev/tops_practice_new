// Task 27:
// Implement a custom-styled list using ListTile widgets with leading icons, titles, and trailing
// icons (like a delete button).

import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CustomStyledList(),
    );
  }
}


class CustomStyledList extends StatefulWidget {
  const CustomStyledList({super.key});

  @override
  State<CustomStyledList> createState() => _CustomStyledListState();
}

class _CustomStyledListState extends State<CustomStyledList> {


  final List<String> _items = [
    'Earth',
    'India',
    'Asia',
    'Country',
    'Map',
    'Location',

  ];

  void _deleteItem(int index) {
    setState(() {
      _items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Styled List'),
      ),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListTile(
                  // Leading icon
                  leading: const Icon(
                    Icons.favorite_outline_sharp,
                    color: Colors.red,
                    size: 30,
                  ),
            
                  title: Text(
                    _items[index],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
            
            
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.grey,
                    ),
                    onPressed: () => _deleteItem(index),
                  ),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Tapped on ${_items[index]}'),
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