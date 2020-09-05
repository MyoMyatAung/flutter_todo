import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/add_todo_item.dart';
import 'package:flutter_todo/widgets/todo_list.dart';

class Home extends StatelessWidget {
  void showModalToAddTodo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddTodoItem();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Todo'),
      ),
      body: TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalToAddTodo(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
