import 'package:edumath/app/modules/login/domain/entities/user_entity.dart';

abstract class ILoginRepository {
  Future<UserEntity> loginWithGoogle();
  Future<UserEntity> getUserLogged();
}
