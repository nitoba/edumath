import 'package:edumath/app/modules/login/domain/entities/user_entity.dart';
import 'package:edumath/app/modules/login/domain/repositories/i_login_repository.dart';

abstract class IGetUserLogged {
  Future<UserEntity> call();
}

class GetUserLogged implements IGetUserLogged {
  final ILoginRepository loginRepository;

  GetUserLogged(this.loginRepository);

  @override
  Future<UserEntity> call() async {
    final UserEntity userIsLogged = await loginRepository.getUserLogged();
    return userIsLogged;
  }
}
