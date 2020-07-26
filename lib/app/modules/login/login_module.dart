import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../app_module.dart';
import 'data/datasource/add_user_on_firestore.dart';
import 'data/datasource/google_login_firebase.dart';
import 'data/repositories/add_user_repository.dart';
import 'data/repositories/login_repository.dart';
import 'domain/repositories/i_add_user_repository.dart';
import 'domain/repositories/i_login_repository.dart';
import 'domain/usecases/add_user_on_database.dart';
import 'domain/usecases/get_user_logged.dart';
import 'domain/usecases/login_with_google.dart';
import 'ui/controllers/login_controller.dart';
import 'ui/pages/login_page.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        // controllers
        Bind((i) => LoginController(i<ILoginWithGoogle>(), i<IGetUserLogged>(),
            i<IAddUserOnDatabase>())),
        // use cases
        Bind<ILoginWithGoogle>((i) => LoginWithGoogle(i<ILoginRepository>())),
        Bind<IGetUserLogged>((i) => GetUserLogged(i<ILoginRepository>())),
        Bind<IAddUserOnDatabase>(
            (i) => AddUserOnDatabase(i<IAddUserOnDatabaseRepository>())),
        // repository implementation of data layer
        Bind<ILoginRepository>((i) => LoginRepository(i<ILoginWithFirebase>())),
        Bind<IAddUserOnDatabaseRepository>(
            (i) => AddUserOnDatabaseRepository(i<IAddUserOnFirestore>())),
        // class that provide the data | datasource
        Bind<ILoginWithFirebase>((i) => LoginWithFirebase()),
        Bind<IAddUserOnFirestore>((i) => AddUserOnFireStore(i<Firestore>())),
        Bind<Firestore>((i) => AppModule.to.get<Firestore>()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (context, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
