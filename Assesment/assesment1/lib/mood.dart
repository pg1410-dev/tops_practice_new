
import 'dart:ui';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class Mood {
  final String id;
  final String name;
  final String emoji;
  final Color color;
  final DateTime date;

  Mood({required this.name, required this.emoji, required this.color, required this.date}) : id = uuid.v4();
}
