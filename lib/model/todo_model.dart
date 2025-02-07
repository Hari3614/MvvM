class Todo {
  final String title;
  final bool isCompleted;

  Todo({required this.title, this.isCompleted = false});

  Todo copyWith({String? title, bool? isCompleted}) {
    return Todo(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
