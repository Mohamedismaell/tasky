import 'package:equatable/equatable.dart';

class TaskInput extends Equatable {
  final String title;
  final String description;
  final bool? priority;

  const TaskInput({
    required this.title,
    required this.description,
    this.priority,
  });

  factory TaskInput.fromJson(Map<String, dynamic> json) {
    return TaskInput(
      title: json['title'],
      description: json['description'],
      priority: json['priority'],
    );
  }
  Map<String, dynamic> toJson() {
    return {'title': title, 'description': description, 'priority': priority};
  }

  @override
  String toString() {
    return 'TaskInput(title: $title, description: $description, priority: $priority)';
  }

  @override
  List<Object?> get props => [title, description, priority];
}
