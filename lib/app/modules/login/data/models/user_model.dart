import 'package:edumath/app/modules/login/domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

class UserModel extends UserEntity {
  UserModel({
    @required userId,
    @required userName,
    @required userEmail,
    @required userPhoto,
  }) : super(
          userId: userId,
          userName: userName,
          userEmail: userEmail,
          userPhoto: userPhoto,
        );

  factory UserModel.fromFirebaseUser(FirebaseUser firebaseUser) {
    return UserModel(
      userId: firebaseUser.uid,
      userName: firebaseUser.displayName,
      userEmail: firebaseUser.email,
      userPhoto: firebaseUser.photoUrl,
    );
  }
}
