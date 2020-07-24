import 'package:edumath/app/modules/login/data/datasource/add_user_on_firestore.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/i_add_user_repository.dart';

class AddUserOnDatabaseRepository implements IAddUserOnDatabaseRepository {
  final IAddUserOnFirestore addUserOnFiretore;

  AddUserOnDatabaseRepository(this.addUserOnFiretore);

  @override
  Future<void> addUserOnDatabase(UserEntity user) async {
    await addUserOnFiretore.addUserOnFirestore(user);
  }
}
