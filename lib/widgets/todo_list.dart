import 'package:flutter/material.dart';

import 'package:easy_todo/widgets/todo_list_item.dart';
import 'package:easy_todo/repositories/todo_repository.dart';
import 'package:easy_todo/models/todo.dart';


class TodoList extends StatefulWidget {
  const TodoList({ super.key});


  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  final TodoRepository todoRepository = TodoRepository();
  final TextEditingController newToDoController = TextEditingController();

  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    todoRepository.getTodoList().then((value) {
      setState(() {
        todos = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: newToDoController,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(
                  hintText: 'Nova Tarefa',
                  border: OutlineInputBorder()),
              ),
            ),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: saveTodo,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple.shade400,
                shape: LinearBorder.start(),
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ))
          ],
        ),
        const SizedBox(height: 10),
        Flexible(
          child: ListView(
            shrinkWrap: true,
            children: [
              for (Todo todo in todos)
                TodoListItem(
                  todo: todo,
                  removeTodo: removeTodo,
                  onCheck: onCheck,
                ),
            ],
          ),
        )
      ],
    );
  }

  void saveTodo() {
    if (newToDoController.text == '') {
      return;
    }
    setState(() {
      Todo todo = Todo(title: newToDoController.text, checked: false, date: DateTime.now());
      todos.insert(0, todo);
    });
    newToDoController.clear();
    todoRepository.saveTodoList(todos);
  }

  void removeTodo(Todo todo) {
    Todo deletedTodo = todo;
    int deletedTodoIndex = todos.indexOf(todo);
    setState(() {
      todos.remove(todo);
      todoRepository.saveTodoList(todos);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 5),
        content: const Text('Tarefa Removida.'),
        action: SnackBarAction(
          label: 'Desfazer',
          onPressed: () {
            setState(() {
              todos.insert(deletedTodoIndex, deletedTodo);
            });
          },
        ),
      ),
    );
  }

  void onCheck(Todo todo) {
    todoRepository.saveTodoList(todos);
  }
}
