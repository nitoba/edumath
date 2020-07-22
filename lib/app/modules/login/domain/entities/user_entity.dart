import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userId;
  final String userName;
  final String userPhoto;

  UserEntity({
    this.userId,
    this.userName,
    this.userPhoto,
  });

  @override
  List<Object> get props => [userId, userName, userPhoto];
}
