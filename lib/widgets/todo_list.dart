import 'package:flutter/material.dart';
import 'package:flutter_todo/services/todo_model.dart';
import 'package:flutter_todo/widgets/todo_list_item.dart';
import 'package:provider/provider.dart';

class TodoList extends StatefulWidget {

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

  bool isInit = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    if(isInit){
      print('didChangeDependencies');
      Provider.of<TodoModel>(context).fetchAllTodos();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TodoModel>(
      builder: (context, todoList, child){
        return ListView.builder(

          itemBuilder: (context, index) {
            return TodoListItem(
              index: index,
              todo: todoList.todos[index],
            );
          },
          itemCount: todoList.todos.length,
        );
      },
    );
  }
}
