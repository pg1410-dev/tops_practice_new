
import 'package:flutter/material.dart';
import 'package:project3/database_helper.dart';
import 'package:project3/note.dart';
import 'package:project3/screens/note-detail_screen.dart';

class NotesListScreen extends StatefulWidget {
  const NotesListScreen({super.key});

  @override
  State<NotesListScreen> createState() => _NotesListScreenState();
}

class _NotesListScreenState extends State<NotesListScreen> {
  final dbHelper = DatabaseHelper.instance;
  List<Note> notes = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _refreshNotesList();
  }

  void _refreshNotesList() async {
    setState(() => isLoading = true);
    final data = await dbHelper.getAllNotes();
    setState(() {
      notes = data;
      isLoading = false;
    });
  }

  void _navigateToDetail({Note? note}) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteDetailScreen(note: note)),
    );
    _refreshNotesList();
  }

  void _deleteNote(int id) async {
    await dbHelper.delete(id);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Note deleted')));
    _refreshNotesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Notes'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : notes.isEmpty
          ? Center(
          child: Text(
            'No notes yet. Tap + to add one!',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          ))
          : ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          final note = notes[index];
          return Card(
            margin: EdgeInsets.symmetric(
                horizontal: 8.0, vertical: 4.0),
            color: Color(0xFF1E1E1E),
            child: ListTile(
              title: Text(note.title,
                  style:
                  TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(
                note.content,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () => _navigateToDetail(note: note),
              trailing: IconButton(
                icon:
                Icon(Icons.delete, color: Colors.redAccent),
                onPressed: () => _deleteNote(note.id!),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToDetail(),
        tooltip: 'Add Note',
        child: Icon(Icons.add),
      ),
    );
  }
}
