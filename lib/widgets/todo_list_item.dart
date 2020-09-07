import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/services/todo_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class TodoListItem extends StatelessWidget {

  final Todo todo;
  final int index;

  TodoListItem({this.todo,this.index});

  @override
  Widget build(BuildContext context) {
    Color rankColor;
    if (todo.priority == 'A') {
      rankColor = Colors.red;
    } else if (todo.priority == 'B') {
      rankColor = Colors.yellow;
    } else {
      rankColor = Colors.green;
    }
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundColor: todo.isFinished == 1
                ? Colors.grey
                : rankColor,
          ),
          title: Text(
            todo.title,
            style: TextStyle(
              decoration: todo.isFinished == 1
                  ? TextDecoration.lineThrough
                  : null,
            ),
          ),
          subtitle: Text(DateFormat().format(todo.dateTime)),
          trailing: IconButton(
            color: Theme.of(context).primaryColorDark,
            icon: Icon(Icons.assignment_turned_in),
            onPressed: () {
              Provider.of<TodoModel>(context,listen:false).finishTodo(index, todo);
            },
          ),
        ),
        Divider()
      ],
    );
  }
}
