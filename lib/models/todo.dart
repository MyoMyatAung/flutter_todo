import 'package:flutter/foundation.dart';

class Todo {
  final int id;
  final String title;
  final DateTime dateTime;
  final String rank;
  bool isFinished;

  Todo({
    @required this.id,
    @required this.title,
    @required this.dateTime,
    @required this.rank,
    @required this.isFinished
  });
}
