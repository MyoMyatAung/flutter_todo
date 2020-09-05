import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/services/todo_model.dart';
import 'package:provider/provider.dart';

class AddTodoItem extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final rankController = TextEditingController();

    final List<Todo> todoList =
        Provider.of<TodoModel>(context, listen: false).todos;

    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Rank',
              ),
              controller: rankController,
            ),
            FlatButton(
              child: Text('Add Todo'),
              textColor: Theme.of(context).primaryColor,
              onPressed: () {
                Provider.of<TodoModel>(context, listen: false).addTodo(Todo(
                    id: todoList.length + 2,
                    title: titleController.text,
                    isFinished: false,
                    rank: rankController.text,
                    dateTime: DateTime.now()));
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
