import 'package:flutter/material.dart';
import 'package:grocery_app_dio/data/categories.dart';
import 'package:grocery_app_dio/models/category.dart';
import 'package:grocery_app_dio/models/grocery_item.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {

  final _formKey = GlobalKey<FormState>(); // aa rite key banavi pade jeno use niche karyo che

  var _enteredName = '';
  var _enteredQuantity = 1;
  var _selectedCategory = categories[Categories.vegetables];


  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      Navigator.of(context).pop(
        GroceryItem(
          id: DateTime.now().toString(),
          name: _enteredName,
          quantity: _enteredQuantity,
          category: _selectedCategory!,
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add a New Item')),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: _formKey,         // key aa rite apiye to j value execute thay. "key FARJIYAT APVI PADE.
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: InputDecoration(
                  label: Text('Name'),
                ),
                validator: (value) {
                  if (
                  value == null ||
                  value.isEmpty ||
                  value.trim().length <= 1 ||
                  value.trim().length > 50) {
                    return 'Written Must be 1 to 50 characters.';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        label: Text('Quantity'),
                      ),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (
                        value == null ||
                        value.isEmpty ||
                        int.tryParse(value) == null ||
                        int.parse(value) <=0 ) {        // <- ahiya int.tryParse(value)! <= 0 rite pn karay.
                          return 'Must be Valid, positive number.';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        _enteredQuantity = int.tryParse(value!) ?? 1;
                      },
                    ),
                  ),
                  SizedBox(width: 8,),
                  Expanded(
                    child: DropdownButtonFormField(
                      value: _selectedCategory,
                      items: [
                        for ( final category in categories.entries)
                          DropdownMenuItem(
                            value: category.value,
                              child: Row(
                                children: [
                                  Container(
                                    width: 25,
                                    height: 25,
                                    color: category.value.color,
                                  ),
                                  SizedBox(
                                    width: 8,
                                  ),
                                  Text(category.value.title),
                                ],
                              ),
                          ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _selectedCategory = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      _formKey.currentState!.reset();
                    },
                    child: Text('Reset'),
                  ),
                  ElevatedButton(
                    onPressed: _saveItem,
                    child: Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
