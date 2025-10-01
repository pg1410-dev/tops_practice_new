import 'package:flutter/material.dart';
import 'package:assesment2/models/note_model.dart';
import 'package:assesment2/db/database_helper.dart';

class AddEditNoteScreen extends StatefulWidget {


  final Note? note;              // <--------- if Nullable for adding a new note

  const AddEditNoteScreen({super.key, this.note});

  @override
  State<AddEditNoteScreen> createState() => _AddEditNoteScreenState();
}

class _AddEditNoteScreenState extends State<AddEditNoteScreen> {

  final _formKey = GlobalKey<FormState>();

  late TextEditingController _titleController;
  late TextEditingController _descriptionController;

  bool get _isEditing => widget.note != null;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.note?.title ?? '');
    _descriptionController = TextEditingController(text: widget.note?.description ?? '');
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _saveOrUpdateNote() async {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text;
      final description = _descriptionController.text;

      if (_isEditing) {

        final updatedNote = Note(  // <----- Update existing note
          id: widget.note!.id,
          title: title,
          description: description,
          createdAt: widget.note!.createdAt,
        );
        await DatabaseHelper.instance.updateNote(updatedNote);
      } else {                  // <------ Create new note
        final newNote = Note(
          title: title,
          description: description,
          createdAt: DateTime.now(),
        );
        await DatabaseHelper.instance.createNote(newNote);
      }

      Navigator.of(context).pop(true);  // <----- Return to home screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isEditing ? 'Edit Note' : 'Add Note'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveOrUpdateNote,
          )
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),

              SizedBox(height: 16),
              Expanded(
                child: TextFormField(
                  controller: _descriptionController,
                  maxLines: null,
                  expands: true,
                  textAlignVertical: TextAlignVertical.top,
                  decoration: InputDecoration(
                    labelText: 'Description',
                    border: OutlineInputBorder(),
                    alignLabelWithHint: true,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}