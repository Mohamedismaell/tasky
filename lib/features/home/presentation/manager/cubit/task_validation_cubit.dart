import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/enums/validation_type.dart';
import 'package:to_do_app/core/injection/common_di.dart';
import 'package:to_do_app/core/utils/validators/form_validators.dart';
import 'package:to_do_app/features/home/presentation/models/task_input.dart';
part 'task_validation_state.dart';

class TaskValidationCubit extends Cubit<TaskValidationState> {
  TaskValidationCubit(this.validators) : super(TaskValidationInitial());
  final FormValidators validators;
  String taskName = '';
  String taskDescription = '';
  bool taskPriority = false;
  final List<dynamic> tasks = [];
  void updadteTaskName(String name) {
    taskName = name;
    print('taskName =>> $taskName');
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
      tasks.add(
        TaskInput(
          title: taskName,
          description: taskDescription,
          priority: taskPriority,
        ),
      );
      // cacheHelper.clearData(key: 'tasks');
      final taskEncoded = jsonEncode(tasks.map((e) => e.toJson()).toList());
      // print('taskEncoded == >$taskEncoded');
      cacheHelper.saveData(key: 'tasks', value: taskEncoded);
      emit(
        TaskValidationSuccess(
          taskInput: TaskInput(
            title: taskName,
            description: taskDescription,
            priority: taskPriority,
          ),
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

  List<dynamic> cacheTasks() {
    final tasksEncoded = cacheHelper.getData(key: 'tasks');
    if (tasksEncoded != null) {
      try {
        final decodedTasks = jsonDecode(tasksEncoded);
        final lastTasks = decodedTasks
            .map((e) => TaskInput.fromJson(e))
            .toList();
        tasks.clear();
        tasks.addAll(lastTasks);
        return tasks;
      } catch (e) {
        return [];
      }
    }
    return [];
  }

  void reset() => emit(TaskValidationInitial());
}
