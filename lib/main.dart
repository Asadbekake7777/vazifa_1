import 'package:flutter/material.dart';
import 'package:vazifa_1/views/screens/todo_screens.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodosScreens(),
    );
  }
}

