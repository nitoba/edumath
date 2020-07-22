import 'package:edumath/app/modules/login/domain/usecases/get_user_logged.dart';
import 'package:edumath/app/modules/login/domain/usecases/login_with_google.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final ILoginWithGoogle loginWithGoogle;
  final IGetUserLogged getUserLogged;

  _LoginControllerBase(this.loginWithGoogle, this.getUserLogged);

  login() async {
    final result = await loginWithGoogle();
    if (result == null) return;
    print(result.userId);
    print(result.userName);
    print(result.userEmail);
    print(result.userPhoto);
  }

  getUser() async {
    final result = await getUserLogged();
    if (result == null) return;
    print(result.userId);
    print(result.userName);
    print(result.userEmail);
    print(result.userPhoto);
  }
}
