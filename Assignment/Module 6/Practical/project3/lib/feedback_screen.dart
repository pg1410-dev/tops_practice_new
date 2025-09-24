import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedCategory;
  final List<String> _categories = [
    'General Feedback',
    'Bug Report',
    'Feature Request',
  ];

  final Map<String, bool> _satisfactionOptions = {
    'UI/UX': false,
    'Performance': false,
    'Features': false,
    'Customer Support': false,
  };

  final _commentsController = TextEditingController();

  @override
  void dispose() {
    _commentsController.dispose();
    super.dispose();
  }

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      final List<String> checkedOptions = _satisfactionOptions.entries
          .where((entry) => entry.value)
          .map((entry) => entry.key)
          .toList();

      print('--- Feedback Submitted ---');
      print('Category: $_selectedCategory');
      print('Liked Aspects: ${checkedOptions.join(', ')}');
      print('Comments: ${_commentsController.text}');

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Thank you for your feedback!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text('Submit Feedback'),
          centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    labelText: 'Feedback Category',
                    prefixIcon: Icon(Icons.category_outlined),
                  ),
                  value: _selectedCategory,
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                  validator: (value) =>
                      value == null ? 'Please select a category' : null,
                ),

                SizedBox(height: 24),
                Text(
                  'What did you like about the app?',
                  style: Theme.of(context).textTheme.titleMedium,
                ),

                SizedBox(height: 8),
                ..._satisfactionOptions.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key),
                    value: _satisfactionOptions[key],
                    onChanged: (bool? value) {
                      setState(() {
                        _satisfactionOptions[key] = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.zero,
                  );
                }),

                SizedBox(height: 24),
                TextFormField(
                  controller: _commentsController,
                  decoration: InputDecoration(
                    labelText: 'Additional Comments',
                    hintText: 'Tell us more about your experience...',
                    alignLabelWithHint: true,
                  ),
                  maxLines: 4,
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitFeedback,
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 16),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                    child: Text('Submit'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
