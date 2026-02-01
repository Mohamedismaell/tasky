import 'package:equatable/equatable.dart';

class UserDetailsModel extends Equatable {
  final String userName;
  final String motivationQuote;
  final String? imagePath;

  const UserDetailsModel({
    required this.userName,
    required this.motivationQuote,
    this.imagePath,
  });
  UserDetailsModel copyWith({
    String? userName,
    String? motivationQuote,
    String? imagePath,
  }) {
    return UserDetailsModel(
      userName: userName ?? this.userName,
      motivationQuote: motivationQuote ?? this.motivationQuote,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) {
    return UserDetailsModel(
      userName: json['userName']?.toString() ?? '',
      motivationQuote: json['motivationQuote']?.toString() ?? '',
      imagePath: json['imagePath'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userName': userName,
      'motivationQuote': motivationQuote,
      'imagePath': imagePath,
    };
  }

  @override
  String toString() {
    return 'UserDetails(userName: $userName, motivationQuote: $motivationQuote, imagePath: $imagePath)';
  }

  @override
  List<Object?> get props => [userName, motivationQuote, imagePath];
}
