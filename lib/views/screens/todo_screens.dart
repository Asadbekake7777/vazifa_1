import 'package:flutter/material.dart';
import 'package:vazifa_1/controllers/todo_controller.dart';
import 'package:vazifa_1/views/widgets/todo_add_dialog.dart';
import 'package:vazifa_1/views/widgets/todostem.dart';

class TodosScreens extends StatefulWidget {
  const TodosScreens({super.key});
  
  get todos => null;

  @override
  State<TodosScreens> createState() => _TodosScreensState();
}

class _TodosScreensState extends State<TodosScreens> {
  final todosController = TodosController();

  void delete(int index) {
    todosController.deleteTodo(index);
    setState(() {});
  }

  void editTodos(int index) {
    todosController.editTodo(index);
    setState(() {});
  }

  int getCheckedCount() {
    return widget.todos.where((todo) => todo.isChaked).length;
  }

  int getUncheckedCount() {
    return widget.todos.where((todo) => !todo.isChaked).length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text("Todos App", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black,),),
        actions: [
          IconButton(
            onPressed: () async {
              Map<String, dynamic>? todo = await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (ctx) {
                  return const TodosAddDialog();
                },
              );
              if (todo != null) {
                todosController.addTodo(
                  todo['text'],
                  todo['time'],
                );
                setState(() {});
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: todosController.todo.length,
        itemBuilder: (ctx, index) {
          return ContactItem(
            todosController.todo[index],
            onDelete: () {
              delete(index);
            },
            editTodo: () async {
              Map<String, dynamic>? todo = await showDialog(
                barrierDismissible: false,
                context: context,
                builder: (ctx) {
                  return const TodosAddDialog();
                },
              );
              if (todo != null) {
                todosController.addTodo(
                  todo['text'],
                  todo['time'],
                );
                setState(() {});
              }
            },
          );
        },
      ),
    );
  }
}

