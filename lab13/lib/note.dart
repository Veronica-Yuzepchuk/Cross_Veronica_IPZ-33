import 'package:intl/intl.dart';

class Note {
  final int? id;
  final String text;
  final DateTime createdAt;

  Note({this.id, required this.text, DateTime? createdAt})
      : createdAt = createdAt ?? DateTime.now();

  Note.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        text = map['text'],
        createdAt = DateTime.parse(map['created_at']);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'text': text,
      'created_at': createdAt.toIso8601String()
    };
  }

  String get formattedDate =>
      DateFormat('dd.MM.yyyy HH:mm').format(createdAt);
}