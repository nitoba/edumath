import 'package:cloud_firestore_mocks/cloud_firestore_mocks.dart';
import 'package:edumath/app/modules/login/data/models/user_model.dart';
import 'package:edumath/app/modules/login/domain/repositories/i_add_user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class AddUserOnDatabaseRepositoryMock extends Mock
    implements IAddUserOnDatabaseRepository {}

final user = UserModel(
  userId: "asdhkj87as",
  userName: "Bruno Alves",
  userEmail: "brukum2@gmail.com",
  userPhoto: "http://minhaphoto.com",
);

class FireStoreMock {
  final instance = MockFirestoreInstance();

  add(UserModel user) async {
    final isMatch = await _checkUserExistOnDatabase(user);
    if (isMatch) return "user already exists";
    await instance.collection('users').add(user.toJson());
    final result = await instance
        .collection('users')
        .where('userId', isEqualTo: user.userId)
        .getDocuments();
    return result.documents.first.data;
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

void main() {
  FireStoreMock fireStoreMock;
  setUp(() {
    fireStoreMock = FireStoreMock();
  });

  group("Use Case add user on database", () {
    test('should be return an user if was registred on database', () async {
      final result = await fireStoreMock.add(user);

      expect(result, user.toJson());
    });

    test('if already exist an user on database should not be resgistred',
        () async {
      await fireStoreMock.add(user);
      final result = await fireStoreMock.add(user);

      expect(result, "user already exists");
    });
  });
}
