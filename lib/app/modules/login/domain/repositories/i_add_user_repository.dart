import 'package:edumath/app/modules/login/domain/entities/user_entity.dart';

abstract class IAddUserOnDatabaseRepository {
  Future<void> addUserOnDatabase(UserEntity user);
}
