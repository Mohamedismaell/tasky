part of 'task_validation_cubit.dart';

sealed class TaskValidationState extends Equatable {
  final List<TaskInput> tasks;

  const TaskValidationState({required this.tasks});

  @override
  List<Object?> get props => [tasks];
}

final class TaskValidationInitial extends TaskValidationState {
  const TaskValidationInitial({required super.tasks});
}

final class TaskValidationFailure extends TaskValidationState {
  final String? taskNameError;
  final String? taskDescriptionError;

  const TaskValidationFailure({
    required super.tasks,
    this.taskNameError,
    this.taskDescriptionError,
  });

  @override
  List<Object?> get props => [tasks, taskNameError, taskDescriptionError];
}

final class TaskValidationSuccess extends TaskValidationState {
  const TaskValidationSuccess({required super.tasks});
}
