import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/enums/validation_type.dart';
import 'package:to_do_app/core/utils/validators/form_validators.dart';
import 'package:to_do_app/features/home/presentation/models/task_input.dart';

part 'task_validation_state.dart';

class TaskValidationCubit extends Cubit<TaskValidationState> {
  TaskValidationCubit(this.validators) : super(TaskValidationInitial());
  final FormValidators validators;
  String taskName = '';
  String taskDescription = '';
  bool taskPriority = false;
  void updadteTaskName(String name) {
    taskName = name;
    // print('taskName =>> $taskName');
  }

  void updadteTaskDescription(String description) {
    taskDescription = description;
  }

  void updadteTaskPriority(bool priority) {
    taskPriority = priority;
    if (priority) {
      emit(TaskisPriority());
    } else {
      emit(TaskisNotPriority());
    }
  }

  void submit() {
    final validateTaskName = validators.getValidator(
      ValidationType.taskName,
      taskName,
    );
    final validateTaskDescription = validators.getValidator(
      ValidationType.taskDescription,
      taskDescription,
    );
    if (validateTaskName == null && validateTaskDescription == null) {
      emit(
        TaskValidationSuccess(
          taskInput: TaskInput(
            title: taskName,
            description: taskDescription,
            priority: taskPriority,
          ),
        ),
      );
      print(
        TaskInput(
          title: taskName,
          description: taskDescription,
          priority: taskPriority,
        ),
      );
    } else {
      emit(
        TaskValidationFailure(
          taskNameError: validateTaskName,
          taskDescriptionError: validateTaskDescription,
        ),
      );
    }
  }
}
