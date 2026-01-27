part of 'task_validation_cubit.dart';

sealed class TaskValidationState extends Equatable {
  const TaskValidationState();

  @override
  List<Object?> get props => [];
}

final class TaskValidationInitial extends TaskValidationState {}

final class TaskisPriority extends TaskValidationState {}

final class TaskisNotPriority extends TaskValidationState {}

final class TaskValidationSuccess extends TaskValidationState {
  final TaskInput taskInput;

  const TaskValidationSuccess({required this.taskInput});

  @override
  List<Object?> get props => [taskInput];
}

final class TaskValidationFailure extends TaskValidationState {
  final String? taskNameError;
  final String? taskDescriptionError;

  const TaskValidationFailure({this.taskNameError, this.taskDescriptionError});

  @override
  List<Object?> get props => [taskNameError, taskDescriptionError];
}
