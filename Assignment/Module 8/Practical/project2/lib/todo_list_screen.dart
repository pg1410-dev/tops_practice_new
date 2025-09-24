
import 'package:flutter/material.dart';
import 'package:project2/database_helper.dart';
import 'package:project2/task.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final dbHelper = DatabaseHelper.instance;
  List<Task> tasks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _refreshTaskList();
  }


  void _refreshTaskList() async {
    setState(() {
      isLoading = true;
    });
    final data = await dbHelper.getAllTasks();
    setState(() {
      tasks = data;
      isLoading = false;
    });
  }


  void _showTaskDialog({Task? task}) {
    final isEditing = task != null;
    final TextEditingController textController =
    TextEditingController(text: isEditing ? task.title : '');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isEditing ? 'Edit Task' : 'New Task'),
        content: TextField(
          controller: textController,
          autofocus: true,
          decoration: InputDecoration(labelText: 'Task Title'),
        ),
        actions: [
          TextButton(
            child: Text('Cancel'),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child: Text('Save'),
            onPressed: () {
              final title = textController.text;
              if (title.isNotEmpty) {
                if (isEditing) {
                  _updateTask(task.id!, title);
                } else {
                  _addTask(title);
                }
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
    );
  }

  void _addTask(String title) async {
    await dbHelper.insert(Task(title: title));
    _refreshTaskList();
  }

  void _updateTask(int id, String newTitle) async {
    final taskToUpdate = tasks.firstWhere((task) => task.id == id);
    await dbHelper.update(Task(id: id, title: newTitle, isDone: taskToUpdate.isDone));
    _refreshTaskList();
  }

  void _toggleTaskStatus(Task task) async {
    task.isDone = !task.isDone;
    await dbHelper.update(task);
    _refreshTaskList();
  }

  void _deleteTask(int id) async {
    await dbHelper.delete(id);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Task deleted successfully')));
    _refreshTaskList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ToDo List with Database'),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : tasks.isEmpty
          ? Center(
          child: Text(
            'No tasks yet. Add one!',
            style: TextStyle(fontSize: 18, color: Colors.grey),
          )
      )
          : ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            color: Color(0xFF1E1E3F),
            child: ListTile(
              leading: Checkbox(
                value: task.isDone,
                onChanged: (bool? value) {
                  _toggleTaskStatus(task);
                },
              ),
              title: Text(
                task.title,
                style: TextStyle(
                  decoration: task.isDone
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.amber),
                    onPressed: () => _showTaskDialog(task: task),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.redAccent),
                    onPressed: () => _deleteTask(task.id!),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showTaskDialog(),
        tooltip: 'Add Task',
        child: Icon(Icons.add),
      ),
    );
  }
}
