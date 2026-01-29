import 'package:equatable/equatable.dart';

class UserDetailsModel extends Equatable {
  final String userName;
  final String motivationQuote;

  const UserDetailsModel({
    required this.userName,
    required this.motivationQuote,
  });
  UserDetailsModel copyWith({String? userName, String? motivationQuote}) {
    return UserDetailsModel(
      userName: userName ?? this.userName,
      motivationQuote: motivationQuote ?? this.motivationQuote,
    );
  }

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      userName: json['userName'] as String,
      motivationQuote: json['motivationQuote'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'userName': userName, 'motivationQuote': motivationQuote};
  }

  @override
  String toString() {
    return 'UserDetails(userName: $userName, motivationQuote: $motivationQuote)';
  }

  @override
  List<Object?> get props => [userName, motivationQuote];
}
