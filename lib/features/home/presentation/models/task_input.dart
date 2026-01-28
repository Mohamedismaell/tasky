import 'package:equatable/equatable.dart';

class TaskInput extends Equatable {
  final String title;
  final String description;
  final bool priority;
  final bool isDone;
  const TaskInput({
    required this.title,
    required this.description,
    required this.priority,
    this.isDone = false,
  });
  TaskInput copyWith({
    String? title,
    String? description,
    bool? priority,
    bool? isDone,
  }) {
    return TaskInput(
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      isDone: isDone ?? this.isDone,
    );
  }

  factory TaskInput.fromJson(Map<String, dynamic> json) {
    return TaskInput(
      title: json['title'],
      description: json['description'],
      priority: json['priority'],
      isDone: json['isdone'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'priority': priority,
      'isdone': isDone,
    };
  }

  @override
  String toString() {
    return 'TaskInput(title: $title, description: $description, priority: $priority, isDone: $isDone)';
  }

  @override
  List<Object?> get props => [title, description, priority, isDone];
}
