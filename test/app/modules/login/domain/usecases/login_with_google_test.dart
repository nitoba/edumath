import 'package:edumath/app/modules/login/domain/entities/user_entity.dart';
import 'package:edumath/app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:edumath/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class LoginRepositoryMock extends Mock implements ILoginRepository {}

final user = UserEntity(
  userId: "asdhkj87as",
  userName: "Bruno Alves",
);

void main() {
  ILoginRepository repository;
  LoginWithGoogle loginWithGoogle;

  setUp(() {
    repository = LoginRepositoryMock();
    loginWithGoogle = LoginWithGoogle(repository);
  });

  test('shold be return an user when called login with Google', () async {
    when(repository.loginWithGoogle()).thenAnswer((_) async => user);

    final result = await loginWithGoogle();

    expect(result, user);
    verify(repository.loginWithGoogle());
  });
}
