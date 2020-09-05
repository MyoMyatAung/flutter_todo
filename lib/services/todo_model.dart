import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter_todo/models/todo.dart';

class TodoModel extends ChangeNotifier {
  final List<Todo> _todos = [
    Todo(
      id: 1,
      title: "Sleep",
      dateTime: DateTime.now(),
      priority: 'A',
      isFinished: false,
    ),
    Todo(
      id: 2,
      title: "Eat",
      dateTime: DateTime.now(),
      priority: 'B',
      isFinished: false,
    ),
    Todo(
      id: 3,
      title: "Code",
      dateTime: DateTime.now(),
      priority: 'C',
      isFinished: false,
    )
  ];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  void finishTodo(int index){
    if (_todos[index].isFinished == true) {
      _todos[index].isFinished = false;
    } else {
      _todos[index].isFinished = true;
    }
    notifyListeners();
  }

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }
}
