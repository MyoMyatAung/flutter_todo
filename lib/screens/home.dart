import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/widgets/add_todo_item.dart';
import 'package:flutter_todo/widgets/todo_list.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Todo> todoList = [
    Todo(
        id: 1,
        title: "Sleep",
        dateTime: DateTime.now(),
        rank: 'A',
        isFinished: false),
    Todo(
        id: 2,
        title: "Eat",
        dateTime: DateTime.now(),
        rank: 'B',
        isFinished: false),
    Todo(
        id: 3,
        title: "Code",
        dateTime: DateTime.now(),
        rank: 'C',
        isFinished: false)
  ];

  void _addTodoList(String title, String rank) {
    Todo newTodo = Todo(
      id: todoList.length + 2,
      title: title,
      isFinished: false,
      rank: rank,
      dateTime: DateTime.now(),
    );
    setState(() {
      todoList.add(newTodo);
    });
  }

  void _finishTodo(int index) {
    setState(() {
      if (todoList[index].isFinished == true) {
        todoList[index].isFinished = false;
      } else {
        todoList[index].isFinished = true;
      }
    });
  }

  void showModalToAddTodo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddTodoItem(addTodoList: _addTodoList);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Todo'),
      ),
      body: TodoList(
        todoList: todoList,
        finishTodo: _finishTodo,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalToAddTodo(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
