import 'package:dartz/dartz.dart' as dartz;
import 'package:edumath/app/modules/login/domain/entities/user_entity.dart';
import 'package:edumath/app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:edumath/app/modules/login/domain/usecases/get_user_logged.dart';
import 'package:edumath/app/modules/login/ui/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:edumath/app/modules/login/login_module.dart';
import 'package:mockito/mockito.dart';

class LoginRepositoryMock extends Mock implements ILoginRepository {}

class MyNavigator extends Mock implements IModularNavigator {}

final user = UserEntity(userId: "asdhkj87as", userName: "Bruno Alves");
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initModule(LoginModule(), changeBinds: [
    //Bind((i)=> LoginController()),
    Bind<ILoginRepository>((i) => LoginRepositoryMock()),
  ]);
  ILoginRepository repository;
  LoginController loginController;
  IGetUserLogged getUserLogged;
  //
  setUp(() {
    Modular.navigatorDelegate = MyNavigator();
    repository = LoginModule.to.get<ILoginRepository>();
    getUserLogged = LoginModule.to.get<IGetUserLogged>();
    loginController = LoginModule.to.get<LoginController>();
  });

  group('LoginController Test', () {
    test("First Test", () {
      expect(loginController, isInstanceOf<LoginController>());
      expect(getUserLogged, isInstanceOf<GetUserLogged>());
      expect(repository, isInstanceOf<LoginRepositoryMock>());
    });

    test("should be return a user when call getUser", () async {
      when(repository.getUserLogged())
          .thenAnswer((_) async => dartz.Right(user));

      await loginController.getUser();

      expect(loginController.user, user);
    });

    test("should be return a null when call getUser without user", () async {
      loginController.user = null;
      when(repository.getUserLogged())
          .thenAnswer((_) async => dartz.Left(false));

      await loginController.getUser();

      expect(loginController.user, null);
    });
  });
}
