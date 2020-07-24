import 'package:edumath/app/modules/login/data/datasource/google_login_firebase.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }

  logout() async {
    final login = LoginWithFirebase();
    await login.logout();
    Modular.to.pushNamedAndRemoveUntil('/', (_) => false);
  }
}
