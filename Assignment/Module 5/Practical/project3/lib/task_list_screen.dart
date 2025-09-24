
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project3/task.dart';
import 'package:project3/task_notifier.dart';



// final taskListProvider = StateProvider((ref) => 0);

final taskListProvider = NotifierProvider<TaskNotifier, List<Task>>(
      () => TaskNotifier(),
);



class TaskListScreen extends ConsumerWidget {
  const TaskListScreen({super.key});


  void _showAddTaskDialog(BuildContext context, WidgetRef ref) {
    TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Add a new task'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(hintText: 'Enter task description'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  ref.read(taskListProvider.notifier).addTask(controller.text);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tasks = ref.watch(taskListProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Riverpod To-Do List'),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          final task = tasks[index];
          return Dismissible(
            key: Key(task.id),
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              ref.read(taskListProvider.notifier).removeTask(task.id);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Task removed')),
              );
            },
            child: ListTile(
              title: Text(task.description),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context, ref);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

