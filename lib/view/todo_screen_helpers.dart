import 'package:flutter/material.dart';
import 'package:mvvm/core/theme_colors.dart';
import 'package:mvvm/viewmodel/todo_view_model.dart';
import 'package:provider/provider.dart';

// <<<<<<<<<<..........Todo list widget..........>>>>>>>>>>

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);

    return ListView.builder(
      itemCount: viewModel.todos.length,
      itemBuilder: (context, index) {
        final todo = viewModel.todos[index];
        return Card(
          color: AppTheme.cardColor,
          elevation: 3,
          margin: EdgeInsets.symmetric(vertical: 5),
          child: ListTile(
            leading: IconButton(
              icon: Icon(
                todo.isCompleted
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: todo.isCompleted ? AppTheme.accentColor : Colors.grey,
              ),
              onPressed: () => viewModel.toggleTodoStatus(index),
            ),
            title: Text(
              todo.title,
              style: TextStyle(
                decoration: todo.isCompleted
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontSize: 16,
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () => viewModel.removeTodo(index),
            ),
          ),
        );
      },
    );
  }
}

// <<<<<<<<<<..........Todo input widget..........>>>>>>>>>>

class TodoInput extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  TodoInput({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context, listen: false);

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppTheme.cardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 5)],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Enter a task",
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.add, color: AppTheme.primaryColor),
            onPressed: () {
              if (_controller.text.isNotEmpty) {
                viewModel.addTodo(_controller.text);
                _controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
