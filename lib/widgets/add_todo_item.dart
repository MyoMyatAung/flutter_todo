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
  String priorityValue = "A";
  List<String> priorityValueList = ['A', 'B', 'C'];

  void showDatePickerDialog(BuildContext context) async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 60)));
    final selectedTime = await showTimePicker(
        context: context, initialTime: TimeOfDay(hour: 0, minute: 0));
    setState(() {
      _dateTime = DateTime(selectedDate.year, selectedDate.month,
          selectedDate.day, selectedTime.hour, selectedTime.minute);
    });
  }

  final titleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Add Your Todo',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     labelText: 'Rank',
            //   ),
            //   controller: rankController,
            // ),
            DropdownButton(
              value: priorityValue,
              icon: Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.blue),
              underline: Container(
                height: 2,
                color: Colors.blue
              ),
              items: priorityValueList
                  .map<DropdownMenuItem<String>>(
                    (priority){
                      return DropdownMenuItem<String>(
                        child: Text(priority),
                        value: priority,
                      );
                    }
                  )
                  .toList(),
              onChanged: (value){
                setState(() {
                  priorityValue = value;
                });
              },
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
                          color: Colors.blue,
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
                  textColor: Colors.blue,
                  onPressed: () {
                    Provider.of<TodoModel>(context, listen: false).addTodo(
                        titleController.text,
                        priorityValue,
                        _dateTime,
                        DateTime.now());
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
