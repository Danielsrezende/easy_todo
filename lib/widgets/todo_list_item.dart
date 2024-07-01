import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:easy_todo/models/todo.dart';

class TodoListItem extends StatefulWidget {
  const TodoListItem({required this.todo, required this.removeTodo, required this.onCheck, super.key});

  final Todo todo;
  final Function(Todo) removeTodo;
  final Function(Todo) onCheck;

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Slidable(
        endActionPane: ActionPane(
          extentRatio: 0.20,
          motion: const ScrollMotion(),
          children: [
            SlidableAction(
              onPressed: (context) {
                widget.removeTodo(widget.todo);
              },
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              icon: Icons.delete,
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: widget.todo.checked ? Colors.grey.shade200 : Colors.deepPurple.shade50,
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
          child: Row(
            children: [
              Checkbox(
                value: widget.todo.checked,
                activeColor:  Colors.grey,
                onChanged: (bool? value) {
                setState(() {
                  widget.todo.checked = value as bool;
                });
                widget.onCheck(widget.todo);
              }, ),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(DateFormat('dd/MM/yyyy').format(widget.todo.date)),
                      Text(
                        overflow: TextOverflow.fade,
                        widget.todo.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          decoration: widget.todo.checked ? TextDecoration.lineThrough : TextDecoration.none,
                          color: Colors.black,
                          letterSpacing: 1,
                        )
                      )
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
