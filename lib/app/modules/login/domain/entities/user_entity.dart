import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String userName;
  final String userEmail;
  final String userPhoto;

  UserEntity({
    this.userId,
    this.userName,
    this.userEmail,
    this.userPhoto,
  });

  @override
  List<Object> get props => [userId, userName, userEmail, userPhoto];
}
