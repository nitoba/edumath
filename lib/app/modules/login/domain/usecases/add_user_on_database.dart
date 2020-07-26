import '../entities/user_entity.dart';
import '../repositories/i_add_user_repository.dart';

abstract class IAddUserOnDatabase {
  Future<void> call(UserEntity user);
}

class AddUserOnDatabase implements IAddUserOnDatabase {
  final IAddUserOnDatabaseRepository addUserOnDatabaseRepository;

  AddUserOnDatabase(this.addUserOnDatabaseRepository);
  @override
  Future<void> call(UserEntity user) async {
    await addUserOnDatabaseRepository.addUserOnDatabase(user);
  }
}
