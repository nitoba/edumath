import 'package:dartz/dartz.dart';
import 'package:edumath/app/modules/login/domain/entities/user_entity.dart';
import 'package:edumath/app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:edumath/app/modules/login/domain/usecases/get_user_logged.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LoginRepositoryMock extends Mock implements ILoginRepository {}

final user = UserEntity(userId: "asdhkj87as", userName: "Bruno Alves");
void main() {
  ILoginRepository repository;
  GetUserLogged getUserLogged;
  setUp(() {
    repository = LoginRepositoryMock();
    getUserLogged = GetUserLogged(repository);
  });

  group("Use Case get if user is logged", () {
    test('should be return an user if he already logged', () async {
      when(repository.getUserLogged()).thenAnswer((_) async => Right(user));

      final result = await getUserLogged();

      expect(result, Right(user));
      verify(repository.getUserLogged());
    });

    test('should be return null if user is not logged', () async {
      when(repository.getUserLogged()).thenAnswer((_) async => Left(false));

      final result = await getUserLogged();

      expect(result, Left(false));
      verify(repository.getUserLogged());
    });
  });
}
