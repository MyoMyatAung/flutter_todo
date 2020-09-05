import 'package:flutter/material.dart';
import 'package:flutter_todo/services/todo_model.dart';
import 'package:flutter_todo/widgets/todo_list_item.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, todoList, child){
        return ListView.builder(

          itemBuilder: (context, index) {
            return TodoListItem(
              index: index,
              todo: todoList.todos[index],
            );
          },
          itemCount: todoList.todos.length,
        );
      },
    );
  }
}
