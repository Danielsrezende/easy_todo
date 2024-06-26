class Todo {
  Todo({required this.title, required this.checked});

  String title;
  bool checked;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'] as String,
      checked: json['checked'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'checked': checked,
    };
  }
}
