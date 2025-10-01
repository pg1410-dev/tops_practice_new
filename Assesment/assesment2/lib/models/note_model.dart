
class Note {
  final int? id;
  final String title;
  final String description;
  final DateTime createdAt;

  Note({
    this.id,
    required this.title,
    required this.description,
    required this.createdAt,
  });


  Map<String, dynamic> toMap() {  // <------- Convert a Note object into a Map object
    return {
      'id': id,
      'title': title,
      'description': description,
      'created_at': createdAt.toIso8601String(), // <----------- Store DateTime as a string
    };
  }


  factory Note.fromMap(Map<String, dynamic> map) { // <------- Create a Note object from a Map object
    return Note(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      createdAt: DateTime.parse(map['created_at']), // <-------- Parse string back to DateTime
    );
  }
}