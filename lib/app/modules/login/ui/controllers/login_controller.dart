import 'package:edumath/app/modules/login/domain/usecases/add_user_on_database.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../domain/entities/user_entity.dart';
import '../../domain/usecases/get_user_logged.dart';
import '../../domain/usecases/login_with_google.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final ILoginWithGoogle loginWithGoogle;
  final IGetUserLogged getUserLogged;
  final IAddUserOnDatabase addUserOnDatabase;

  _LoginControllerBase(
      this.loginWithGoogle, this.getUserLogged, this.addUserOnDatabase);

  UserEntity user;

  login() async {
    user = await loginWithGoogle();
    await addUserOnDatabase(user);
    Modular.to.pushReplacementNamed("/home", arguments: user);
  }

  Future<void> getUser() async {
    final result = await getUserLogged();
    if (result.isLeft()) return;
    result.fold((l) => l, (r) => user = r);
    Modular.to.pushReplacementNamed("/home", arguments: user);
  }
}
