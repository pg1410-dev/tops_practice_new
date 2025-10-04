import 'package:flutter/material.dart';
import 'package:grocery_app_offline/data/dummy_items.dart';
import 'package:grocery_app_offline/screens/new_item.dart';
import 'package:grocery_app_offline/screens/user_login.dart';
import 'package:shared_preferences/shared_preferences.dart';


class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {

  var userName = '';

  @override
  void initState() {
    _loadPreference();
    super.initState();
  }

  void _loadPreference() async {
                                                   // username database mathi lavva
    final sharedPref = SharedPreferencesAsync();
    var user = await sharedPref.getString("username");
    setState(() {
      userName = user ?? "";
    });
  }


  void _addItem() async {

    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(
          builder: (ctx) => NewItem()
      ),
    );

    if (newItem == null) {
      return;
    }

    setState(() {
      groceryItems.add(newItem);
    });
  }

  void _removeItem(item) {
    setState(() {
      groceryItems.remove(item);
    });
  }

  void _logout() {
    final sharedPref = SharedPreferencesAsync();
    sharedPref.clear();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (ctx) => UserLogin()));
  }




  @override
  Widget build(BuildContext context) {

    Widget content = Center(child: Text("No items added yet!"),);

    if(groceryItems.isNotEmpty) {
      content = ListView.builder(
        itemCount: groceryItems.length,
        itemBuilder: (ctx, index) =>
            Dismissible(
              onDismissed: (direction) =>{
                _removeItem(groceryItems[index])
              },
              key: ValueKey(groceryItems[index].id),
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
