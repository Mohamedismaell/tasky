import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/enums/task_options.dart';
import 'package:to_do_app/core/injection/common_di.dart';
import 'package:to_do_app/core/utils/validators/user_validation.dart';
import 'package:to_do_app/features/home/presentation/models/user_details.dart';

part 'user_validation_state.dart';

class UserValidationCubit extends Cubit<UserValidationState> {
  UserValidationCubit(this.validators)
    : super(
        UserValidationInitial(
          userDetails: UserDetailsModel(userName: '', motivationQuote: ''),
        ),
      ) {
    _loadUserDetails();
  }

  final UserValidation validators;
  String userName = cacheHelper.getData(key: 'userName') ?? '';
  String motivationQuote = cacheHelper.getData(key: 'motivationQuote') ?? '';

  void updateUserName(String value) {
    userName = value;
  }

  void updateMotivationQuote(String value) {
    motivationQuote = value;
  }

  void submitUserName() {
    final nameError = validators.getValidator(
      UserValidationType.username,
      userName,
    );

    if (nameError != null) {
      emit(
        UserValidationFailure(
          userNameError: nameError,
          motivationQuoteError: null,
          userDetails: state.userDetails,
        ),
      );
      return;
    }
    final updatedUserDetails = UserDetailsModel(
      userName: userName,
      motivationQuote: state.userDetails.motivationQuote,
    );

    _persist(updatedUserDetails);

    emit(UserValidationSuccess(userDetails: updatedUserDetails));

    _resetForm();
  }

  void submitUserDetails() {
    final nameError = validators.getValidator(
      UserValidationType.username,
      userName,
    );
    final quoteError = validators.getValidator(
      UserValidationType.motivationQuote,
      motivationQuote,
    );

    if (nameError != null || quoteError != null) {
      emit(
        UserValidationFailure(
          userNameError: nameError,
          motivationQuoteError: quoteError,
          userDetails: state.userDetails,
        ),
      );
      return;
    }
    final updatedUserDetails = UserDetailsModel(
      userName: userName,
      motivationQuote: motivationQuote,
    );

    _persist(updatedUserDetails);

    emit(UserValidationSuccess(userDetails: updatedUserDetails));

    _resetForm();
  }

  void _persist(UserDetailsModel userDetails) {
    final encoded = jsonEncode(userDetails.toJson());
    cacheHelper.saveData(key: 'userDetails', value: encoded);
  }

  void _loadUserDetails() {
    final encoded = cacheHelper.getData(key: 'userDetails');
    if (encoded == null || encoded is! String) return;

    try {
      final decoded = jsonDecode(encoded);
      if (decoded is Map<String, dynamic>) {
        final userDetails = UserDetailsModel.fromJson(decoded);
        // print('userDetails is here  === >>> $userDetails');
        emit(UserValidationInitial(userDetails: userDetails));
      } else {
        // Invalid data format - clear it
        cacheHelper.removeData(key: 'userDetails');
      }
    } catch (e) {
      // print('Error parsing userDetails: $e');
      cacheHelper.removeData(key: 'userDetails');
    }
  }

  void _resetForm() {
    userName = '';
    motivationQuote = '';
  }

  void reset() {
    _resetForm();
    emit(UserValidationInitial(userDetails: state.userDetails));
  }
}
