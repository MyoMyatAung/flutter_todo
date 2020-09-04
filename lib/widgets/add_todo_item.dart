import 'package:flutter/material.dart';

class AddTodoItem extends StatelessWidget {

  final Function addTodoList;
  AddTodoItem({this.addTodoList});

  @override
  Widget build(BuildContext context) {
    final titleController = TextEditingController();
    final rankController = TextEditingController();
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
                addTodoList(titleController.text, rankController.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
      ),
    );
  }
}
