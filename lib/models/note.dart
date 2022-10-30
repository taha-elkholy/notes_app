import 'package:flutter/foundation.dart';

@immutable
class Note {
  final int id;
  final String title;
  final String body;
  final DateTime dateTime;

  const Note({
    required this.id,
    required this.title,
    required this.body,
    required this.dateTime,
  });

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'] as int,
      title: json['title'] as String,
      body: json['body'] as String,
      dateTime: json['dateTime'] as DateTime,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'dateTime': dateTime,
      };

  Note copyWith({String? title, String? body, DateTime? dateTime}) {
    return Note(
      id: id,
      title: title ?? this.title,
      body: body ?? this.body,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  @override
  String toString() {
    return '(Note: id = $id, title = $title, body = $body, dateTime = $dateTime)';
  }
}
