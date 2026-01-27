import 'package:to_do_app/core/enums/validation_type.dart';

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
    }
    return null;
  }

  String? _validateTaskDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Task Description';
    }
    return null;
  }

  String? getValidator(ValidationType validationType, String? value) {
    switch (validationType) {
      case ValidationType.fullName:
        return _validateFullName(value);
      case ValidationType.taskName:
        return _validateTaskName(value);
      case ValidationType.taskDescription:
        return _validateTaskDescription(value);
    }
  }
}
