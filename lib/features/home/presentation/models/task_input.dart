import 'package:equatable/equatable.dart';

class TaskInput extends Equatable {
  final int id;

  final String title;
  final String description;
  final bool isPriority;
  final bool isDone;

  const TaskInput({
    required this.id,
    required this.title,
    required this.description,
    required this.isPriority,
    this.isDone = false,
  });

  TaskInput copyWith({
    int? id,
    String? title,
    String? description,
    bool? isPriority,
    bool? isDone,
  }) {
    return TaskInput(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      isPriority: isPriority ?? this.isPriority,
      isDone: isDone ?? this.isDone,
    );
  }

  factory TaskInput.fromJson(Map<String, dynamic> json) {
    return TaskInput(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      isPriority: json['isPriority'] as bool,
      isDone: json['isDone'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'isPriority': isPriority,
      'isDone': isDone,
    };
  }

  @override
  String toString() {
    return 'TaskInput(id: $id, title: $title, description: $description, isPriority: $isPriority, isDone: $isDone)';
  }

  @override
  List<Object?> get props => [id, title, description, isPriority, isDone];
}
