import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

abstract class IAddUserOnFirestore {
  Future<void> addUserOnFirestore(UserModel user);
}

class AddUserOnFireStore implements IAddUserOnFirestore {
  final Firestore instance = Firestore.instance;
  @override
  Future<void> addUserOnFirestore(UserModel user) async {
    final isMatch = await _checkUserExistOnDatabase(user);
    if (isMatch) return;
    await instance.collection("users").add(user.toJson());
  }

  Future<bool> _checkUserExistOnDatabase(UserModel user) async {
    final isMatch = await instance
        .collection("users")
        .where('userId', isEqualTo: user.userId)
        .getDocuments();
    if (isMatch.documents.isNotEmpty) return true;
    return false;
  }
}
