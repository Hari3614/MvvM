// Screens (todo_screen.dart)
import 'package:flutter/material.dart';
import 'package:mvvm/core/theme_colors.dart';
import 'package:mvvm/view/todo_screen_helpers.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "ToDo",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: AppTheme.primaryColor,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TodoInput(),
            SizedBox(height: 20),
            Expanded(child: TodoList()),
          ],
        ),
      ),
      backgroundColor: AppTheme.backgroundColor.shade100,
    );
  }
}

extension on Color {
  get shade100 => null;
}
