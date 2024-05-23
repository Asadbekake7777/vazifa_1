// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:vazifa_1/models/todo.dart';

class ContactItem extends StatefulWidget {
  final Todo todos;
  final Function() onDelete;
  final Function() editTodo;
  const ContactItem(
    this.todos, {
    super.key,
    required this.onDelete,
    required this.editTodo,
  });

  @override
  State<ContactItem> createState() => _ContactItemState();
}

class _ContactItemState extends State<ContactItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.todos.text,
        style: const TextStyle(
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        widget.todos.time,
        style: const TextStyle(
          fontSize: 10,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              widget.editTodo();
              widget.onDelete();
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.blue,
            ),
          ),
          IconButton(
            onPressed: widget.onDelete,
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          IconButton(
            icon: Icon(
              widget.todos.isChaked
                  ? Icons.check_box
                  : Icons.check_box_outline_blank,
              color: Colors.purple,
            ),
            onPressed: () {
              setState(() {
                widget.todos.isChaked = !widget.todos.isChaked;
              });
            },
          ),
        ],
      ),
    );
  }
}
