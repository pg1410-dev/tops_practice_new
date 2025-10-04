import 'package:flutter/material.dart';
import 'package:grocery_app_offline_db/data/categories.dart';
import 'package:grocery_app_offline_db/db/helper.dart';
import 'package:grocery_app_offline_db/models/category.dart';
import 'package:grocery_app_offline_db/models/grocery_item.dart';
import 'package:grocery_app_offline_db/screens/new_item.dart';
import 'package:grocery_app_offline_db/screens/user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  var userName = '';

  List<GroceryItem> groceryItems = [];  // dummy-items.dart file nu aa avi gayu

  @override
  void initState() {
    _loadPreference();
    super.initState();
  }

  Category getCategoryFromTitle(title) {
    return categories.entries.where(
        (element) => element.value.title == title,
    ).first.value;
  }

  Future<List<GroceryItem>> getGroceryItems() async {
    final db = await initializeDatabase();
    final List<Map<String, dynamic>> maps = await db.query(tblGroceryItem);
    return List.generate(maps.length, (index) {
      return GroceryItem(
      id: maps[index][colId],
      name: maps[index][colName],
    quantity: maps[index][colQuantity],
    category: getCategoryFromTitle(maps[index][colCategory]),
    );
    });
  }

  void _loadPreference() async {
                                                   // username db mathi lavva
    final sharedPref = SharedPreferencesAsync();
    var user = await sharedPref.getString("username");
    setState(() {
      userName = user ?? "";
    });

    final groceryData = await getGroceryItems();
    setState(() {
      groceryItems.addAll(groceryData);
    });
  }




  void _addItem() async {

    final groceryItem = await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => NewItem()
      ),
    );

    if (groceryItem == null) {
      return;
    }

    setState(() {
      groceryItems.add(groceryItem);
    });
  }

  void _removeItem(item) async {
    final db = await initializeDatabase();
    int count = await db.delete(tblGroceryItem, where: "$colId = ?", whereArgs: [item.id]);
    if( count > 0 ) {
      setState(() {
        groceryItems.remove(item);
      });
    }

  }


  void _editGroceryItem(index) async {
    final groceryItem = await Navigator.of(context)
        .push(MaterialPageRoute(
        builder: (ctx) => NewItem(groceryItem: groceryItems[index]),
    ),
    );
    if(groceryItem == null) {
      return;
    }
    groceryItems.removeAt(index);
    setState(() {
      groceryItems.insert(index, groceryItem);
    });

  }



  void _logout() {
    final sharedPref = SharedPreferencesAsync();
    sharedPref.clear();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (ctx) => UserLogin()
        ),
    );
  }




  @override
  Widget build(BuildContext context) {

    Widget content = Center(child: Text("No items added yet!"),);

    if(groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) =>
            Dismissible(
              onDismissed: (direction) => {
                _removeItem(groceryItems[index])
              },
              key: ValueKey(groceryItems[index].id),
              child: InkWell(
                onTap: () => _editGroceryItem(index),
                child: ListTile(
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
            ),
      );
    }



    return Scaffold(
      appBar: AppBar(
        title: Text("${userName == '' ? 'Your' : '$userName\'s'} Groceries"),
        actions: [
          IconButton(
              onPressed: _addItem,
              icon: Icon(Icons.add),
          ),
          IconButton(onPressed: _logout, icon: Icon(Icons.logout))
        ],

      ),
      body: content,
    );
  }
}
