import 'package:dartz/dartz.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/i_login_repository.dart';
import '../datasource/google_login_firebase.dart';

class LoginRepository implements ILoginRepository {
  final ILoginWithFirebase loginWithFirebase;

  LoginRepository(this.loginWithFirebase);

  @override
  Future<UserEntity> loginWithGoogle() async {
    return await loginWithFirebase.handleSingIn();
  }

  @override
  Future<Either<bool, UserEntity>> getUserLogged() async {
    final userLogged = await loginWithFirebase.handleGetUserLogged();
    return userLogged != null ? Right(userLogged) : Left(false);
  }
}
