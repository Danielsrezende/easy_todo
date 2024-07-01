import 'package:flutter/material.dart';
import 'package:easy_todo/widgets/todo_list.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: Center(child: TodoList()),
          ),
        )
      );
  }
}
