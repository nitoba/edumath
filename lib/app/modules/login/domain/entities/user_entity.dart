import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String userName;
  final String userEmail;
  final String userPhoto;
  final Map<String, dynamic> userMetrics;

  UserEntity({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPhoto,
    this.userMetrics,
  });

  @override
  List<Object> get props =>
      [userId, userName, userEmail, userPhoto, userMetrics];
}
