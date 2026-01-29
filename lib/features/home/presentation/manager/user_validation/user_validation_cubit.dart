import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_app/core/enums/validation_type.dart';
import 'package:to_do_app/core/injection/common_di.dart';
import 'package:to_do_app/core/utils/validators/user_validation.dart';
import 'package:to_do_app/features/home/presentation/models/user_details.dart';

part 'user_validation_state.dart';

class UserValidationCubit extends Cubit<UserValidationState> {
  UserValidationCubit(this.validators)
    : super(UserValidationInitial(userDetails: [])) {
    _loadUserDetails();
  }

  final UserValidation validators;
  String userName = cacheHelper.getData(key: 'userName') ?? '';
  String motivationQuote = cacheHelper.getData(key: 'motivationQuote') ?? '';

  void updadteUserName(String value) {
    userName = value;
  }

  void updadteMotivationQuote(String value) {
    motivationQuote = value;
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

    final updatedUserDetails = List<UserDetailsModel>.from(state.userDetails);

    updatedUserDetails.add(
      UserDetailsModel(userName: userName, motivationQuote: motivationQuote),
    );

    _persist(updatedUserDetails);

    emit(UserValidationSuccess(userDetails: updatedUserDetails));

    _resetForm();
    _resetForm();
  }

  void _persist(List<UserDetailsModel> userDetails) {
    final encoded = jsonEncode(userDetails.map((e) => e.toJson()).toList());
    cacheHelper.saveData(key: 'userDetails', value: encoded);
  }

  void _loadUserDetails() {
    final encoded = cacheHelper.getData(key: 'userDetails');
    if (encoded == null) return;

    final decoded = jsonDecode(encoded) as List;
    final userDetails = decoded
        .map((e) => UserDetailsModel.fromJson(e as Map<String, dynamic>))
        .toList();

    emit(UserValidationInitial(userDetails: userDetails));
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
