import 'package:flutter/material.dart';
import 'package:mvvm/model/todo_model.dart';

class TodoViewModel extends ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    _todos = [..._todos, Todo(title: title)];
    notifyListeners();
  }

  void toggleTodoStatus(int index) {
    _todos = _todos.map((todo) {
      if (_todos.indexOf(todo) == index) {
        return todo.copyWith(isCompleted: !todo.isCompleted);
      }
      return todo;
    }).toList();
    notifyListeners();
  }

  void removeTodo(int index) {
    _todos = _todos.where((todo) => _todos.indexOf(todo) != index).toList();
    notifyListeners();
  }
}
