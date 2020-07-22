import 'package:dartz/dartz.dart';
import 'package:edumath/app/modules/login/domain/entities/user_entity.dart';
import 'package:edumath/app/modules/login/domain/repositories/i_login_repository.dart';

abstract class IGetUserLogged {
  Future<Either<bool, UserEntity>> call();
}

class GetUserLogged implements IGetUserLogged {
  final ILoginRepository loginRepository;

  GetUserLogged(this.loginRepository);

  @override
  Future<Either<bool, UserEntity>> call() async {
    return await loginRepository.getUserLogged();
  }
}
