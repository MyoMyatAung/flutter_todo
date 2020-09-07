import 'package:flutter/material.dart';
import 'package:flutter_todo/services/todo_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class AddTodoItem extends StatefulWidget {
  @override
  _AddTodoItemState createState() => _AddTodoItemState();
}

class _AddTodoItemState extends State<AddTodoItem> {
  DateTime _dateTime;

  void showDatePickerDialog(BuildContext context) async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 60)));
    final selectedTime = await showTimePicker(context: context, initialTime: TimeOfDay(hour: 0, minute: 0));
    setState(() {
      _dateTime = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        selectedTime.hour,
        selectedTime.minute
      );
    });
  }
  final titleController = TextEditingController();
  final rankController = TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.date_range,
                          color: Theme.of(context).primaryColor,
                        ),
                        onPressed: () {
                          showDatePickerDialog(context);
                        },
                      ),
                      Text(_dateTime == null
                          ? "No Pick up date"
                          : DateFormat().format(_dateTime)),
                    ],
                  ),
                ),
                FlatButton(
                  child: Text('Add Todo'),
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    Provider.of<TodoModel>(context, listen: false).addTodo(
                        titleController.text,
                        rankController.text,
                        _dateTime,
                        DateTime.now()
                    );
                    Navigator.of(context).pop();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
