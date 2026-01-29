import 'package:to_do_app/core/enums/validation_type.dart';

class UserValidation {
  //! Not Working
  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your username';
    }
    return null;
  }

  String? _validateMotivationQuote(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Motivation Quote';
    }
    return null;
  }

  String? getValidator(UserValidationType validationType, String? value) {
    switch (validationType) {
      case UserValidationType.username:
        return _validateUsername(value);
      case UserValidationType.motivationQuote:
        return _validateMotivationQuote(value);
    }
  }
}
