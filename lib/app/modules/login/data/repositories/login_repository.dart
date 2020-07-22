import 'package:dartz/dartz.dart';
import 'package:edumath/app/modules/login/data/datasource/google_login_firebase.dart';
import 'package:edumath/app/modules/login/domain/entities/user_entity.dart';
import 'package:edumath/app/modules/login/domain/repositories/i_login_repository.dart';

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
