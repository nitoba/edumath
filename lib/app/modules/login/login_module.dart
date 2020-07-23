import 'package:edumath/app/modules/login/ui/pages/login_page.dart';

import 'ui/controllers/login_controller.dart';
import 'package:edumath/app/modules/login/data/datasource/google_login_firebase.dart';
import 'package:edumath/app/modules/login/domain/repositories/i_login_repository.dart';
import 'package:edumath/app/modules/login/domain/usecases/get_user_logged.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/repositories/login_repository.dart';
import 'domain/usecases/login_with_google.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // controllers
        Bind(
            (i) => LoginController(i<ILoginWithGoogle>(), i<IGetUserLogged>())),
        // use cases
        Bind<ILoginWithGoogle>((i) => LoginWithGoogle(i<ILoginRepository>())),
        Bind<IGetUserLogged>((i) => GetUserLogged(i<ILoginRepository>())),
        // repository implementation of data layer
        Bind<ILoginRepository>((i) => LoginRepository(i<ILoginWithFirebase>())),
        // class that provide the data | datasource
        Bind<ILoginWithFirebase>((i) => LoginWithFirebase()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (context, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
