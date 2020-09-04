import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/widgets/todo_list_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todoList;
  final Function finishTodo;

  TodoList({this.todoList, this.finishTodo});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return TodoListItem(
          finishTodo: finishTodo,
          index: index,
          todo: todoList[index],
        );
      },
      itemCount: todoList.length,
    );
  }
}
