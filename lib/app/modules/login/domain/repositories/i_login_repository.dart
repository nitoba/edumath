import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';

abstract class ILoginRepository {
  Future<UserEntity> loginWithGoogle();
  Future<Either<bool, UserEntity>> getUserLogged();
}
