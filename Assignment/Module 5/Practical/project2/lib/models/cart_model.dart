


import 'package:flutter/material.dart';
import 'package:project2/models/item.dart';


class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  double get totalPrice => _items.fold(0, (total, current) => total + current.price);



  void add(Item item) {
    _items.add(item);
    notifyListeners();
  }
}