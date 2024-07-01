class Todo {
  Todo({required this.title, required this.checked, required this.date});

  bool checked;
  String title;
  DateTime date;

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      title: json['title'] as String,
      checked: json['checked'] as bool,
      date: DateTime.parse(json['date'])
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'checked': checked,
      'date': date.toIso8601String(),
    };
  }
}
