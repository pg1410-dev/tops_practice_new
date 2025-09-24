import 'package:flutter/material.dart';


class TaskManager extends StatefulWidget {
  const TaskManager({super.key});

  @override
  State<TaskManager> createState() => _TaskManagerState();
}

class _TaskManagerState extends State<TaskManager> {
  final List<Map<String, dynamic>> _tasks = [];

  final TextEditingController _taskController = TextEditingController();

  void _addTask() {
    if (_taskController.text.trim().isEmpty) return;

    setState(() {
      _tasks.add({
        'title': _taskController.text,
        'completed': false,
      });
      _taskController.clear();
    });
  }

  void _toggleTask(int index, bool? value) {
    setState(() {
      _tasks[index]['completed'] = value ?? false;
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task Manager')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: const InputDecoration(
                      labelText: 'Enter Task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: _addTask,
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _tasks.isEmpty
                ? const Center(child: Text('No tasks added yet!'))
                : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(_tasks[index]['title']),
                  onDismissed: (direction) => _removeTask(index),
                  background: Container(color: Colors.red),
                  child: CheckboxListTile(
                    title: Text(
                      _tasks[index]['title'],
                      style: TextStyle(
                        decoration: _tasks[index]['completed']
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    value: _tasks[index]['completed'],
                    onChanged: (value) => _toggleTask(index, value),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
