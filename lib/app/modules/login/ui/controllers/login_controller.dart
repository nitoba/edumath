import 'package:edumath/app/modules/login/domain/entities/user_entity.dart';
import 'package:edumath/app/modules/login/domain/usecases/get_user_logged.dart';
import 'package:edumath/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final ILoginWithGoogle loginWithGoogle;
  final IGetUserLogged getUserLogged;

  _LoginControllerBase(this.loginWithGoogle, this.getUserLogged);

  UserEntity user;

  login() async {
    user = await loginWithGoogle();
  }

  Future<void> getUser() async {
    final result = await getUserLogged();
    if (result.isLeft()) return;
    result.fold((l) => l, (r) => user = r);
    //Modular.to.pushReplacementNamed("/home", arguments: user);
  }
}
