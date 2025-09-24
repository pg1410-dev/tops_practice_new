
class Task {
  final int? id;
  final String title;
  bool isDone;

  Task({
    this.id,
    required this.title,
    this.isDone = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'isDone': isDone ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      isDone: map['isDone'] == 1,
    );
  }

  @override
  String toString() {
    return 'Task{id: $id, title: $title, isDone: $isDone}';
  }
}
