

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:assesment2/models/note_model.dart';
import 'package:assesment2/db/database_helper.dart';
import 'package:assesment2/screens/add_edit_note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  late Future<List<Note>> _notesFuture;

  List<Note> _allNotes = [];
  List<Note> _filteredNotes = [];

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _refreshNotes();
    _searchController.addListener(_filterNotes);
  }

  void _refreshNotes() {
    setState(() {
      _notesFuture = DatabaseHelper.instance.getAllNotes().then((notes) {
        _allNotes = notes;
        _filteredNotes = notes;
        return notes;
      });
    });
  }

  void _filterNotes() {
    String query = _searchController.text.toLowerCase();
    setState(() {
      _filteredNotes = _allNotes.where((note) {
        return note.title.toLowerCase().contains(query) ||
            note.description.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _navigateToAddEditScreen([Note? note]) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddEditNoteScreen(note: note),
      ),
    );

    if (result == true) {
      _refreshNotes();
    }
  }

  void _deleteNote(int id) async {
    await DatabaseHelper.instance.deleteNote(id);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Note deleted successfully')),
    );
    _refreshNotes();
  }

  void _showDeleteConfirmation(int id) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Delete Note'),
          content: Text('Are you sure you want to delete this note?'),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                _deleteNote(id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyNotes'),
        centerTitle: true,
      ),

      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search Notes',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ),

          Expanded(
            child: FutureBuilder<List<Note>>(
              future: _notesFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: CircularProgressIndicator());
                } else if
                (snapshot.hasError) {
                  return Center(
                      child: Text('Error: ${snapshot.error}'));
                } else if
                (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(
                      child: Text('No notes yet. Add one!'));
                }

                return ListView.builder(
                  itemCount: _filteredNotes.length,
                  itemBuilder: (context, index) {
                    final note = _filteredNotes[index];
                    return Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: ListTile(
                        title: Text(
                          note.title,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              note.description.length > 50
                                  ? '${note.description.substring(0, 50)}...'
                                  : note.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),

                            SizedBox(height: 8),
                            Text(
                              DateFormat.yMMMd().format(note.createdAt),
                              style: TextStyle(color: Colors.grey.shade600),
                            ),
                          ],
                        ),

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () => _navigateToAddEditScreen(note),
                            ),

                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () => _showDeleteConfirmation(note.id!),
                            ),
                          ],
                        ),
                        onTap: () => _navigateToAddEditScreen(note),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddEditScreen(),
        child: Icon(Icons.add),
        tooltip: 'Add Note',
      ),
    );
  }
}