import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:intl/intl.dart';

class TodoListItem extends StatelessWidget {

  final Todo todo;
  final Function finishTodo;
  final int index;

  TodoListItem({this.todo,this.finishTodo,this.index});

  @override
  Widget build(BuildContext context) {
    Color rankColor;
    if (todo.rank == 'A') {
      rankColor = Colors.red;
    } else if (todo.rank == 'B') {
      rankColor = Colors.yellow;
    } else {
      rankColor = Colors.green;
    }
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: todo.isFinished == true
                ? Colors.grey
                : rankColor,
          ),
          title: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.isFinished == true
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),
          subtitle: Text(DateFormat().format(todo.dateTime)),
          trailing: IconButton(
            color: Theme.of(context).primaryColorDark,
            icon: Icon(Icons.assignment_turned_in),
            onPressed: () {
              finishTodo(index);
            },
          ),
        ),
        Divider()
      ],
    );
  }
}
