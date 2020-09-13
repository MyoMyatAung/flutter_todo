import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/add_todo_item.dart';
import 'package:flutter_todo/widgets/todo_list.dart';

class Home extends StatelessWidget {
  final String jwt;
  final Map<String, dynamic> payload;

  Home({this.jwt, this.payload});

  factory Home.fromBase64(String jwt) {
    return Home(
      jwt: jwt,
      payload: json.decode(
        ascii.decode(
          base64.decode(
            base64.normalize(jwt.split(".")[1]),
          ),
        ),
      ),
    );
  }

  void showModalToAddTodo(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddTodoItem();
        });
  }

  @override
  Widget build(BuildContext context) {
    print(payload);
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Todo'),
        elevation: 0,
      ),
      body: TodoList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalToAddTodo(context);
        },
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
