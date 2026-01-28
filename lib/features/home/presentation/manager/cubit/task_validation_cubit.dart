import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/enums/validation_type.dart';
import 'package:to_do_app/core/injection/common_di.dart';
import 'package:to_do_app/core/utils/validators/form_validators.dart';
import 'package:to_do_app/features/home/presentation/models/task_input.dart';
part 'task_validation_state.dart';

class TaskValidationCubit extends Cubit<TaskValidationState> {
  TaskValidationCubit(this.validators) : super(TaskValidationInitial()) {
    loadFromCacheTasks();
  }
  final FormValidators validators;
  String taskName = '';
  String taskDescription = '';
  bool taskPriority = false;
  // bool isDone = false;
  final List<TaskInput> tasks = [];
  // final List<TaskInput> tasks = cacheHelper.getData(key: 'tasks') ?? [];

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

  void updadteChecked(int index, bool value) {
    tasks[index] = tasks[index].copyWith(isDone: value);
    final taskEncoded = jsonEncode(tasks.map((e) => e.toJson()).toList());
    cacheHelper.saveData(key: 'tasks', value: taskEncoded);
    // cacheHelper.removeData(key: 'tasks' , value: taskEncoded);
    // print('task.isDone == > ${tasks[index].isDone}');
    emit(TaskValidationSuccess(taskInput: tasks[index]));
    removeTask(index);
  }

  void removeTask(int index) {
    tasks.removeAt(index);
    final taskEncoded = jsonEncode(tasks.map((e) => e.toJson()).toList());
    cacheHelper.saveData(key: 'tasks', value: taskEncoded);
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

  List<TaskInput> loadFromCacheTasks() {
    final tasksEncoded = cacheHelper.getData(key: 'tasks');
    if (tasksEncoded != null) {
      try {
        final List<dynamic> decodedTasks = jsonDecode(tasksEncoded);
        final List<TaskInput> lastTasks = decodedTasks
            .map((e) => TaskInput.fromJson(e as Map<String, dynamic>))
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

  void reset() {
    taskName = '';
    taskDescription = '';
    emit(TaskValidationInitial());
  }
}
