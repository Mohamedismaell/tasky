import 'package:to_do_app/core/enums/task_options.dart';

class FormValidators {
  //! Not Working
  String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? _validateTaskName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Task Name';
    } else if (value.length >= 12) {
      return 'Please enter at max 12 characters';
    }
    return null;
  }

  String? _validateTaskDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Task Description';
    }
    return null;
  }

  String? getValidator(TaskValidationType validationType, String? value) {
    switch (validationType) {
      case TaskValidationType.fullName:
        return _validateFullName(value);
      case TaskValidationType.taskName:
        return _validateTaskName(value);
      case TaskValidationType.taskDescription:
        return _validateTaskDescription(value);
    }
  }
}
