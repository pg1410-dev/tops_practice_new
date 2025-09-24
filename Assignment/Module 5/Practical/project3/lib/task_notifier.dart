
import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:project3/task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';


const uuid = Uuid();

final taskListProvider = NotifierProvider<TaskNotifier, List<Task>>(
      () => TaskNotifier(),
);

class TaskNotifier extends Notifier<List<Task>> {
  @override
  List<Task> build() {
    _loadTasks();
    return [];
  }


  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksJson = prefs.getString('tasks');
    if (tasksJson != null) {
      final List<dynamic> taskList = jsonDecode(tasksJson);
      state = taskList.map((e) => Task.fromMap(e)).toList();
    }
  }


  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final List<Map<String, dynamic>> tasksList = state.map((e) => e.toMap()).toList();
    prefs.setString('tasks', jsonEncode(tasksList));
  }



  void addTask(String description) {
    final newTask = Task(id: uuid.v4(), description: description);
    state = [...state, newTask];
    _saveTasks();
  }



  void removeTask(String taskId) {
    state = state.where((task) => task.id != taskId).toList();
    _saveTasks();
  }
}