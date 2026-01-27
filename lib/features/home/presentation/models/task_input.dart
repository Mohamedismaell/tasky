import 'package:equatable/equatable.dart';

class TaskInput extends Equatable {
  final String title;
  final String description;
  final bool? priority;

  TaskInput({required this.title, required this.description, this.priority});
  @override
  String toString() {
    return 'TaskInput(title: $title, description: $description, priority: $priority)';
  }

  @override
  List<Object?> get props => [title, description, priority];
}
