import 'package:flutter/material.dart';

class FeedbackFormPage extends StatefulWidget {
  const FeedbackFormPage({super.key});

  @override
  State<FeedbackFormPage> createState() => _FeedbackFormPageState();
}

class _FeedbackFormPageState extends State<FeedbackFormPage> {
  final _nameController = TextEditingController();
  final _commentsController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _selectedCategory;
  final List<String> _categories = ['Bug', 'Feature', 'UI Update', 'Other'];

  void _submitForm() {
    if (_formKey.currentState!.validate() && _selectedCategory != null) {
      String name = _nameController.text;
      String comment = _commentsController.text;

      print('name: $name');
      print('comment: $comment');
      print('Category: $_selectedCategory');

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Feedback Submitted!')));

      _nameController.clear();
      _commentsController.clear();
      setState(() {
        _selectedCategory = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text('First Complete All Required Field'))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Enter Name',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter First Name Than You Give Feedback'
                    : null,
              ),
              SizedBox(height: 15),
              InputDecorator(
                decoration: InputDecoration(
                  labelText: 'Feedback Category',
                  border: OutlineInputBorder(),
                ),
                isEmpty: _selectedCategory == null,
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedCategory,
                    isExpanded: true,
                    // hint: Text('Select Category'),
                    items: _categories.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedCategory = value!;
                      });
                    },
                  ),
                ),
              ),
              SizedBox(height: 15),
              TextFormField(
                controller: _commentsController,
                maxLines: 5,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  labelText: 'Give a Comments',
                  border: OutlineInputBorder(),
                ),
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter First Comment'
                    : null,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitForm,
                child: Text('Submit Feedback'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
