// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Todo todoFromJson(String str) => Todo.fromJson(json.decode(str));

String todoToJson(Todo data) => json.encode(data.toJson());

class Todo {
  Todo({
    this.id,
    this.title,
    this.dateTime,
    this.priority,
    this.isFinished,
    this.createdAt,
  });

  int id;
  String title;
  DateTime dateTime;
  String priority;
  int isFinished;
  DateTime createdAt;

  factory Todo.fromJson(Map<String, dynamic> json) => Todo(
    id: json["id"],
    title: json["title"],
    dateTime: DateTime.parse(json["date_time"]),
    priority: json["priority"],
    isFinished: json["is_finished"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "date_time": dateTime.toIso8601String(),
    "priority": priority,
    "is_finished": isFinished,
    "created_at": createdAt.toIso8601String(),
  };
}
