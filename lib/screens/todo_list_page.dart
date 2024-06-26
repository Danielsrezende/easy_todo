import 'package:flutter/material.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/widgets/todo_list_item.dart';
import 'package:todoapp/repositories/todo_repository.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
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
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: newToDoController,
                        textCapitalization: TextCapitalization.words,
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
                          padding: const EdgeInsets.symmetric(vertical: 16)),
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
                ),
              ],
            ),
          ),
        )
      ),
    );
  }

  void saveTodo () {
    String newTodo = newToDoController.text;
    if (newTodo == '') {
      return;
    }
    setState(() {
      Todo todo = Todo(title: newTodo, checked: false);
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

  void onCheck (Todo todo) {
    todoRepository.saveTodoList(todos);
  }
}
