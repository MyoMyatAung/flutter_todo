import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/home.dart';
import 'package:flutter_todo/screens/login.dart';
import 'package:flutter_todo/services/auth.dart';
import 'package:flutter_todo/services/todo_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => TodoModel(),
      ),
      ChangeNotifierProvider(
        create: (context) => AuthProvider(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final jwtOrEmpty = Provider.of<AuthProvider>(context).jwtOrEmpty;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
        accentColor: Colors.blueAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder(
        future: jwtOrEmpty,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data != "") {
            var str = snapshot.data;
            var jwt = str.split(".");
            if (jwt.length != 3) {
              return Login();
            } else {
              var payload = json.decode(
                  ascii.decode(base64.decode(base64.normalize(jwt[1]))));
              print(DateFormat().format(
                  DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000)));
              if (DateTime.fromMillisecondsSinceEpoch(payload['exp'] * 1000)
                  .isAfter(DateTime.now())) {
                return Home(
                  jwt: str,
                  payload: payload,
                );
              } else {
                return Login();
              }
            }
          } else {
            return Login();
          }
        },
      ),
    );
  }
}
