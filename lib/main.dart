import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/home.dart';
import 'package:flutter_todo/screens/login.dart';
import 'package:flutter_todo/services/todo_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoModel(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primaryColor: Colors.blue,
            accentColor: Colors.blueAccent,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: Login()
      ),
    );
  }
}
