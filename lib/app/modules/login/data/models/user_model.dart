import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    @required String userId,
    @required String userName,
    @required String userEmail,
    @required String userPhoto,
  }) : super(
          userId: userId,
          userName: userName,
          userPhoto: userPhoto,
        );

  factory UserModel.fromFirebaseUser(
    FirebaseUser firebaseUser,
  ) {
    return UserModel(
      userId: firebaseUser.uid,
      userName: firebaseUser.displayName,
      userEmail: firebaseUser.email,
      userPhoto: firebaseUser.photoUrl,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userId'] = this.userId;
    data['userName'] = this.userName;
    data['userPhoto'] = this.userPhoto;
    return data;
  }
}
