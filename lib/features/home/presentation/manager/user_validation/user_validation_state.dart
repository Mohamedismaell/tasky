part of 'user_validation_cubit.dart';

sealed class UserValidationState extends Equatable {
  const UserValidationState({required this.userDetails});
  final UserDetailsModel userDetails;

  @override
  List<Object?> get props => [userDetails];
}

final class UserValidationInitial extends UserValidationState {
  const UserValidationInitial({required super.userDetails});
}

final class UserValidationSuccess extends UserValidationState {
  const UserValidationSuccess({required super.userDetails});
}

final class UserValidationFailure extends UserValidationState {
  final String? userNameError;
  final String? motivationQuoteError;

  const UserValidationFailure({
    this.userNameError,
    this.motivationQuoteError,
    required super.userDetails,
  });

  @override
  List<Object?> get props => [userNameError, motivationQuoteError];
}
