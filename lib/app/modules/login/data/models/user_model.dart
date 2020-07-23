import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    @required userId,
    @required userName,
    @required userPhoto,
  }) : super(
          userId: userId,
          userName: userName,
          userPhoto: userPhoto,
        );

  factory UserModel.fromFirebaseUser(FirebaseUser firebaseUser) {
    return UserModel(
      userId: firebaseUser.uid,
      userName: firebaseUser.displayName,
      userPhoto: firebaseUser.photoUrl,
    );
  }
}
