import 'package:vazifa_1/models/todo.dart';

class TodosController {
  final List<Todo> _todos = [
    Todo(
      text: "Uy ishi",
      time: "12:30",
      isChaked: false,
    ),
    Todo(
      text: "Sport bilan shug'urlanish",
      time: "14:00",
      isChaked: false,
    ),
    Todo(
      text: "Suzish",
      time: "16:00",
      isChaked: false,
    ),
    Todo(
      text: "Uxlash",
      time: "21:00",
      isChaked: false,
    ),
  ];

  List<Todo> get todo {
    return [..._todos];
  }

  void addTodo(String text, String time) {
    _todos.add(
      Todo(
        text: text,
        time: time,
        isChaked: false,
      ),
    );
  }

  void deleteTodo(int index) {
    _todos.removeAt(index);
  }

  void editTodo(int index) {
    _todos[index];
  }

  int getCheckedCount() {
    return _todos.where((todo) => todo.isChaked).length;
  }

  int getUncheckedCount() {
    return _todos.where((todo) => !todo.isChaked).length;
  }

}


