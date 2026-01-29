import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/enums/validation_type.dart';
import 'package:to_do_app/core/injection/common_di.dart';
import 'package:to_do_app/core/utils/validators/form_validators.dart';
import 'package:to_do_app/features/home/presentation/models/task_input.dart';

part 'task_validation_state.dart';

class TaskValidationCubit extends Cubit<TaskValidationState> {
  TaskValidationCubit(this.validators)
    : super(const TaskValidationInitial(tasks: [])) {
    _loadTasks();
  }

  final FormValidators validators;

  String taskName = '';
  String taskDescription = '';
  bool taskPriority = false;

  // 🔹 EDITING (null = add mode)
  int? editingTaskId;

  void updadteTaskName(String value) {
    taskName = value;
  }

  void updadteTaskDescription(String value) {
    taskDescription = value;
  }

  void updadteTaskPriority(bool value) {
    taskPriority = value;
    emit(
      value
          ? TaskisPriority(tasks: state.tasks)
          : TaskisNotPriority(tasks: state.tasks),
    );
  }

  // void startEdit(TaskInput task) {
  //   editingTaskId = task.id;
  //   taskName = task.title;
  //   taskDescription = task.description;
  //   taskPriority = task.priority;
  // }

  // void cancelEdit() {
  //   _resetForm();
  //   emit(TaskValidationInitial(tasks: state.tasks));
  // }

  void submit() {
    final nameError = validators.getValidator(
      ValidationType.taskName,
      taskName,
    );
    final descError = validators.getValidator(
      ValidationType.taskDescription,
      taskDescription,
    );

    if (nameError != null || descError != null) {
      emit(
        TaskValidationFailure(
          tasks: state.tasks,
          taskNameError: nameError,
          taskDescriptionError: descError,
        ),
      );
      return;
    }

    final updatedTasks = List<TaskInput>.from(state.tasks);

    // if (editingTaskId == null) {
    //   // ➕ ADD
    updatedTasks.add(
      TaskInput(
        id: DateTime.now().millisecondsSinceEpoch,
        title: taskName,
        description: taskDescription,
        priority: taskPriority,
      ),
    );
    // } else {
    // ✏️ UPDATE
    // print('Update here === >');/
    // final index = updatedTasks.indexWhere((t) => t.id == editingTaskId);
    // if (index != -1) {
    //   updatedTasks[index] = updatedTasks[index].copyWith(
    //     title: taskName,
    //     description: taskDescription,
    //     priority: taskPriority,
    //   );
    // }
    // }

    _persist(updatedTasks);

    emit(TaskValidationSuccess(tasks: updatedTasks));

    _resetForm();
  }

  void updateChecked(int taskId, bool value) {
    final updatedTasks = state.tasks.map((task) {
      if (task.id == taskId) {
        return task.copyWith(isDone: value);
      }
      return task;
    }).toList();

    _persist(updatedTasks);
    emit(TaskValidationInitial(tasks: updatedTasks));
  }

  void removeTask(int taskId) {
    final updatedTasks = state.tasks
        .where((task) => task.id != taskId)
        .toList();

    _persist(updatedTasks);
    emit(TaskValidationInitial(tasks: updatedTasks));
  }

  void _persist(List<TaskInput> tasks) {
    final encoded = jsonEncode(tasks.map((e) => e.toJson()).toList());
    cacheHelper.saveData(key: 'tasks', value: encoded);
  }

  void _loadTasks() {
    final encoded = cacheHelper.getData(key: 'tasks');
    if (encoded == null) return;

    final decoded = jsonDecode(encoded) as List;
    final tasks = decoded
        .map((e) => TaskInput.fromJson(e as Map<String, dynamic>))
        .toList();

    emit(TaskValidationInitial(tasks: tasks));
  }

  void _resetForm() {
    taskName = '';
    taskDescription = '';
    taskPriority = false;
    editingTaskId = null;
  }

  void reset() {
    _resetForm();
    emit(TaskValidationInitial(tasks: state.tasks));
  }
}
