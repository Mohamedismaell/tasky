import 'package:equatable/equatable.dart';

class TaskInput extends Equatable {
  final int id;

  final String title;
  final String description;
  final bool priority;
  final bool isDone;

  const TaskInput({
    required this.id,
    required this.title,
    required this.description,
    required this.priority,
    this.isDone = false,
  });

  TaskInput copyWith({
    int? id,
    String? title,
    String? description,
    bool? priority,
    bool? isDone,
  }) {
    return TaskInput(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      isDone: isDone ?? this.isDone,
    );
  }

  factory TaskInput.fromJson(Map<String, dynamic> json) {
    return TaskInput(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      priority: json['priority'] as bool,
      isDone: json['isDone'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'priority': priority,
      'isDone': isDone,
    };
  }

  @override
  String toString() {
    return 'TaskInput(id: $id, title: $title, description: $description, priority: $priority, isDone: $isDone)';
  }

  @override
  List<Object?> get props => [id, title, description, priority, isDone];
}
