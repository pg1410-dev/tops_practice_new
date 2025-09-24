
class Task {
  final String id;
  final String description;
  final bool isCompleted;

  Task({
    required this.id,
    required this.description,
    this.isCompleted = false,
  });

  Task copyWith({String? id, String? description, bool? isCompleted}) {
    return Task(
      id: id ?? this.id,
      description: description ?? this.description,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }


  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      description: map['description'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}