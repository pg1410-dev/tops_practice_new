import 'package:grocery_app/models/grocery_item.dart';
import 'package:grocery_app/models/category.dart';
import 'package:grocery_app/data/categories.dart';

final groceryItems = [
  GroceryItem(
      id: 'a',
    name: 'Milk',
    quantity: 1,
    category: categories[Categories.dairy]!
  ),
  GroceryItem(
      id: 'b',
      name: 'Bananas',
      quantity: 5,
      category: categories[Categories.fruit]!
  ),
  GroceryItem(
      id: 'c',
      name: 'Potatoes',
      quantity: 2,
      category: categories[Categories.vegetables]!
  ),
  GroceryItem(
      id: 'd',
      name: 'Modak',
      quantity: 3,
      category: categories[Categories.sweets]!
  ),
  GroceryItem(
      id: 'e',
      name: 'Green Chilli',
      quantity: 10,
      category: categories[Categories.spices]!
  ),
];
