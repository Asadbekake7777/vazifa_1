import 'package:flutter/material.dart';

class TodosAddDialog extends StatefulWidget {
  const TodosAddDialog({super.key});

  @override
  State<TodosAddDialog> createState() => _TodosAddDialogState();
}

class _TodosAddDialogState extends State<TodosAddDialog> {
  final _formKey = GlobalKey<FormState>();
  String text = "";
  String time = "";

  void _add() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      Navigator.pop(context, {
        "text": text,
        "time": time,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Todos qo'shish"),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Todo kiriting",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos todo kiriting";
                }
                return null;
              },
              onSaved: (newValue) {
                text = newValue ?? "";
              },
            ),
            const SizedBox(height: 10),
            TextFormField(
              textInputAction: TextInputAction.done,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Todo time",
              ),
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return "Iltimos vaqtni kiriting";
                }
                return null;
              },
              onSaved: (newValue) {
                time = newValue ?? "";
              },
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade900,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                "Cancel",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _add,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade900,
                foregroundColor: Colors.white,
              ),
              child: const Text(
                "Add",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
