import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/static/ip_address.dart';
import 'package:flutter_todo/static/secure_storage.dart';
import 'package:http/http.dart' as http;

class TodoModel extends ChangeNotifier {
  List<Todo> _todos = [];

  UnmodifiableListView<Todo> get todos => UnmodifiableListView(_todos);

  Future<void> fetchAllTodos() async {
    const url = 'http://${IPAddress.IP_ADDRESS}:3000/get_all_todos';
    String jwt = await SecureStorage.storage.read(key: 'jwt');
    try {
      final response = await http.get(url, headers: {HttpHeaders.authorizationHeader: 'Bearer $jwt'});
      final List<Object> extractedData = json.decode(response.body) as List<Object>;
      print(extractedData);
      List<Todo> loadedTodoList = [];
      extractedData.forEach((json) {
        final Todo todo = Todo.fromJson(json);
        loadedTodoList.add(todo);
      });
      _todos = loadedTodoList;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  void finishTodo(int index, Todo todo) async {
    final url = 'http://${IPAddress.IP_ADDRESS}:3000/update_finished/${todo.id}';
    String jwt = await SecureStorage.storage.read(key: 'jwt');
    int isFinished;
    if (_todos[index].isFinished == 1) {
      isFinished = 0;
    } else {
      isFinished = 1;
    }
    http.put(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer $jwt'
        },
        body: json.encode({"isFinished": isFinished}))
      .then((response){
      _todos[index].isFinished = isFinished;
      notifyListeners();
    });
  }

  void addTodo(String title, String priority, DateTime dateTime, DateTime createdAt) async {
    const url = 'http://${IPAddress.IP_ADDRESS}:3000/add_todo';
    String jwt = await SecureStorage.storage.read(key: 'jwt');
    http
        .post(url,
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              HttpHeaders.authorizationHeader: 'Bearer $jwt'
            },
            body: json.encode({
              "title": title,
              "priority": priority,
              "date_time": dateTime.toIso8601String(),
              "created_at": createdAt.toIso8601String()
            }))
        .then((response) {
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      _todos.add(Todo(
        id: extractedData['insertId'],
        dateTime: dateTime,
        title: title,
        isFinished: 0,
        createdAt: createdAt,
        priority: priority,
      ));
      notifyListeners();
    });
  }
}
