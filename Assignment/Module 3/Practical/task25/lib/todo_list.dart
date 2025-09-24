import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  final List<String> _task = [];

  final TextEditingController _taskController = TextEditingController();


  void _addTodo() {
    if
    (_taskController.text.isNotEmpty) {
      setState(() {
        _task.add(_taskController.text);
        // _taskController.clear();
      });
    }
  }

  void _removeTodo(int index){
    setState(() {
      _task.removeAt(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Todo List Data')),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: 'Add Todo Item',
                    ),
                  ),
                ),
                IconButton(
                    onPressed: _addTodo,
                    icon: Icon(Icons.add_task),
                ),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
                itemCount: _task.length,
                  itemBuilder: (ctx, index) {
                  final tasks = _task[index];
                  return Dismissible(
                      key: Key(tasks),
                      direction: DismissDirection.endToStart,
                      background: Container(
                        color: Colors.red,
                        alignment: Alignment.centerRight,
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: const Icon(Icons.delete, color: Colors.white),
                      ),
                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Confirm Delete"),
                              content: Text("Are you sure you want to delete \"$tasks\"?"),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: const Text("Cancel"),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  child: const Text("Delete"),
                                ),
                              ],
                            );
                          },
                        );
                      },
                    onDismissed: (direction) {
                      _removeTodo(index);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Task "$tasks" removed')),
                      );
                    },
                      child: Card(
                        margin: EdgeInsets.symmetric(
                          vertical: 5,
                          horizontal: 5
                        ),
                        child: ListTile(
                          title: Text('tasks'),
                        ),
                      ),
                  );
                  }
                  ),
          )
        ],
      ), 
    );
  }
}
