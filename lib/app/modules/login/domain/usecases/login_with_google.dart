import 'package:edumath/app/modules/login/domain/entities/user_entity.dart';
import 'package:edumath/app/modules/login/domain/repositories/i_login_repository.dart';

abstract class ILoginWithGoogle {
  Future<UserEntity> call();
}

class LoginWithGoogle implements ILoginWithGoogle {
  final ILoginRepository loginRepository;

  LoginWithGoogle(this.loginRepository);

  @override
  Future<UserEntity> call() async {
    return await loginRepository.loginWithGoogle();
  }
}
